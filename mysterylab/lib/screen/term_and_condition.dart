import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mysterylab/utilitys/appcolor.dart';

import '../models/setting_model.dart';
import '../response/setting_response.dart';
import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({super.key});

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTermAndCondition();
  }

  bool isloading = false;
  SettingModel mymodel = SettingModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          title: const Text('Term And Condition'),
        ),
        body: isloading == true
            ? SingleChildScrollView(child: Html(data: mymodel.termsEn))
            : Utility.progress());
  }

  Future<void> getTermAndCondition() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {'type': 'TERMS_CONDITION'};
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
