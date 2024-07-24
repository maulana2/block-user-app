import 'package:cps_soft/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

abstract class AddUserEvent extends Equatable {
  const AddUserEvent();

  @override
  List<Object> get props => [];
}

class AddUser extends AddUserEvent {
  final User user;
  AddUser({required this.user});
}

class ResetAddUserState extends AddUserEvent {}
