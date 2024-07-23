import 'package:cps_soft/data/repository/user_repository.dart';
import 'package:cps_soft/data/services/user_service.dart';
import 'package:cps_soft/domain/usecase/get_users.dart';
import 'package:cps_soft/presentation/blocs/user_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  final String baseUrl = dotenv.env['BASE_URL']!;
  getIt.registerLazySingleton<UserService>(() => UserService(baseUrl: baseUrl));
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(
      userService: getIt<UserService>(),
    ),
  );
  getIt.registerLazySingleton<GetUsers>(
      () => GetUsers(userRepository: getIt<UserRepository>()));
  getIt.registerFactory(() => UserBloc(getUsers: getIt<GetUsers>()));
}
