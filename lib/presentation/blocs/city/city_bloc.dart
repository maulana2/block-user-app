import 'package:cps_soft/domain/entities/city.dart';
import 'package:cps_soft/domain/usecase/get_city.dart';
import 'package:cps_soft/presentation/blocs/city/city_event.dart';
import 'package:cps_soft/presentation/blocs/city/city_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final GetCity getCity;
  List<City> allCity = [];

  CityBloc({required this.getCity}) : super(CityInitial()) {
    on<FetchCity>(_onFetchCity);
  }
  void _onFetchCity(FetchCity event, Emitter<CityState> emit) async {
    print('Fetch City Running');
    emit(CityLoading());
    try {
      final city = await getCity.call();
      allCity = city;
      emit(CityLoaded(city: city));
    } catch (e) {
      emit(CityError(message: e.toString()));
    }
  }
}
