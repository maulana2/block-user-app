import 'dart:async';

import 'package:cps_soft/domain/entities/user.dart';
import 'package:cps_soft/domain/usecase/get_users.dart';
import 'package:cps_soft/presentation/blocs/user/user_event.dart';
import 'package:cps_soft/presentation/blocs/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  List<User> allUsers = [];
  List<User> filteredUsers = [];
  bool isSortedAZ = false;

  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<SearchUsers>(_onSearchUsers);
    on<SortUsersAZ>(_onSortUsersAZ);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await getUsers.call().timeout(Duration(seconds: 10));
      allUsers = users;
      filteredUsers = users;
      emit(UserLoaded(users: users));
    } catch (e) {
      if (e is TimeoutException) {
        emit(UserError(message: 'Timed out'));
      } else {
        emit(UserError(message: e.toString()));
      }
    }
  }

  void _onSearchUsers(SearchUsers event, Emitter<UserState> emit) {
    final query = event.query.toLowerCase();
    final city = event.city?.toLowerCase();

    filteredUsers = allUsers.where((user) {
      final matchName = user.name.toLowerCase().contains(query);
      final matchCity =
          city == null || city.isEmpty || user.city.toLowerCase() == city;
      return matchName && matchCity;
    }).toList();

    if (isSortedAZ) {
      _sortUsersAZ();
    }

    if (filteredUsers.isEmpty && query.isNotEmpty) {
      emit(UserError(message: 'No users found'));
    } else {
      emit(UserFiltered(filteredUsers: filteredUsers));
    }
  }

  void _onSortUsersAZ(SortUsersAZ event, Emitter<UserState> emit) {
    isSortedAZ = !isSortedAZ;
    if (emit is UserLoaded) {
      final sortedUsers = List<User>.from(allUsers)
        ..sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
      emit(UserFiltered(filteredUsers: sortedUsers));
    } else {
      if (isSortedAZ) {
        final sortedUsers = List<User>.from(filteredUsers)
          ..sort(
              (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        emit(UserFiltered(filteredUsers: sortedUsers));
      } else {
        emit(UserFiltered(filteredUsers: filteredUsers));
      }
    }
  }

  void _sortUsersAZ() {
    filteredUsers
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }
}
