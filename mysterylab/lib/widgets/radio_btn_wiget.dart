import 'package:flutter/material.dart';
import 'package:mysterylab/utilitys/appcolor.dart';

class RdioBtnWidget extends StatelessWidget {
  RdioBtnWidget({super.key, required this.index, this.myvalue, this.ontap ,required this.text});
  int? myvalue;
  int index;
  Function(int?)? ontap;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: myvalue == index
                  ? [AppColors.gradiantTwo, AppColors.gradiantOne]
                  : [Colors.white, Colors.white]),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Radio(
              activeColor: AppColors.primary,
              value: index,
              groupValue: myvalue,
              onChanged: ontap
              // (value) {
              //   setState(() {
              //     widget.myvalue = value;
              //   });
              // },
              ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
