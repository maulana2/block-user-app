import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUsers extends UserEvent {}

class SortUsersAZ extends UserEvent {}

class SearchUsers extends UserEvent {
  final String query;
  String? city;
  SearchUsers({required this.query, required this.city});

  @override
  List<Object> get props => [query];
}
