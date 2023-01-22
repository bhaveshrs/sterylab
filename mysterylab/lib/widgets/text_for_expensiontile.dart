import 'package:flutter/material.dart';

import '../utilitys/appcolor.dart';

class expensiontextWidget extends StatelessWidget {
   expensiontextWidget({super.key,required this.itemname , required this.ontap});
  String itemname;
   Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
            ),
            Text(
              itemname,
              style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
