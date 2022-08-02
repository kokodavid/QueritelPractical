import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:queritel/constants/color_constants.dart';
import 'package:queritel/controllers/pets_controller.dart';
import 'package:queritel/pages/pet_details.dart';

class DogsScreen extends GetView<PetsController> {
  const DogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutral10,
      body: SingleChildScrollView(
        child: Container(
          child: Obx(
            () => GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (MediaQuery.of(context).orientation ==
                          Orientation.portrait)
                      ? 2
                      : 4,
                  childAspectRatio: 0.77),
              scrollDirection: Axis.vertical,
              itemCount: controller.dogList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, i) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => PetDetails(
                      pet: controller.dogList[i],
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                          width: 160,
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(
                                  controller.dogList[i].photo!,
                                  height: 140,
                                  width: 160,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.dogList[i].name!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: AppColors.weightBg),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text(
                                            "${controller.dogList[i].weight.toString()}KG",
                                            style: const TextStyle(
                                                color: AppColors.weightTxt),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.yearsBg),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        "${controller.dogList[i].age.toString()} Years",
                                        style: const TextStyle(
                                            color: AppColors.yearsTxt),
                                      ),
                                    )),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
