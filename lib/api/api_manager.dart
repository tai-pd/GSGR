import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:gsgr/controller/setting_controller.dart';
import 'package:gsgr/helper/dialog.dart';
import 'package:gsgr/value/session_manager.dart';
import 'package:http/http.dart' as http;
import 'app_exception.dart';

class ApiManager {
  // ApiManager._();
  SessionManager _sessionManager = SessionManager();

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> getWithHeader(String url) async {
    final $token = await _sessionManager.getLoginToken();
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
      "login-token": $token
    };
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> postWithHeader(String url, dynamic body) async {
    print('Api Post, url $url');
    final $token = await _sessionManager.getLoginToken();
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
      "login-token": $token
    };
    var responseJson;
    final String encodedData = json.encode(body);

    try {
      final response =
          await http.post(Uri.parse(url), body: encodedData, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  final controller = Get.put(SettingController());
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      DialogHelper.dialogWarning(
          content:
              'Bạn đã đăng nhập tài khoản này ở một thiết bị khác, vui lòng đăng nhập lại.',
          fnc: () {
            controller.lougOut();
          });
      break;
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
