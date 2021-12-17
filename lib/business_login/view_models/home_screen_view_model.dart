import 'package:postino/business_login/models/user_model.dart';
import 'package:postino/business_login/view_models/base_view_model.dart';
import 'package:postino/services/service_locator.dart';

class HomeScreenViewModel extends BaseModel {
  List<UserModel> myConnections = [];
  Future init() async {
    myConnections = await localDatabaseService.getMyConnections();
    if (myConnections.isEmpty) {
      myConnections = await firebaseService.getMyConnections();
    }
    notifyListeners();
  }
}
