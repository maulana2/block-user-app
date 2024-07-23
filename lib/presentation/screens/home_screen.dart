import 'package:cps_soft/presentation/blocs/user_bloc.dart';
import 'package:cps_soft/presentation/blocs/user_event.dart';
import 'package:cps_soft/presentation/blocs/user_state.dart';
import 'package:cps_soft/presentation/widgets/profile_card.dart';
import 'package:cps_soft/presentation/widgets/search_bar.dart';
import 'package:cps_soft/utils/colors.dart';
import 'package:cps_soft/utils/constant.dart';
import 'package:cps_soft/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(FetchUsers());
  }

  void _onSearchChanged(String query) {
    _userBloc.add(SearchUsers(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppTexts.home.title,
          style: AppStyles.headline1.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SearchBarWidget(onChanged: _onSearchChanged),
          Expanded(
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is UserLoaded || state is UserFiltered) {
                  final users = state is UserLoaded
                      ? state.users
                      : (state as UserFiltered).filteredUsers;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ProfileCard(user: users[index]);
                      },
                    ),
                  );
                } else if (state is UserError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('No users found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
