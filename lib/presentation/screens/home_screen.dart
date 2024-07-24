import 'package:cps_soft/presentation/blocs/city/city_bloc.dart';
import 'package:cps_soft/presentation/blocs/city/city_event.dart';
import 'package:cps_soft/presentation/blocs/city/city_state.dart';
import 'package:cps_soft/presentation/blocs/user/user_bloc.dart';
import 'package:cps_soft/presentation/blocs/user/user_event.dart';
import 'package:cps_soft/presentation/blocs/user/user_state.dart';
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
  late CityBloc _cityBloc;
  String? selectedCity;
  bool isSortedAZ = false;
  String? query;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _cityBloc = BlocProvider.of<CityBloc>(context);
    if (_userBloc.state is UserInitial) {
      _userBloc.add(FetchUsers());
    }
    if (_cityBloc.state is CityInitial) {
      _cityBloc.add(FetchCity());
    }
  }

  void _onSearchChanged(String reqQuery) {
    query = reqQuery;
    _userBloc.add(SearchUsers(query: query!, city: selectedCity ?? ''));
  }

  void _onCitySelected(String? city) {
    setState(() {
      selectedCity = city;
    });

    _userBloc.add(SearchUsers(query: '', city: city!));
  }

  void _onSortAZ() {
    print('Ui on sort running $isSortedAZ');
    setState(() {
      isSortedAZ = !isSortedAZ;
    });
    _userBloc.add(SortUsersAZ());
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _onSortAZ();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor:
                        isSortedAZ ? AppColors.primaryColor : AppColors.grey,
                  ),
                  child: Text(
                    'A-Z',
                    style: AppStyles.bodyText1.copyWith(
                      color: isSortedAZ ? AppColors.white : Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: BlocBuilder<CityBloc, CityState>(
                    builder: (context, state) {
                      if (state is CityLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CityLoaded) {
                        return DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.primaryColor.withOpacity(0.1),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          hint: Text('Select City'),
                          value: selectedCity,
                          onChanged: _onCitySelected,
                          items: state.city.map((city) {
                            return DropdownMenuItem<String>(
                              value: city.name,
                              child: Text(city.name,
                                  overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          isExpanded: true,
                        );
                      } else if (state is CityError) {
                        return Center(child: Text('Failed to load cities'));
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
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
                  print('state.message ${state.message}');
                  if (state.message == 'Timed out') {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Text('Retry'),
                    );
                  } else {
                    return Center(child: Text(state.message));
                  }
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
