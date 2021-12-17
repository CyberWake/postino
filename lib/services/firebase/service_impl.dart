import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:postino/business_login/models/user_model.dart';
import 'package:postino/business_login/utils/routing_constants.dart';
import 'package:postino/services/Firebase/service.dart';
import 'package:postino/services/service_locator.dart';

class FirebaseServiceImpl extends FirebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User? user;

  @override
  bool getLoggedInUser() {
    user = _auth.currentUser;
    return _auth.currentUser != null;
  }

  @override
  Future requestOtp(
    String phoneNumber, {
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  }) async {
    _auth = FirebaseAuth.instance;
    print('otp requesting');
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future authorizeUser(
    PhoneAuthCredential credential, {
    String? username,
  }) async {
    try {
      print('authorising');
      user = (await _auth.signInWithCredential(credential)).user;
      _firestore.collection('users').doc(user?.uid).get().then((value) {
        if (value.exists) {
          login(user!);
        } else {
          user!.updateDisplayName(username);
          signup(user!);
        }
      });
    } on Exception catch (e) {
      if (e.toString().contains("[firebase_auth/invalid-verification-code]")) {
        navigationService.showSnackBar('Please try entering correct OTP');
      } else {
        print(e.toString());
      }
    }
  }

  @override
  Future login(User user) async {
    localDatabaseService.saveIsAuthorisedOnce();
    final privateKey = await e2eeService.generateKeys();
    try {
      _firestore.collection('users').doc(user.uid).update({
        "privateKey": privateKey,
      });
      navigationService.removeAllAndPush(Routes.dashboard, Routes.splashScreen);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Future signup(User user) async {
    localDatabaseService.saveIsAuthorisedOnce();
    final privateKey = await e2eeService.generateKeys();
    try {
      _firestore.collection('users').doc(user.uid).set({
        "uid": user.uid,
        "phoneNumber": user.phoneNumber,
        "userName": user.displayName,
        "privateKey": privateKey,
      });
      navigationService.removeAllAndPush(Routes.dashboard, Routes.splashScreen);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Future logout() async {
    _auth.signOut();
    navigationService.removeAllAndPush(Routes.auth, Routes.splashScreen);
  }

  @override
  Future<List<UserModel>> getMyConnections() async {
    final List<String> connectionsIn = await deviceService.getDeviceContacts();
    final List<UserModel> connection = [];
    try {
      _firestore.collection('users').where("phoneNumber").get().then((value) {
        value.docs.forEach((element) {
          if (connectionsIn.contains(element.data()['phoneNumber'])) {
            connection
                .add(UserModel.fromJsonQueryDocumentSnapshot(element.data()));
          }
        });
      });
      localDatabaseService.saveMyConnections(connection);
      return connection;
    } on Exception catch (e) {
      navigationService.showSnackBar(e.toString());
      return connection;
    }
  }

  @override
  Future sendMessage(String userId, String message) async {
    final docName = userId.hashCode > user!.uid.hashCode
        ? '$userId-${user!.uid}'
        : '${user!.uid}-$userId';
    _firestore
        .collection('chats')
        .doc(docName)
        .collection('messages')
        .doc()
        .set({'message': message});
  }
}
