import 'package:cps_soft/presentation/screens/add_user_screen.dart';
import 'package:cps_soft/presentation/screens/home_screen.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: '/add-user-screen',
      page: () => const AddUserScreen(),
    ),
  ];
}
