import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:queritel/models/pet_model.dart' as pet;
import 'package:queritel/repositories/pets_repository.dart';

import 'base_controller.dart';

class PetsController extends BaseController {
  final isLoading = true.obs;

  final dogList = <pet.Pet>[].obs;
  final catList = <pet.Pet>[].obs;


  @override
  void onInit() {
    getDogsList();
    getCatsList();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final repository = DogsRepository();

  getDogsList() async {
    var res = await repository.getDogs();

    if (res != null) {
      dogList.value = [...res];
      print(res.toString());
    } else {
      // hideLoading();
    }
  }

  getCatsList() async {
    var res = await repository.getCats();

    if (res != null) {
      catList.value = [...res];
      print(res.toString());
    } else {
      // hideLoading();
    }
  }
}
