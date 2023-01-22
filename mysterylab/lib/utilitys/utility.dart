import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/src/intl/date_format.dart';

import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';

import 'app_string.dart';

class Utility {
  static Widget progress({Color? color}) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.primary,
      ),
    );
  }

  static void toast({required String message, Color? color}) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: color ?? AppColors.primary);
  }

  static openDatePicker(
      {required BuildContext context,
      required Function(String? selecteddate) onSelect}) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        1950,
      ),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      onSelect(
        DateFormat(
          'dd-MM-yyyy',
        ).format(selectedDate).toString(),
      );
    }
  }

  static bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  static setPref({required String key, required String value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static Future<String?> getPref({required String key}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString(
      key,
    );
    return token;
  }

  static Future<Locale> getLangauge() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      final langaugeString = pref.getString(AppString.languageKey);
      print(
          '::::::::: Current Language :=> $langaugeString :::::::::::::::::::::');
      if (langaugeString != null) {
        return langaugeString == 'en'
            ? const Locale('en', '')
            : const Locale('it', '');
      }
      return const Locale('en', '');
    } catch (e) {
      return const Locale('en', '');
    }
  }

  static setUser(LoginModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final users = jsonEncode(user);
    pref.setString(AppString.userPrefKey, users);
  }

  static Future<LoginModel?> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final user = pref.getString(
      AppString.userPrefKey,
    );
    final userModel = LoginModel.fromJson(jsonDecode(user ?? ''));
    return userModel;
  }

  static void clearPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  static Widget noDataWidget({required String text}) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 18,
        ),
      ),
    );
  }

  static Widget imageLoader({
    required String url,
    required String placeholder,
    required BoxFit fit,
    required BuildContext context,
    BoxShape? shape,
  }) {
    //String imageUrl = '';
    if (url == 'null' || url.trim() == '') {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(placeholder)),
          shape: shape ?? BoxShape.circle,
        ),
      );
    }
    // if (!url.startsWith('http')) {
    //   // url = AppString.storageUrl + url;
    // }

    return CachedNetworkImage(
      imageUrl: url,

      // imageBuilder: (context, imageProvider) => Container(
      //   decoration: BoxDecoration(
      //       shape: shape ?? BoxShape.circle,
      //       image: DecorationImage(image: NetworkImage(url))),
      // ),
      errorWidget: (context, error, dynamic a) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(placeholder)),
          shape: shape ?? BoxShape.circle,
        ),
      ),
      placeholder: (context, url) => progress(),
    );
  }

  // static String getMapUrl(String latitude, String longitude) {
  //   if (latitude == '' || longitude == '') {
  //     return 'Error';
  //   }
  //   String width = "512";
  //   String height = "512";
  //   log("${AppString.mapBaseUrl}?zoom=9&size=${width}x$height&maptype=roadmap&markers=$latitude,$longitude&key=${AppString.mapAPIKEY}");

  //   return "${AppString.mapBaseUrl}?zoom=19&size=${width}x$height&maptype=roadmap&markers=$latitude,$longitude&key=${AppString.mapAPIKEY}";
  // }

  // static checkPermission({
  //   required void Function() onSucess,
  //   required Permission permission,
  // }) async {
  //   PermissionStatus permissionStatus = await permission.status;
  //   switch (permissionStatus) {
  //     case PermissionStatus.granted:
  //       print('-------');
  //       print('Permission Granted');
  //       print('-------');
  //       onSucess();

  //       break;

  //     case PermissionStatus.denied:
  //       print('-------');
  //       print('Permission Denied');
  //       print('-------');

  //       await permission.request().then((value) {
  //         if (value == PermissionStatus.granted) {
  //           onSucess();
  //         }
  //       });
  //       break;

  //     case PermissionStatus.permanentlyDenied:
  //       print('--------');
  //       print('Permission Never Ask Again');
  //       print('--------');
  //       openAppSettings();
  //       break;

  //     // case 4 for Permission Unknown

  //     case PermissionStatus.limited:
  //       print('--------');
  //       print('Permission Unknown');
  //       print('--------');

  //       await permission.request().then((value) {
  //         if (value == PermissionStatus.granted) {
  //           onSucess();
  //         }
  //       });
  //       break;

  //     // case 5 for Permission Restricted

  //     case PermissionStatus.restricted:
  //       print('--------');
  //       print('Permission Restricted');
  //       print('--------');
  //       openAppSettings();
  //       break;

  //     // default open setting

  //     default:
  //       await permission.request().then((value) {
  //         if (value == PermissionStatus.granted) {
  //           onSucess();
  //         }
  //       });
  //   }
  // }
}
