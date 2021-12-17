import 'package:postino/business_login/models/user_model.dart';

abstract class LocalDatabaseService {
  Future savePrivateKey(String privateKey);
  Future saveIsAuthorisedOnce();
  Future saveMyConnections(List<UserModel> myConnections);
  Future<String> getPrivateKey();
  Future getIsAuthorisesOnce();
  Future<List<UserModel>> getMyConnections();
}
