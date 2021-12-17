import 'package:firebase_auth/firebase_auth.dart';
import 'package:postino/business_login/models/user_model.dart';

abstract class FirebaseService {
  bool getLoggedInUser();
  Future requestOtp(
    String phoneNumber, {
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });
  Future authorizeUser(PhoneAuthCredential credential, {String? username});
  Future login(User user);
  Future signup(User user);
  Future logout();
  Future<List<UserModel>> getMyConnections();
  Future sendMessage(String userId, String message);
}
