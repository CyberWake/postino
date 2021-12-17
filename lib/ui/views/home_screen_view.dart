import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:postino/business_login/utils/routing_constants.dart';
import 'package:postino/business_login/utils/svg_images.dart';
import 'package:postino/business_login/view_models/home_screen_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/views/base_view.dart';
import 'package:postino/ui/widgets/custom_image_avatar.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key, required this.toggleDrawer})
      : super(key: key);
  final void Function() toggleDrawer;

  void showMyContacts(HomeScreenViewModel model) {
    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: sizeConfig.getPropHeight(786),
        minWidth: sizeConfig.getPropWidth(411),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(sizeConfig.getPropHeight(36)),
          topRight: Radius.circular(sizeConfig.getPropHeight(36)),
        ),
      ),
      barrierColor: const Color(0xFF1A3764).withOpacity(0.8),
      backgroundColor: const Color(0xFFF7F6F2),
      context: navigationService.navigatorKey.currentContext!,
      isScrollControlled: true,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: sizeConfig.getPropHeight(14)),
              child: SizedBox(
                width: sizeConfig.getPropWidth(40),
                child: const Divider(
                  thickness: 3.0,
                  color: Color(0xFFC6D5EC),
                ),
              ),
            ),
            buildSearchField(padding: 36),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: sizeConfig.getPropHeight(25),
                horizontal: sizeConfig.getPropWidth(36),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: model.myConnections.isEmpty
                    ? 1
                    : model.myConnections.length,
                itemBuilder: (context, index) {
                  if (model.myConnections.isEmpty) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.only(
                      bottom: sizeConfig.getPropHeight(26.77),
                    ),
                    child: InkWell(
                      onTap: () {
                        navigationService.pop();
                        navigationService.pushScreen(Routes.chat,
                            arguments: model.myConnections[index]);
                      },
                      customBorder: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(sizeConfig.getPropWidth(19)),
                      ),
                      child: Row(
                        children: [
                          CustomImageAvatar(
                            size: 60,
                            borderRadius: 19,
                            elevation: 0.0,
                            imageUrl: model.myConnections[index].imageUrl,
                            text: model.myConnections[index].userName,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: sizeConfig.getPropWidth(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model.myConnections[index].userName,
                                  style: TextStyle(
                                    fontSize: sizeConfig.getPropHeight(20),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  model.myConnections[index].phoneNumber,
                                  style: TextStyle(
                                    fontSize: sizeConfig.getPropHeight(16),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF94A2B8),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

  Widget buildSearchField({double? padding}) {
    return Padding(
      padding: EdgeInsets.only(top: sizeConfig.getPropHeight(padding ?? 20)),
      child: Container(
        height: sizeConfig.getPropHeight(55),
        width: sizeConfig.getPropWidth(342),
        padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getPropWidth(10),
          vertical: sizeConfig.getPropHeight(10),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(sizeConfig.getPropHeight(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: sizeConfig.getPropWidth(260),
              child: TextFormField(
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
                  hintText: 'Search Here',
                  hintStyle: TextStyle(
                    fontSize: sizeConfig.getPropHeight(16),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A3764),
                  ),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF1A3764),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: sizeConfig.getPropHeight(36),
                      left: sizeConfig.getPropWidth(36),
                      right: sizeConfig.getPropWidth(36),
                    ),
                    child: Row(
                      children: [
                        CustomImageAvatar(
                          size: 55,
                          borderRadius: 15,
                          elevation: 1.0,
                          onTap: toggleDrawer,
                          text: firebaseService.user?.displayName,
                        ),
                        const Spacer(),
                        Text(
                          'Inbox',
                          style: TextStyle(
                            color: const Color(0xFF1A3764),
                            fontWeight: FontWeight.bold,
                            fontSize: sizeConfig.getPropHeight(26),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: toggleDrawer,
                          child: Container(
                            width: sizeConfig.getPropHeight(55),
                            alignment: Alignment.centerRight,
                            child:
                                SvgPicture.string(SvgImages.threeDotMenuIcon),
                          ),
                        )
                      ],
                    ),
                  ),
                  buildSearchField(),
                ],
              ),
              Positioned(
                bottom: sizeConfig.getPropHeight(41),
                right: sizeConfig.getPropWidth(33),
                child: Material(
                  color: const Color(0xFFE5C8B8),
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(sizeConfig.getPropWidth(50)),
                    ),
                    onTap: () => showMyContacts(model),
                    child: Container(
                      height: sizeConfig.getPropWidth(55),
                      width: sizeConfig.getPropWidth(55),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: SvgPicture.string(
                        SvgImages.addChatIcon,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
