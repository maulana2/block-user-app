import 'package:cps_soft/domain/entities/city.dart';
import 'package:equatable/equatable.dart';

abstract class CityState extends Equatable {
  const CityState();

  @override
  List<Object> get props => [];
}

class CityInitial extends CityState {}

class CityLoading extends CityState {}

class CityLoaded extends CityState {
  final List<City> city;

  const CityLoaded({required this.city});

  @override
  List<Object> get props => [city];
}

class CityError extends CityState {
  final String message;

  const CityError({required this.message});

  @override
  List<Object> get props => [message];
}
