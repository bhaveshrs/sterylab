import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mysterylab/models/setting_model.dart';
import 'package:mysterylab/response/setting_response.dart';
import 'package:mysterylab/utilitys/appcolor.dart';

import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrivacyPolicy();
  }

  SettingModel mymodel = SettingModel();
  List Privacy = [];
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: GestureDetector(
            onTap: Navigator.of(context).pop,
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          title: const Text('Privacy Policy'),
        ),
        body: isloading == true
            ? SingleChildScrollView(child: Html(data: mymodel.appPrivacyPolicy))
            : Utility.progress());
  }

  Future<void> getPrivacyPolicy() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {'type': 'PRIVACY_POLICY'};
      SettingResponse response = SettingResponse.fromJson(
          await ApiManager().getCall(AppString.setting, request, context));
      log(response.data.toString());
      log(response.data!.first.appPrivacyPolicy.toString());

      if (response.status == "1" &&
          response.data != null &&
          response.data!.isNotEmpty) {
        isloading = true;
        mymodel = response.data!.first;
        _notify();

        // log(condition.toString());
      } else {
        Utility.toast(message: "error");
      }
    } else {
      Utility.toast(message: 'check internet connection');
    }
  }

  _notify() {
    if (mounted) {
      setState(() {});
    }
  }
}
