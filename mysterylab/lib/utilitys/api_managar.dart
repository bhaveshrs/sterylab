import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../response/common_response.dart';
import '../response/login_responce.dart';
import 'app_string.dart';

class ApiManager {
  static Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  postCall(
      String url, Map<String, dynamic> request, BuildContext context) async {
    // try {
    var uri = Uri.parse(url);

    final headers = await getHeaders();
    log(headers.toString());
    log(uri.toString());
    log(request.toString());
    http.Response response =
        await http.post(uri, body: jsonEncode(request), headers: headers);
    if (response.statusCode == 401) {
      log("${response.statusCode}");
      log(response.body);
    } else {
      log("${response.statusCode}");
      log(response.body);
      Map<String, dynamic> decodeJson = json.decode(response.body);
      return await json.decode(response.body);
    }
    // } catch (e) {
    //   LoginResponse commonResponse =
    //       LoginResponse(message: e.toString(), status: "0");
    //   return await json.decode(
    //     json.encode(commonResponse.toJson()),
    //   );
    // }
  }

  getCall(
      String url, Map<String, dynamic> request, BuildContext context) async {
    try {
      Map<String, String> headers;
      headers = await getHeaders();
      var uri2 = Uri.parse(url);

      uri2 = uri2.replace(queryParameters: request);
      http.Response response = await http.get(uri2, headers: headers);
      log("$uri2");
      log(response.statusCode.toString());
      if (response.statusCode == 401) {
        log("${response.statusCode}");
        log(response.body);
        LoginResponse commonResponce =
            LoginResponse(message: "Unauthenticated", status: "401");
        return await json.decode(json.encode(commonResponce.toJson()));
      } else {
        log("${response.statusCode}");
        log(response.body);
        return await json.decode(response.body);
      }
    } catch (e) {
      log("EERRROORR:: $e");
      LoginResponse commonResponse =
          LoginResponse(message: e.toString(), status: "0");
      return await json.decode(json.encode(commonResponse.toJson()));
    }
  }

  Future<Map<String, dynamic>> multipartRequest({
    required String url,
    String method = 'POST',
    Map<String, String> request = const {},
    List<MapEntry<String, File>>? files,
  }) async {
    try {
      final headers = await getHeaders();
      final uri = Uri.parse(url);

      log(uri.toString());
      log(request.toString());
      log(method);
      if (files != null) {
        log(files.toString());
      }

      var multipartRequest = http.MultipartRequest(
        method,
        uri,
      );

      multipartRequest.headers.addAll(headers);

      if (files != null && files.isNotEmpty) {
        for (var fileData in files) {
          multipartRequest.files.add(
            await http.MultipartFile.fromPath(
              fileData.key,
              fileData.value.path,
            ),
          );
        }
      }

      multipartRequest.fields.addAll(request);

      final multiPartResponse = await multipartRequest.send();
      final response = await http.Response.fromStream(multiPartResponse);

      log('responseData: ${response.body}');
      log('responseData: ${response.statusCode}');
      if (response.statusCode == 401) {
        CommonResponse commonResponse =
            CommonResponse(message: "Unauthenticated.", status: "0");
        return await json.decode(json.encode(commonResponse.toJson()));
      } else if (response.statusCode != 200) {
        CommonResponse commonResponse =
            CommonResponse.fromJson(json.decode(response.body));
        log(commonResponse.status ?? '');
        log(commonResponse.message ?? '');

        return await json.decode(response.body);
      } else {
        log("${response.statusCode}");
        log(response.body);

        final data = await json.decode(response.body);
        log('responseData: $data');
        return data;
      }
    } catch (e) {
      debugPrint("crashed $e", wrapWidth: 1024);
      CommonResponse commonResponse =
          CommonResponse(message: e.toString(), status: "0");
      return await json.decode(json.encode(commonResponse.toJson()));
    }
  }

  Future<Map<String, String>> getHeaders() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString(AppString.userToken);

    if (token == null) {
      log(token.toString());
      return {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
    } else {
      return {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
    }
  }

  static logout(BuildContext context,
      {required void Function() onComplete}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    // await showDialog(
    //   context: context,
    //   builder: (BuildContext context2) {
    //     return AppAlertDialogue(
    //       title: "Logout",
    //       content: "Are you sure you want to logout?",
    //       action1: "No",
    //       onTap1: () {
    //         log('button 1 pressed');
    //         Navigator.pop(context2);
    //       },
    //       action2: "Yes",
    // onTap2:
    onComplete();

    //     );
    //   },
    // );
  }

  Future<Map<String, dynamic>> deleteCall(
    String url,
  ) async {
    try {
      Map<String, String> headers;
      headers = await getHeaders();
      AppLogs.debugging(headers);
      AppLogs.debugging(url);
      http.Response response =
          await http.delete(Uri.parse(url), headers: headers);
      if (response.statusCode == 401) {
        // logoutUnauthenticated();
        CommonResponse commonResponse =
            CommonResponse(message: "Unauthenticated.", status: "0");
        return await json.decode(json.encode(commonResponse.toJson()));
      } else {
        AppLogs.debugging("${response.statusCode}");
        AppLogs.debugging(response.body);
        final data = await json.decode(response.body);
        log(data.toString());
        return data;
      }
    } catch (e, s) {
      AppLogs.debugging("crashed ::::$e ::::::$s");

      CommonResponse commonResponse =
          CommonResponse(message: e.toString(), status: "0");
      return await json.decode(json.encode(commonResponse.toJson()));
    }
  }

  void toast({required String text}) {
    Fluttertoast.showToast(msg: text);
  }
}

class AppLogs {
  static debugging(Object object) {
    log(object.toString());
  }
}
