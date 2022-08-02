import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:queritel/controllers/base_controller.dart';


import 'app_exceptions.dart';

class BaseService extends BaseController {
  static const int TIME_OUT_DURATION = 40;

  Map? headers = {
    // 'content-type': 'application/json',
    'Accept': 'application/json'
  };


  //GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);

    try {
      var response = await http
          .get(uri)
          .timeout(Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }



  dynamic _processResponse(http.Response response) {
  
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        try {
          var responseJson = jsonDecode(response.body);
          return responseJson;
        } catch (_) {
          return true;
        }
      case 400:
        throw BadRequestException(
            response.body, response.request!.url.toString());
      case 404:
        // showSnackbar('Error', 'What you\'re looking for could not be found');
        break;

      case 401:
        // showSnackbar('Error', 'token expired');
        break;
      case 403:
        // showSnackbar('Error', '${jsonDecode(response.body)["message"]}');
        break;

      case 422:
        throw BadRequestException(
            response.body,
            //utf8.decode(response.bodyBytes
            response.request!.url.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }

}
