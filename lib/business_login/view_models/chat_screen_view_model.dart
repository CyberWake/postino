import 'package:flutter/material.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';
import 'package:postino/services/service_locator.dart';

class ChatScreenViewModel extends BaseModel {
  final TextEditingController messageBox = TextEditingController();

  sendMessage(String userId, String encryptionKey) async {
    if (messageBox.text.isNotEmpty) {
      final encryptedMessage =
          await e2eeService.encryptMessage(messageBox.text, encryptionKey);
      firebaseService.sendMessage(userId, encryptedMessage);
    }
  }
}
