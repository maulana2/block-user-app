import 'package:cps_soft/domain/entities/user.dart';
import 'package:cps_soft/presentation/blocs/add-user/add_user_bloc.dart';
import 'package:cps_soft/presentation/blocs/add-user/add_user_event.dart';
import 'package:cps_soft/presentation/blocs/add-user/add_user_state.dart';
import 'package:cps_soft/presentation/widgets/custom_text_field.dart';
import 'package:cps_soft/utils/colors.dart';
import 'package:cps_soft/utils/constant.dart';
import 'package:cps_soft/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddUserScreen extends StatelessWidget {
  late AddUserBloc _addUserBloc;
  TextEditingController nameC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AddUserScreen({super.key});

  Future _onAddUser({required BuildContext context}) async {
    _addUserBloc = BlocProvider.of<AddUserBloc>(context);
    final User userReq = User(
        id: null,
        name: nameC.text,
        address: addressC.text,
        email: emailC.text,
        phoneNumber: phoneC.text,
        city: cityC.text,
        profileImageUrl: null);
    _addUserBloc.add(AddUser(user: userReq));
  }

  @override
  Widget build(BuildContext context) {
    context.read<AddUserBloc>().add(ResetAddUserState());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppTexts.addUser.title,
          style: AppStyles.headline1.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
      body: BlocBuilder<AddUserBloc, AddUserState>(
        builder: (context, state) {
          print('state : $state');
          if (state is AddUserInitial) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextField(labelText: 'Name', controller: nameC),
                  CustomTextField(
                      labelText: 'Phone Number', controller: phoneC),
                  CustomTextField(labelText: 'Email', controller: emailC),
                  CustomTextField(labelText: 'Address', controller: addressC),
                  CustomTextField(labelText: 'City', controller: cityC),
                  ElevatedButton(
                    onPressed: () => _onAddUser(context: context),
                    child: Text('Add User'),
                  ),
                ],
              ),
            );
          } else if (state is AddUserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is AddUserPostSuccess) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Success'),
                ),
                ElevatedButton(
                  onPressed: () {
                    nameC.clear();
                    addressC.clear();
                    emailC.clear();
                    phoneC.clear();
                    cityC.clear();
                    context.read<AddUserBloc>().add(ResetAddUserState());
                  },
                  child: Text('Add User again'),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('ERROR'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Back'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
