import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mysterylab/screen/splash_screen.dart';
import 'package:mysterylab/utilitys/app_string.dart';
import 'package:mysterylab/utilitys/utility.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  bool isVarified = await varifyUser();
  runApp(
    DevicePreview(
        enabled: kDebugMode,
        tools: const [...DevicePreview.defaultTools],
        builder: (context) => MyApp(
              isVarified: isVarified,
            )),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.isVarified}) : super(key: key);
  final bool isVarified;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: splash(isverified: widget.isVarified)
        //  splash(isverified: widget.isVarified),
        );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<bool> varifyUser() async {
  String? token = await Utility.getPref(key: AppString.userToken);

  if (token != null) {
    return true;
  }
  return false;
}
