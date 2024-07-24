import 'package:cps_soft/data/services/city_service.dart';
import 'package:cps_soft/domain/entities/city.dart';

class CityRepository {
  final CityService cityService;
  CityRepository({required this.cityService});
  Future<List<City>> fetchUsers() async {
    final cityModel = await cityService.fetchUsers();
    return cityModel
        .map((cityModel) => City(id: cityModel.id, name: cityModel.name))
        .toList();
  }
}
