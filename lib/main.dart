import 'package:cps_soft/presentation/blocs/add-user/add_user_bloc.dart';
import 'package:cps_soft/presentation/blocs/city/city_bloc.dart';
import 'package:cps_soft/presentation/blocs/user/user_bloc.dart';
import 'package:cps_soft/routes/app_routes.dart';
import 'package:cps_soft/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/route_manager.dart';

void main() async {
  print('running apps');
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => getIt<UserBloc>(),
        ),
        BlocProvider<CityBloc>(
          create: (context) => getIt<CityBloc>(),
        ),
        BlocProvider<AddUserBloc>(
          create: (context) => getIt<AddUserBloc>(),
        )
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.routes[0].name,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
