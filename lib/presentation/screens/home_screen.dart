import 'package:cps_soft/presentation/screens/add_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(AddUserScreen());
            },
            child: Text('Add User')),
      ),
    );
  }
}
