
import 'package:get/get.dart';
import 'package:queritel/controllers/base_controller.dart';
import 'package:queritel/controllers/pets_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(BaseController());
    Get.put<PetsController>(PetsController());



  }
}
