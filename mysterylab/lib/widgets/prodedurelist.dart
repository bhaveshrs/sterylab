import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mysterylab/widgets/secondexpensiontile_widget.dart';
import 'package:mysterylab/widgets/text_for_expensiontile.dart';

import '../models/prodedure_model.dart';
import '../response/prodedure_response.dart';
import '../screen/product_info.dart';
import '../utilitys/api_managar.dart';
import '../utilitys/app_string.dart';
import '../utilitys/utility.dart';
import 'expensiontile_widget.dart';
class ProdedureListWidget extends StatefulWidget {
  const ProdedureListWidget({super.key});

  @override
  State<ProdedureListWidget> createState() => _ProdedureListWidgetState();
}

class _ProdedureListWidgetState extends State<ProdedureListWidget> {
  List<ProdedureModel> procedure = [];
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getproducer();
  }

  bool isloading = false;
 
  @override
  Widget build(BuildContext context) {
    return  isloading == false ? Utility.progress():  ListView.builder(
      shrinkWrap: true,
      itemCount: procedure.length,
      itemBuilder: (context, index) {
        return ExpansionTileWidget(
            ontap: (expanding) {},
            title: procedure[index].categoryName.toString(),
            isExpanded: false,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: procedure[index].categories!.length,
                itemBuilder: (context, i) {
                  return SecondexpensiontileWidget(
                      ontap: (expanding) {
                        setState(() {});
                      },
                      title: procedure[index].categoryName2.toString(),
                      isExpanded: false,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: procedure[index].products?.length,
                            itemBuilder: (context, index3) {
                              return expensiontextWidget(
                                ontap: () {
                                  setState(() {});
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductInfoScreen(),
                                  ));
                                },
                                itemname: procedure[index]
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

  _notify() {
    if (mounted) {
      setState(() {});
    }
  }
  
}