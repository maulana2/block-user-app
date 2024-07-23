import 'package:cps_soft/data/repository/user_repository.dart';
import 'package:cps_soft/domain/entities/user.dart';

class GetUsers {
  final UserRepository userRepository;
  GetUsers({required this.userRepository});

  Future<List<User>> call() async {
    List<User> users = await userRepository.fetchUsers();
    print('User Repository: ${users[0].name}');
    return users;
  }
}
