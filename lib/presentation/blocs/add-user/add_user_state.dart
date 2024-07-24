import 'package:equatable/equatable.dart';

abstract class AddUserState extends Equatable {
  const AddUserState();

  @override
  List<Object> get props => [];
}

class AddUserInitial extends AddUserState {}

class AddUserPostSuccess extends AddUserState {}

class AddUserLoading extends AddUserState {}

class AddUserError extends AddUserState {
  final String message;

  const AddUserError({required this.message});

  @override
  List<Object> get props => [message];
}
