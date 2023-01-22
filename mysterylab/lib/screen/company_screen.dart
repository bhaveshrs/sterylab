import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../models/setting_model.dart';
import '../response/setting_response.dart';
import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';

class ComapnyScreen extends StatefulWidget {
  const ComapnyScreen({super.key});

  @override
  State<ComapnyScreen> createState() => _ComapnyScreenState();
}

class _ComapnyScreenState extends State<ComapnyScreen> {
  late YoutubePlayerController _controller;
  String? videourl;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompanyINfo();
    // videourl = ;
    // String? videoid = YoutubePlayer.convertUrlToId(videourl ?? "");
    _controller = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(_settingModel.videoUrlEn.toString()) ??
              "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  bool isloading = false;
  SettingModel _settingModel = SettingModel();
  @override
  Widget build(BuildContext context) {
    return isloading == true
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isloading == true
                      ? SingleChildScrollView(
                          child: Html(data: _settingModel.aboutTextEn))
                      : Utility.progress(),
                  Center(
                    child: YoutubePlayer(
                      progressIndicatorColor: Colors.amber,
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.amber,
                        handleColor: Colors.amberAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Utility.progress();
  }

  Future<void> getCompanyINfo() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {'type': 'COMPANY_INFO'};
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
