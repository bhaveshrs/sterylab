import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mysterylab/response/login_responce.dart';
import 'package:mysterylab/screen/home_screen.dart';
import 'package:mysterylab/screen/privacy_policy_screen.dart';
import 'package:mysterylab/screen/term_and_condition.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/utilitys/assets_images.dart';
import 'package:mysterylab/widgets/common_button_widget.dart';
import 'package:mysterylab/widgets/text_form_widget.dart';

import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  bool checkvalue = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 50,
                    width: 160,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              AppAssets.sterylabtrnsparant,
                            ),
                            fit: BoxFit.fill),
                        color: AppColors.primary),
                  ),
                  const Text(
                    'Devloping medical device for 40 years',
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 24,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormWidget(
                          controller: usernamecontroller,
                          hinttext: 'username',
                          waring: "please enter name",
                        ),
                        TextFormWidget(
                          obscuretext: true,
                          textInputType: TextInputType.number,
                          controller: passwordcontroller,
                          hinttext: 'password',
                          waring: "please enter password",
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: const Icon(
                  //     Icons.check_box_outlined,
                  //     size: 17,
                  //     color: AppColors.primary,
                  //   ),
                  // ),
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        side: const BorderSide(width: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        activeColor: Colors.grey.shade200,
                        checkColor: AppColors.primary,
                        value: checkvalue,
                        onChanged: (value) {
                          setState(() {
                            checkvalue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          const TextSpan(
                              text: "By Singing up you're agree to our ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  fontSize: 17)),
                          TextSpan(
                            text: 'Privacy',
                            style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PrivacyPolicy()));
                              },
                          ),
                          const TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                  fontSize: 17)),
                          TextSpan(
                              text: 'Terms & Conditions',
                              style: const TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TermAndCondition()))),
                        ])),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CommonButtonWidget(
                  text: 'continue',
                  textColor: AppColors.white,
                  onTap: () {
                    checkCondition();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  checkCondition() {
    if (usernamecontroller.text.trim().isEmpty) {
      Utility.toast(message: 'enter username', color: Colors.grey);
    } else if (passwordcontroller.text.trim().isEmpty) {
      Utility.toast(message: 'enter password', color: Colors.grey);
    } else if (checkvalue == false) {
      Utility.toast(
          message: 'please accept term and condition', color: Colors.grey);
    } else {
      loginApi();
    }
  }

  loginApi() async {
    if (await ApiManager.checkInternet()) {
      var request = <String, dynamic>{};
      request['username'] =
          // "+${dropDownValue!.phonecode.toString() +
          usernamecontroller.text;
      request['password'] =
          // "+${dropDownValue!.phonecode.toString() +
          passwordcontroller.text;

      LoginResponse commonresponse = LoginResponse.fromJson(
          await ApiManager().postCall(AppString.login, request, context));

      if (commonresponse.status == "1") {
        if (usernamecontroller.text.trim() != '' &&
            passwordcontroller.text.trim() != "") {
          Utility.setPref(
            key: AppString.userToken,
            value: commonresponse.token.toString(),
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(
                    // userPhoneNumber:
                    //     "+${dropDownValue!.phonecode!}" +
                    //     phonenumberController.text
                    ),
              ));
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
