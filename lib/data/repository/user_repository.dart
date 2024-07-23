import 'package:cps_soft/data/services/user_service.dart';
import 'package:cps_soft/domain/entities/user.dart';

class UserRepository {
  final UserService userService;
  UserRepository({required this.userService});
  Future<List<User>> fetchUsers() async {
    final userModels = await userService.fetchUsers();
    return userModels
        .map((userModels) => User(
              id: userModels.id,
              name: userModels.name,
              email: userModels.email,
              address: userModels.address,
              phoneNumber: userModels.phoneNumber,
              city: userModels.city,
              profileImageUrl: userModels.profileImageUrl,
            ))
        .toList();
  }
}
