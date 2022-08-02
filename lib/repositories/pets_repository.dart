import 'dart:developer';

import 'package:queritel/constants/string_constants.dart';
import 'package:queritel/models/pet_model.dart'as pet;
import 'package:queritel/services/base_service.dart';

class DogsRepository {
  static DogsRepository? _instance;

  factory DogsRepository() => _instance ??= DogsRepository._();

  DogsRepository._();

  var api = BaseService();

  Future<dynamic> getDogs() async {
    var res =
        await api.get('$BASE_URL', '/442a4801-5715-474a-b6fd-7548ab2f8d20');


    if (res != null) {
      List<dynamic> result = res["dogs"];
      List<pet.Pet> dogsList = [];

       result.forEach((element) {
        dogsList.add(pet.Pet.fromJson(element));
      });

      return dogsList;
    }
  }

  Future<dynamic> getCats() async {
    var res = await api.get('$BASE_URL', '/77290441-d8e9-483f-80a2-a336a3364bbe');


    if (res != null) {
      List<dynamic> result = res["cats"];
      List<pet.Pet> catsList = [];

       result.forEach((element) {
        catsList.add(pet.Pet.fromJson(element));
      });

      return catsList;
    }
  }
}
