import 'package:cps_soft/data/repository/user_repository.dart';
import 'package:cps_soft/domain/entities/user.dart';

class PostUser {
  final UserRepository userRepository;
  PostUser({required this.userRepository});

  Future post({required User user}) async {
    final response = await userRepository.postUser(user: user);
    print('Post User Response : $response');
    return response;
  }
}
