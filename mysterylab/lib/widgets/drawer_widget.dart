import 'package:flutter/material.dart';
import 'package:mysterylab/response/common_response.dart';
import 'package:mysterylab/screen/change_pass_screen.dart';
import 'package:mysterylab/screen/login_screen.dart';
import 'package:mysterylab/screen/privacy_policy_screen.dart';
import 'package:mysterylab/screen/term_and_condition.dart';
import 'package:mysterylab/utilitys/appcolor.dart';

import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/assets_images.dart';
import '../utilitys/utility.dart';
import 'alert_dialod.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  bool isloading = false;
  List screen = [
    const PrivacyPolicy(),
    const TermAndCondition(),
    const ChnagePassScreen(),
    const LoginScreen(),
    const LoginScreen()
  ];

  List tital = [
    'Privacy policy',
    'Term & Condition',
    'Chnage Password',
    'Log out',
    'Delete account'
  ];

  List icon = [
    Icons.insert_drive_file_sharp,
    Icons.assignment,
    Icons.mode_edit_outline_rounded,
    Icons.logout_rounded,
    Icons.cancel
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.white,
                  )),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(10),
                height: 35,
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.sterylabtrnsparant),
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: tital.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    index == 3
                        ? showDialog(
                            context: context,
                            builder: (context) => AlertDialogBoxWidget(
                                  title: 'Logout',
                                  titleTextColor: AppColors.primary,
                                  alertMessage:
                                      "Are you sure you want to log out?",
                                  isNeedTwoButtons: true,
                                  buttonTextFirst: "Yes",
                                  buttonTextSecond: "No",
                                  ontapFirst: () {
                                    logout();
                                  },
                                  ontapSecond: () {
                                    Navigator.of(context).pop();
                                  },
                                ))
                        : index == 4
                            ? deletecall()
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => screen[index],
                              ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        Icon(
                          icon[index],
                          color: AppColors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          tital[index],
                          style: const TextStyle(
                              color: AppColors.white, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  Future logout() async {
    if (await ApiManager.checkInternet()) {
      var request = <String, dynamic>{};

      CommonResponse commonresponse = CommonResponse.fromJson(
          await ApiManager().postCall(AppString.logout, request, context));

      if (commonresponse.status == "1") {
        isloading = true;
        Utility.clearPref();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const LoginScreen(
        //           // userPhoneNumber:
        //           //     "+${dropDownValue!.phonecode!}" +
        //           //     phonenumberController.text
        //           ),
        //     ));
      }
      Utility.toast(
          message: commonresponse.message.toString(), color: Colors.grey);
    } else {
      // isLoading.value = false;
      return Utility.toast(message: 'NoInternetConnection');
    }
  }

  Future deletecall() async {
    if (await ApiManager.checkInternet()) {
      var request = <String, dynamic>{};

      CommonResponse commonresponse = CommonResponse.fromJson(
          await ApiManager().deleteCall(AppString.delete));
    }
  }
}
