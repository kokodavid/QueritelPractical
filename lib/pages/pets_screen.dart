import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:queritel/constants/color_constants.dart';
import 'package:queritel/controllers/pets_controller.dart';
import 'package:queritel/pages/cats_screen.dart';
import 'package:queritel/pages/dogs_screen.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

class PetScreen extends GetView<PetsController> {
  const PetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight * .76),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/location.png',
                        height: 30,
                        width: 35,
                      ),
                      const Text(
                        "Nairobi, Kenya",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Icon(
                        MdiIcons.chevronDown,
                        size: 25,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/search.png',
                        height: 25,
                        width: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: Image.asset(
                          'assets/menu.png',
                          height: 25,
                          width: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: TitleScrollNavigation(
                    identiferStyle: const NavigationIdentiferStyle(
                                  color: AppColors.activeColor,
                                  width: 30.0,
                                ),
                      barStyle: const TitleNavigationBarStyle(
                        elevation: 0.0,
                        style: TextStyle(),
                        activeColor: AppColors.activeColor,
                        deactiveColor: AppColors.inActiveColor,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        spaceBetween: 100,
                      ),
                      titles: ["Dogs", "Cats"],
                      pages: const [DogsScreen(), CatScreen()]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
