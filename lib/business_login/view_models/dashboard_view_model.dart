import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';

class DashboardViewModel extends BaseModel {
  final drawerController = ZoomDrawerController();
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  toggleDrawer() {
    drawerController.toggle!();
  }

  changeCurrentPageIndex(int index) {
    currentPage.value = index;
    toggleDrawer();
    notifyListeners();
  }
}
