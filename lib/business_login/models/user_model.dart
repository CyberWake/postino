import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  UserModel({
    required this.id,
    required this.phoneNumber,
    required this.userName,
    required this.publicKey,
    this.imageUrl,
  });

  factory UserModel.fromJsonQueryDocumentSnapshot(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] as String,
      phoneNumber: data['phoneNumber'] as String,
      userName: data['userName'] as String,
      publicKey: data['publicKey'] as String,
      imageUrl: data['imageUrl'] as String?,
    );
  }

  @HiveField(0)
  String id;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  String userName;
  @HiveField(3)
  String publicKey;
  @HiveField(4)
  String? imageUrl;
}
