import 'package:flutter/material.dart';

import '../utilitys/appcolor.dart';

class ExpansionTileWidget extends StatefulWidget {
  ExpansionTileWidget(
      {Key? key,
      required this.title,
      required this.children,
      this.sutitalcolor,
      required this.isExpanded,
      this.ontap,
      this.subtital})
      : super(key: key);
  final String title;
  final List<Widget> children;
  String? subtital;
  Color? sutitalcolor;
  Function(bool expanding)? ontap;

  bool isExpanded = false;

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
              colors: widget.isExpanded
                  ? [
                      AppColors.gradiantOne,
                      AppColors.gradiantTwo,
                    ]
                  : [AppColors.white, AppColors.white])),
      child: ExpansionTile(
          leading: const SizedBox(),
          trailing: widget.isExpanded //assets/collapse_arrow.png
              ? const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.primary,
                )
              : const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.grey,
                ),
          onExpansionChanged: (bool expanding) =>
              setState(() => widget.isExpanded = expanding),
          title: Text(
            widget.title,
            style: TextStyle(
                color: widget.isExpanded ? AppColors.primary : Colors.black54,
                fontWeight: FontWeight.bold),
          ),
          children: widget.children),
    );
// Container(
//       margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
//       decoration: BoxDecoration(
//           border: Border.all(color: AppColor.textgrey500),
//           color: AppColor.white,
//           borderRadius: const BorderRadius.all(Radius.circular(12))),
//       child: ExpansionTile(

//           // tilePadding: const EdgeInsets.all(0),
//           title: Row(
//             children: [
//               Expanded(
//                   child: TextWidget(
//                 text: title,
//                 textcolor: AppColor.textgrey,
//                 fontweight: FontWeight.bold,
//               )),
//               TextWidget(
//                 text: subtital ?? "",
//                 textcolor: sutitalcolor ?? AppColor.primaryColor,
//               )
//             ],
//           ),
//           // subtitle: Text(subtitle ?? ""),
//           children: children),
//     );
  }
}
