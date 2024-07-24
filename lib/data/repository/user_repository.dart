import 'package:cps_soft/data/model/post_user_model.dart';
import 'package:cps_soft/data/model/user_model.dart';
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

  Future postUser({required User user}) async {
    final userReq = PostUserModel(
      name: user.name,
      email: user.email,
      address: user.address,
      phoneNumber: user.phoneNumber,
      city: user.city,
    );
    final response = await userService.postUser(user: userReq);
    print('User Repository Response : $response');
    return response;
  }
}
