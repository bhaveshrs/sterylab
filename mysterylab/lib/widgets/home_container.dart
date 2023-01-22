import 'package:flutter/material.dart';

import '../utilitys/appcolor.dart';

class HomeContainer extends StatelessWidget {
  HomeContainer(
      {super.key,
      required this.index,
      required this.currentindex,
      required this.ontap,
      required this.image,
      required this.tital});
  int index;
  int? currentindex;
  Function() ontap;
  String image;
  String tital;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        padding: const EdgeInsets.only(top: 15, bottom: 15, right: 30),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppColors.gradiantTwo,
                AppColors.gradiantOne,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 45),
        child: Row(children: [
          Container(
            // padding: const EdgeInsets.all(10),
            height: 70,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                // fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Text(
            tital,
            // textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          )),
          const SizedBox(
            width: 5,
          )
        ]),
      ),
    );
  }
}
