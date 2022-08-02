import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:queritel/services/app_exceptions.dart';


class BaseController extends GetxController {
  @override
  void onInit() {

    super.onInit();
  }

  // final baseRepository = BaseRepository();


  var storage = GetStorage();

  void handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;

      showSnackbar('Error', jsonDecode(message!)["message"].toString());
    } else if (error is FetchDataException) {
      var message = error.message;
      showSnackbar('Error', message.toString());
    } else if (error is ApiNotRespondingException) {
      showSnackbar('Error', 'Oops that took too long! Please try again');
    }
  }



  showSnackbar(String title, String message) {
    Get.snackbar(
      '$title',
      '$message',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      icon: Icon(
        (title.toLowerCase() == 'success') ? Icons.check : Icons.error,
        color: (title.toLowerCase() == "success")
            ? Colors.blue
            : Colors.blue,
      ),
    );
  }

}
