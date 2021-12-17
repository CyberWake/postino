import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:postino/business_login/utils/svg_images.dart';
import 'package:postino/business_login/view_models/dashboard_view_model.dart';
import 'package:postino/services/service_locator.dart';
import 'package:postino/ui/views/base_view.dart';
import 'package:postino/ui/views/home_screen_view.dart';
import 'package:postino/ui/widgets/custom_image_avatar.dart';
import 'package:postino/ui/widgets/custom_square_button.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget menuScreen(DashboardViewModel model) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A7DB1),
      body: Padding(
        padding: EdgeInsets.only(
          left: sizeConfig.getPropHeight(36),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: sizeConfig.getPropHeight(36),
              ),
              child: Row(
                children: [
                  CustomSquareButton(
                    size: 48,
                    borderRadius: 15,
                    onTap: model.toggleDrawer,
                    backgroundColor: const Color(0xFF1A3764),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: sizeConfig.getPropHeight(52),
              ),
              child: CustomImageAvatar(
                size: 75,
                borderRadius: 23,
                text: firebaseService.user?.displayName,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: sizeConfig.getPropHeight(7.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    firebaseService.user?.displayName ?? "Username",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sizeConfig.getPropHeight(30),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: sizeConfig.getPropHeight(16),
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFE5C8B8),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sizeConfig.getPropHeight(23),
            ),
            drawerItem(
              () => model.changeCurrentPageIndex(0),
              'Chat',
              SvgImages.drawerChatIcon,
            ),
            drawerItem(
              () => model.changeCurrentPageIndex(1),
              'Notifications',
              SvgImages.drawerNotificationIcon,
            ),
            drawerItem(
              () => model.changeCurrentPageIndex(2),
              'App Info',
              SvgImages.drawerAppInfoIcon,
            ),
            drawerItem(
              () => model.changeCurrentPageIndex(3),
              'Help',
              SvgImages.drawerHelpIcon,
            ),
            SizedBox(
              height: sizeConfig.getPropHeight(112),
            ),
            drawerItem(
              () {
                firebaseService.logout();
              },
              'Logout',
              SvgImages.drawerLogoutIcon,
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(void Function()? onTap, String itemName, String icon) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: sizeConfig.getPropHeight(23),
      ),
      child: InkWell(
        onTap: onTap,
        child: FittedBox(
          child: Row(
            children: [
              SvgPicture.string(icon),
              SizedBox(
                width: sizeConfig.getPropWidth(18),
              ),
              Text(
                itemName,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: sizeConfig.getPropHeight(20),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardViewModel>(
      builder: (context, model, child) {
        return ZoomDrawer(
          style: DrawerStyle.Style1,
          controller: model.drawerController,
          menuScreen: menuScreen(model),
          mainScreen: IndexedStack(
            index: model.currentPage.value,
            children: [
              HomeScreenView(
                toggleDrawer: model.toggleDrawer,
              ),
              HomeScreenView(
                toggleDrawer: model.toggleDrawer,
              ),
              HomeScreenView(
                toggleDrawer: model.toggleDrawer,
              ),
              HomeScreenView(
                toggleDrawer: model.toggleDrawer,
              ),
            ],
          ),
          duration: const Duration(milliseconds: 500),
          borderRadius: 24.0,
          showShadow: true,
          angle: -12.0,
          backgroundColor: Colors.grey,
          slideWidth: sizeConfig.getPropWidth(300.15),
        );
      },
    );
  }
}
