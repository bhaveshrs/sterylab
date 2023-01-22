import 'package:flutter/material.dart';
import 'package:mysterylab/response/common_response.dart';
import 'package:mysterylab/screen/login_screen.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/widgets/alert_dialod.dart';
import 'package:mysterylab/widgets/common_button_widget.dart';

import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';
import '../widgets/text_form_widget.dart';

class ChnagePassScreen extends StatefulWidget {
  const ChnagePassScreen({super.key});

  @override
  State<ChnagePassScreen> createState() => _ChnagePassScreenState();
}

class _ChnagePassScreenState extends State<ChnagePassScreen> {
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController currentpasscontroller = TextEditingController();
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: AppColors.primary,
          title: const Text(
            'Change Password',
            style: TextStyle(color: AppColors.white),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      'Current Password',
                      style: TextStyle(
                          color: AppColors.textprimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormWidget(
                    textInputType: TextInputType.number,
                    controller: currentpasscontroller,
                    hinttext: 'current password',
                    waring: "please current password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      'new Password',
                      style: TextStyle(
                          color: AppColors.textprimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormWidget(
                    textInputType: TextInputType.number,
                    controller: newpasscontroller,
                    hinttext: 'new password',
                    waring: "please new password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: Text(
                      'confirm Password',
                      style: TextStyle(
                          color: AppColors.textprimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextFormWidget(
                    textInputType: TextInputType.number,
                    controller: confirmpasscontroller,
                    hinttext: 'confirm password',
                    waring: "please confirm password",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20),
                    child: CommonButtonWidget(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogBoxWidget(
                                title: 'Change password',
                                alertMessage:
                                    'your current Pass  will change wih ${currentpasscontroller.text.toString()} with  ${confirmpasscontroller.text.toString()}',
                                isNeedTwoButtons: true,
                                buttonTextFirst: "yes",
                                buttonTextSecond: "NO",
                                ontapFirst: () {
                                  checkCondition();
                                },
                                ontapSecond: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        },
                        text: 'Update Password'),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  checkCondition() {
    if (currentpasscontroller.text.trim().isEmpty) {
      Utility.toast(message: 'enter curetpass', color: Colors.grey);
    } else if (newpasscontroller.text.trim().isEmpty) {
      Utility.toast(message: 'enter newpass', color: Colors.grey);
    } else if (confirmpasscontroller.text.trim().isEmpty) {
      Utility.toast(message: 'enter confirm pass', color: Colors.grey);
    } else if (confirmpasscontroller.text.trim().toString() !=
        newpasscontroller.text.trim().toString()) {
      Utility.toast(
          message: 'NewPass and ConfirmPass in not match', color: Colors.grey);
    } else {
      changepass();
    }
  }

  changepass() async {
    if (await ApiManager.checkInternet()) {
      var request = <String, dynamic>{};
      request['old_password'] =
          // "+${dropDownValue!.phonecode.toString() +
          currentpasscontroller.text;
      request['new_password'] =
          // "+${dropDownValue!.phonecode.toString() +
          newpasscontroller.text;
      request['new_password_confirmation'] =
          // "+${dropDownValue!.phonecode.toString() +
          confirmpasscontroller.text;

      CommonResponse commonresponse = CommonResponse.fromJson(
          await ApiManager().postCall(AppString.changepass, request, context));

      if (commonresponse.status == "1") {
        if (currentpasscontroller.text.trim() != '' &&
            confirmpasscontroller.text.trim() != "") {
          isloading = true;
          Utility.clearPref();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        }
      }
      Utility.toast(
          message: commonresponse.message.toString(), color: Colors.grey);
    } else {
      // isLoading.value = false;
      return Utility.toast(message: 'NoInternetConnection');
    }
  }
}
