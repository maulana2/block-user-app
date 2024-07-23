import 'package:cps_soft/domain/entities/user.dart';
import 'package:cps_soft/domain/usecase/get_users.dart';
import 'package:cps_soft/presentation/blocs/user_event.dart';
import 'package:cps_soft/presentation/blocs/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsers getUsers;
  List<User> allUsers = [];

  UserBloc({required this.getUsers}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<SearchUsers>(_onSearchUsers);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final users = await getUsers.call();
      allUsers = users;
      emit(UserLoaded(users: users));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  void _onSearchUsers(SearchUsers event, Emitter<UserState> emit) {
    final query = event.query.toLowerCase();
    final filteredUsers = allUsers.where((user) {
      return user.name.toLowerCase().contains(query) ||
          user.email.toLowerCase().contains(query) ||
          user.city.toLowerCase().contains(query) ||
          user.address.toLowerCase().contains(query);
    }).toList();
    if (filteredUsers.isEmpty && query.isNotEmpty) {
      emit(UserError(message: 'No users found'));
    } else {
      emit(UserFiltered(filteredUsers: filteredUsers));
    }
  }
}
