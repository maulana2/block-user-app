import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;
  SearchUsers({required this.query});

  @override
  List<Object> get props => [query];
}
