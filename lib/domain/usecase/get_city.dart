import 'package:cps_soft/data/repository/city_repository.dart';
import 'package:cps_soft/domain/entities/city.dart';

class GetCity {
  final CityRepository cityRepository;
  GetCity({required this.cityRepository});

  Future<List<City>> call() async {
    List<City> city = await cityRepository.fetchUsers();
    return city;
  }
}
