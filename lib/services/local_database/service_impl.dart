import 'package:hive/hive.dart';
import 'package:postino/business_login/models/user_model.dart';
import 'package:postino/services/local_database/service.dart';

class LocalDatabaseServiceImpl extends LocalDatabaseService {
  @override
  Future savePrivateKey(String privateKey) async {
    final e2eeBox = await Hive.openBox('e2eeBox');
    e2eeBox.put('privateKey', privateKey);
  }

  @override
  Future saveIsAuthorisedOnce() async {
    final app = await Hive.openBox('app');
    app.put('isAuthorisedOnce', true);
  }

  @override
  Future<String> getPrivateKey() async {
    final e2eeBox = await Hive.openBox('e2eeBox');
    final String? privateKey = e2eeBox.get('privateKey') as String?;
    return privateKey ?? '';
  }

  @override
  Future getIsAuthorisesOnce() async {
    final app = await Hive.openBox('app');
    return app.get('isAuthorisedOnce') ?? false;
  }

  @override
  Future saveMyConnections(List<UserModel> myConnections) async {
    final Box<UserModel> myConnectionBox = Hive.box<UserModel>('myConnections');
    myConnectionBox.clear();
    myConnectionBox.addAll(myConnections);
  }

  @override
  Future<List<UserModel>> getMyConnections() async {
    final Box<UserModel> myConnectionBox = Hive.box<UserModel>('myConnections');
    final List<UserModel> connections = [];
    myConnectionBox.values.forEach((element) {
      connections.add(element);
    });
    return connections;
  }
}
