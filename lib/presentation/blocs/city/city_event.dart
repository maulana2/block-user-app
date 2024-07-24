import 'package:equatable/equatable.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class FetchCity extends CityEvent {}
