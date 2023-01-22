import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysterylab/widgets/secondexpensiontile_widget.dart';
import 'package:mysterylab/widgets/text_for_expensiontile.dart';

import '../models/speciality_model.dart';
import '../response/speciality_response.dart';
import '../screen/product_info.dart';
import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';
import 'expensiontile_widget.dart';

class SpecialityListWidget extends StatefulWidget {
  const SpecialityListWidget({super.key});

  @override
  State<SpecialityListWidget> createState() => _SpecialityListWidgetState();
}

class _SpecialityListWidgetState extends State<SpecialityListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getspeciality();
  }

  bool isloading = false;
  List<SpecialityModel> speciality = [];
  @override
  Widget build(BuildContext context) {
    return isloading == false ? Utility.progress():  ListView.builder(
      shrinkWrap: true,
      itemCount: speciality.length,
      itemBuilder: (context, index) {
        return ExpansionTileWidget(
            ontap: (expanding) {},
            title: speciality[index].categoryName.toString(),
            isExpanded: false,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: speciality[index].categories!.length,
                itemBuilder: (context, i) {
                  return SecondexpensiontileWidget(
                      ontap: (expanding) {
                        setState(() {});
                      },
                     title: speciality[index].categoryName2.toString(),
                      isExpanded: false, 
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: speciality[index].products?.length,
                            itemBuilder: (context, index3) {
                              return expensiontextWidget(
                                ontap: () {
                                  setState(() {});
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductInfoScreen(),
                                  ));
                                },
                                itemname: speciality[index]
                                        .products?[index3]
                                        .entityName
                                        // .products?[index3]
                                        // .entityName
                                        .toString() ??
                                    "",
                              );
                            })
                      ]);
                },
              )
            ]);
      },
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

  _notify() {
    if (mounted) {
      setState(() {});
    }
  }
}
