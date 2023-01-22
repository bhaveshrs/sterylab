import 'package:flutter/material.dart';

import '../utilitys/appcolor.dart';

class SecondexpensiontileWidget extends StatefulWidget {
  SecondexpensiontileWidget(
      {Key? key,
      required this.title,
      required this.children,
      this.color,
      required this.isExpanded,
      this.ontap,
      this.subtital})
      : super(key: key);
  final String title;
  final List<Widget> children;
  String? subtital;
  Color? color;
  Function(bool expanding)? ontap;

  bool isExpanded = false;

  @override
  State<SecondexpensiontileWidget> createState() =>
      _SecondexpensiontileWidgetState();
}

class _SecondexpensiontileWidgetState extends State<SecondexpensiontileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          color: widget.isExpanded
              ? AppColors.nevigationColor
              : AppColors.background,
          borderRadius: const BorderRadius.all(Radius.circular(10))
          // gradient: LinearGradient(
          //     begin: FractionalOffset.centerLeft,
          //     end: FractionalOffset.centerRight,
          //     // stops: [0.1, 1.0],
          //     // tileMode: TileMode.clamp,
          //     colors: widget.isExpanded
          //         ? [
          //             AppColors.gradiantTwo, AppColors.gradiantOne,
          //             //closed solid
          //           ]
          //         : [AppColors.white, AppColors.white])
          ),
      // color: Colors.brown,
      child: ExpansionTile(
          //backgroundColor: Colors.amberAccent,
          trailing: const SizedBox(),
          onExpansionChanged: (bool expanding) =>
              setState(() => widget.isExpanded = expanding),
          title: Text(
            widget.title,
            style: const TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold),
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
