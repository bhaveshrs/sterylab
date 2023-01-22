import 'package:flutter/material.dart';
import 'package:mysterylab/widgets/radio_btn_wiget.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int? myvalue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        RdioBtnWidget(
          text: "English",
          index: 1,
          myvalue: myvalue,
          ontap: (p0) {
            setState(() {
              myvalue = p0;
            });
          },
        ),
        RdioBtnWidget(
          text: "Spanish",
          index: 2,
          myvalue: myvalue,
          ontap: (p0) {
            setState(() {
              myvalue = p0;
            });
          },
        ),
        RdioBtnWidget(
          text: "Italian",
          index: 3,
          myvalue: myvalue,
          ontap: (p0) {
            setState(() {
              myvalue = p0;
            });
          },
        ),
        // Container(
        //   decoration: const BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.all(Radius.circular(10))),
        //   margin: const EdgeInsets.all(10),
        //   padding: const EdgeInsets.all(20),
        //   child: Row(
        //     children: [
        //       Radio(
        //         value: 2,
        //         groupValue: myvalue,
        //         onChanged: (value) {
        //           setState(() {
        //             myvalue = value;
        //           });
        //         },
        //       ),
        //       const SizedBox(
        //         width: 20,
        //       ),
        //       const Expanded(
        //         child: Text(
        //           'Language screen',
        //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Container(
        //   child: Row(
        //     children: [
        //       Radio(
        //         value: 3,
        //         groupValue: myvalue,
        //         onChanged: (value) {
        //           setState(() {
        //             myvalue = value;
        //           });
        //         },
        //       ),
        //       const Text(
        //         'Language screen',
        //         style: TextStyle(fontSize: 30),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
