import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysterylab/models/prodedure_model.dart';
import 'package:mysterylab/models/speciality_model.dart';
import 'package:mysterylab/response/speciality_response.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/utilitys/assets_images.dart';
import 'package:mysterylab/widgets/prodedurelist.dart';
import 'package:mysterylab/widgets/specialitylist.dart';

import '../response/prodedure_response.dart';
import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';

class SpecialityScreen extends StatefulWidget {
  SpecialityScreen({super.key, required this.selectedindex});
  int selectedindex;
  @override
  State<SpecialityScreen> createState() => _SpecialityScreenState();
}

class _SpecialityScreenState extends State<SpecialityScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.selectedindex == 0
        ? getspeciality()
        : widget.selectedindex == 1
            ? getproducer()
            : widget.selectedindex == 2
                ? getatozproduct()
                : getspeciality();
  }

  bool isloading = false;
  // int cid;
  List<SpecialityModel> mylist = [];
  // bool isExpanded = false;
  // bool isclicked = false;
  List imagelist = [
    AppAssets.speciality1,
    AppAssets.speciality2,
    AppAssets.speciality3
  ];
  List text = ['speciality', 'procedure', 'A-Z product'];
  List<SpecialityModel> speciality = [];
  List<ProdedureModel> procedure = [];
  List atozproduct = [];

  @override
  Widget build(BuildContext context) {
    print(atozproduct.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: widget.selectedindex == 1
            ? const Text(
                'Procedure',
                style: TextStyle(color: AppColors.white),
              )
            : widget.selectedindex == 2
                ? const Text('A-Z Product',
                    style: TextStyle(color: AppColors.white))
                : const Text(
                    'Speciality',
                    style: TextStyle(color: AppColors.white),
                  ),
      ),
      body:
          // isloading == false
          //     ? Utility.progress()
          //     :
          Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(color: AppColors.background),
                child: Column(children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: imagelist.length,
                      itemBuilder: (context, index) {
                        return specialitybutton(
                            index, imagelist[index], text[index], () {
                          setState(() {
                            widget.selectedindex = index;
                          });
                        });
                      },
                    ),
                  )
                  // specialitybutton(0, AppAssets.speciality1, 'speciality', () {
                  //   setState(() {
                  //     selectedindex = 0;
                  //   });
                  // }),
                  // specialitybutton(1, AppAssets.speciality1, 'speciality', () {
                  //   setState(() {
                  //     selectedindex = 1;
                  //   });
                  // }),
                ]),
              )),
          Flexible(
              flex: 3,
              child: widget.selectedindex == 0
                  ? const SpecialityListWidget()
                  : widget.selectedindex == 1
                      ? const ProdedureListWidget()
                      : widget.selectedindex == 2
                          ? const SpecialityListWidget()
                          : const SpecialityListWidget())
        ],
      ),
    );
  }

  Widget specialitybutton(
      int index, String assetimage, String text, Function()? ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: index == widget.selectedindex
                ? AppColors.nevigationColor
                : Colors.transparent),
        child: Column(children: [
          Container(
            height: 85,
            width: 95,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(assetimage),
            )),
          ),
          Center(
            child: Text(
              text,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: index == widget.selectedindex
                      ? AppColors.white
                      : AppColors.textprimary,
                  fontSize: 18),
            ),
          )
        ]),
      ),
    );
  }

  Future<void> getspeciality() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {};
      SpecialityResponse response = SpecialityResponse.fromJson(
          await ApiManager().getCall(AppString.speciality, request, context));
      log(response.data.toString());
      // log(response.data!.first.appPrivacyPolicy.toString());

      if (response.status == "1" &&
          response.data != null &&
          response.data!.isNotEmpty) {
        isloading = true;
        speciality.addAll(response.data!);
        _notify();

        // log(condition.toString());
      } else {
        Utility.toast(message: "error");
      }
    } else {
      Utility.toast(message: 'check internet connection');
    }
  }

  Future<void> getproducer() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {};
      ProdedureResponse response = ProdedureResponse.fromJson(
          await ApiManager().getCall(AppString.prodedure, request, context));
      log(response.data.toString());
      // log(response.data!.first.appPrivacyPolicy.toString());

      if (response.status == "1" &&
          response.data != null &&
          response.data!.isNotEmpty) {
        isloading = true;
        procedure.addAll(response.data!);
        _notify();

        // log(condition.toString());
      } else {
        Utility.toast(message: "error");
      }
    } else {
      Utility.toast(message: 'check internet connection');
    }
  }

  Future<void> getatozproduct() async {
    if (await ApiManager.checkInternet()) {
      Map<String, dynamic> request = {};
      SpecialityResponse response = SpecialityResponse.fromJson(
          await ApiManager().getCall(AppString.atozproduct, request, context));
      log(response.data.toString());
      // log(response.data!.first.appPrivacyPolicy.toString());

      if (response.status == "1" &&
          response.data != null &&
          response.data!.isNotEmpty) {
        isloading = true;
        atozproduct.addAll(response.data!);
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
