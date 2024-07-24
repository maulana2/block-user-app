import 'package:cps_soft/domain/usecase/post_user.dart';
import 'package:cps_soft/presentation/blocs/add-user/add_user_event.dart';
import 'package:cps_soft/presentation/blocs/add-user/add_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  final PostUser postUser;
  AddUserBloc({required this.postUser}) : super(AddUserInitial()) {
    on<AddUser>(_onAddUser);
    on<ResetAddUserState>(_onReset);
  }

  void _onReset(ResetAddUserState event, Emitter<AddUserState> emit) {
    emit(AddUserInitial());
  }

  _onAddUser(AddUser event, Emitter<AddUserState> emit) async {
    emit(AddUserLoading());
    try {
      print('add user bloc running');
      bool responsePost = await postUser.post(user: event.user);
      print('Add user response: $responsePost');
      if (responsePost == true) {
        emit(AddUserPostSuccess());
      } else {
        emit(AddUserError(message: 'Failed to add user'));
      }
      return responsePost;
    } catch (e) {
      emit(AddUserError(message: e.toString()));
    }
  }
}
