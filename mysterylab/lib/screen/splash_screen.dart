import 'package:flutter/material.dart';
import 'package:mysterylab/screen/home_screen.dart';
import 'package:mysterylab/screen/login_screen.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/utilitys/assets_images.dart';

class splash extends StatefulWidget {
  splash({Key? key, required this.isverified}) : super(key: key);
  bool isverified;
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    navigateHome();
  }

  navigateHome() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                widget.isverified ? const HomeScreen() : const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          height: 60,
          width: 200,
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
          child: const Image(
              image: AssetImage(
            AppAssets.sterylabicon1,
          )),
        ),
      ),
    );

    // Image(image: AssetImage('Assets/Images/sterylabicon.png')),
  }
}
