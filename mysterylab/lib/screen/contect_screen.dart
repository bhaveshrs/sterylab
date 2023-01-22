import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mysterylab/utilitys/appcolor.dart';

import '../models/setting_model.dart';
import '../response/setting_response.dart';
import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';

class ContectScreen extends StatefulWidget {
  const ContectScreen({super.key});

  @override
  State<ContectScreen> createState() => _ContectScreenState();
}

class _ContectScreenState extends State<ContectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcontect();
  }

  SettingModel _settingModel = SettingModel();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return isloading == false
        ? Utility.progress()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _settingModel.name.toString(),
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _settingModel.address.toString(),
                  style: const TextStyle(fontSize: 17),
                ),
                const Text('phone : +39098398372!',
                    style: TextStyle(fontSize: 17)),
                const Text('fax: +3902935084', style: TextStyle(fontSize: 17)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _settingModel.site.toString(),
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  _settingModel.email.toString(),
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Flexible(
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          double.parse(_settingModel.latitude.toString()),
                          double.parse(_settingModel.longitude.toString())),
                      zoom: 15.0,
                    ),
                  ),
                ),

                // RichText(
                //   text: const TextSpan(
                //     children: <TextSpan>[
                //       TextSpan(
                //           text: 'VIA MAGENTA 77/6 20017 RHO(MILLAN ITLY',
                //           style: TextStyle(color: Colors.black)),
                //       TextSpan(
                //           text: ' phone : +39098398372!',
                //           style: TextStyle(color: Colors.black)),
                //       TextSpan(
                //           text: 'fax: +3902935084',
                //           style: TextStyle(color: Colors.black))
                //     ],
                //   ),
                // ),
                // const Text('VIA MAGENTA 77/6 20017 RHO(MILLAN ITLY'),
              ],
            ),
          );
  }

  Future<void> getcontect() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {'type': 'ABOUT'};
      SettingResponse companyresponse = SettingResponse.fromJson(
          await ApiManager().getCall(AppString.setting, request, context));
      log(companyresponse.data.toString());
      log(companyresponse.data!.first.appPrivacyPolicy.toString());

      if (companyresponse.status == "1" &&
          companyresponse.data != null &&
          companyresponse.data!.isNotEmpty) {
        isloading = true;
        _settingModel = companyresponse.data!.first;
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
