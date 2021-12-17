import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postino/business_login/models/user_model.dart';
import 'package:postino/business_login/utils/svg_images.dart';
import 'package:postino/business_login/view_models/chat_screen_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/views/base_view.dart';
import 'package:postino/ui/widgets/custom_square_button.dart';

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({Key? key, required this.chatUser}) : super(key: key);
  final UserModel chatUser;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatScreenViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: sizeConfig.getPropWidth(25),
              horizontal: sizeConfig.getPropWidth(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomSquareButton(
                      size: 48,
                      borderRadius: 15,
                      backgroundColor: const Color(0xFFE5C8B8),
                      onTap: navigationService.pop,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: sizeConfig.getPropWidth(19),
                    ),
                    Expanded(
                      child: Text(
                        chatUser.userName,
                        style: TextStyle(
                            fontSize: sizeConfig.getPropHeight(26),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1A3764)),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CustomSquareButton(
                      size: 48,
                      borderRadius: 15,
                      backgroundColor: const Color(0xFF54C1DD),
                      onTap: () {},
                      icon: const Icon(
                        Icons.call_rounded,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: sizeConfig.getPropWidth(9),
                    ),
                    CustomSquareButton(
                      size: 48,
                      borderRadius: 15,
                      backgroundColor: const Color(0xFF3A7DB1),
                      onTap: () {},
                      icon: const Icon(
                        Icons.video_camera_front_outlined,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: sizeConfig.getPropHeight(36),
                        alignment: Alignment.centerRight,
                        child: SvgPicture.string(SvgImages.threeDotMenuIcon),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(sizeConfig.getPropWidth(20)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: sizeConfig.getPropWidth(14),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: sizeConfig.getPropHeight(16),
                        ),
                        child: SvgPicture.string(SvgImages.emojiIcon),
                      ),
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: sizeConfig.getPropHeight(64),
                            maxHeight: sizeConfig.getPropHeight(300),
                          ),
                          child: TextFormField(
                            controller: model.messageBox,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Write your message',
                              hintStyle: TextStyle(
                                fontSize: sizeConfig.getPropHeight(16),
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1A3764),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: sizeConfig.getPropHeight(8),
                        ),
                        child: CustomSquareButton(
                          size: 48,
                          borderRadius: 15,
                          backgroundColor: const Color(0xFF54C1DD),
                          onTap: navigationService.pop,
                          icon: const Icon(
                            Icons.attach_file_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sizeConfig.getPropWidth(7),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: sizeConfig.getPropHeight(8),
                        ),
                        child: CustomSquareButton(
                          size: 48,
                          borderRadius: 15,
                          backgroundColor: const Color(0xFFE5C8B8),
                          onTap: () => model.sendMessage(
                              chatUser.id, chatUser.publicKey),
                          icon: const Icon(
                            Icons.send_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sizeConfig.getPropWidth(7),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
