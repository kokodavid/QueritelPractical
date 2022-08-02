import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:queritel/constants/color_constants.dart';
import 'package:queritel/controllers/pets_controller.dart';
import 'package:queritel/models/pet_model.dart' as petData;


class PetDetails extends GetView<PetsController> {
  PetDetails({Key? key, required this.pet}) : super(key: key);

  petData.Pet pet;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
          child: Image.network(
            pet.photo!,
            width: MediaQuery.of(context).size.width,
            height: 300,
            fit: BoxFit.fill,
          ),
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(8)),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      pet.name!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.weightBg),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${pet.weight.toString()} KG",
                              style:
                                  const TextStyle(color: AppColors.weightTxt),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.yearsBg),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${pet.age.toString()} Years",
                              style: const TextStyle(color: AppColors.yearsTxt),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
              
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            alignment: Alignment.topLeft,
            child: const Text(
              "Description",
              style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            alignment: Alignment.topLeft,
            child:  Text(
              pet.description!,
              style:  TextStyle(fontSize: 16,color: AppColors.text),
            ),
          ),
        ],
      ),
    );
  }
}
