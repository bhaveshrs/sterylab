import 'package:flutter/material.dart';

import '../utilitys/appcolor.dart';

class Bottomnavbutton extends StatelessWidget {
  Bottomnavbutton(
      {super.key,
      required this.icons,
      required this.tital,
      required this.selectedindex,
      required this.index,
      this.ontap});
  int selectedindex;
  int index;
  Function()? ontap;
  IconData icons;
  String tital;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Icon(
            icons,
            color: index == selectedindex ? AppColors.primary : AppColors.white,
          ),
          Text(
            tital,
            style: TextStyle(
              color:
                  index == selectedindex ? AppColors.primary : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
