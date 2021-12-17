import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/widgets/custom_alert_dialog.dart';

class AuthScreenViewModel extends BaseModel {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController otp = TextEditingController();

  PageController controller = PageController(
    initialPage: 0,
  );

  int page = 0;
  String verificationId = '';

  void scrollListener() {
    page = controller.page!.round();
    phone.clear();
    otp.clear();
    notifyListeners();
  }

  void changeTab(int page) {
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  init() {
    controller.addListener(scrollListener);
  }

  void sendOTPRequest() {
    firebaseService.requestOtp(
      "+91 ${phone.text}",
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        otp.text = phoneAuthCredential.smsCode!;
        firebaseService.authorizeUser(phoneAuthCredential, username: name.text);
      },
      verificationFailed: (FirebaseAuthException authException) {
        verificationId = '';
        navigationService.showSnackBar(
          'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}',
        );
      },
      codeSent: (String verificationID, int? forceResendingToken) async {
        navigationService
            .showSnackBar('Please check your phone for the verification code.');
        verificationId = verificationID;
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationId = verificationID;
      },
    );
  }

  void authenticate() {
    if (verificationId.isNotEmpty && otp.text.isNotEmpty) {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.text,
      );
      firebaseService.authorizeUser(credential, username: name.text);
    } else if (verificationId.isNotEmpty && otp.text.isEmpty) {
      navigationService.showSnackBar('Enter the OTP received to continue');
    } else {
      sendOTPRequest();
    }
  }

  void requestOTPDialog() {
    if (page == 0) {
      if (phone.text.isNotEmpty) {
        if (verificationId.isEmpty) {
          navigationService.pushDialog(
            CustomAlertDialog(
              success: () {
                sendOTPRequest();
                navigationService.pop();
              },
              secondaryButtonText: 'Change',
              secondaryButtonTap: () {
                navigationService.pop();
                phone.clear();
              },
              dialogSubTitle:
                  'Make sure the number entered is present in current device to continue or change number!',
            ),
          );
        } else {
          authenticate();
        }
      } else {
        navigationService.showSnackBar('We need your number to log you in');
      }
    } else if (page == 1) {
      if (name.text.isNotEmpty) {
        if (phone.text.isNotEmpty) {
          if (verificationId.isEmpty) {
            navigationService.pushDialog(
              CustomAlertDialog(
                success: () {
                  sendOTPRequest();
                  navigationService.pop();
                },
                secondaryButtonText: 'Change',
                secondaryButtonTap: () {
                  navigationService.pop();
                  phone.clear();
                },
                dialogSubTitle:
                    'Make sure the number entered is present in current device to continue or change number!',
              ),
            );
          } else {
            authenticate();
          }
        } else {
          navigationService
              .showSnackBar('We need your number to create your account');
        }
      } else {
        navigationService.showSnackBar('Please provide us with your name');
      }
    } else {
      navigationService
          .showSnackBar('Something strange happened. Let us know about it.');
    }
  }
}
