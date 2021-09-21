import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postino/business_login/utils/theme.dart';
import 'package:postino/router.dart' as router;
import 'package:postino/services/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await Firebase.initializeApp().whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fridayy',
      theme: PostinoThemes.lightTheme,
      darkTheme: PostinoThemes.lightTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;
  FirebaseAuth auth = FirebaseAuth.instance;

  signUp() async {
    if (kIsWeb) {
      navigationService.showSnackBar('In Progress');
    } else {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91 7985434482',
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          navigationService.showSnackBar('Code Retrieved');
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          navigationService.showSnackBar('Verification Complete');
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          navigationService.showSnackBar('Code Sent');
          final PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId,
            smsCode: "123456",
          );

          // Sign the user in (or link) with the credential
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);
          print(userCredential.user?.uid.hashCode);
        },
        verificationFailed: (FirebaseAuthException error) {
          print(error.toString());
          navigationService.showSnackBar('Verification Failed $error');
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => signUp(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
