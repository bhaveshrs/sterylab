import 'package:flutter/material.dart';
import 'package:mysterylab/screen/company_screen.dart';
import 'package:mysterylab/screen/contect_screen.dart';
import 'package:mysterylab/screen/language_screen.dart';
import 'package:mysterylab/screen/second_Home_screen.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/utilitys/assets_images.dart';
import 'package:mysterylab/widgets/drawer_widget.dart';

import '../widgets/navbar_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List imagelist = [AppAssets.speciality1];
  List Screenlist = [
    const SecondHomeScreen(),
    const ComapnyScreen(),
    const ContectScreen(),
    const LanguageScreen()
  ];

  List homepagetext = ['speciality', 'procedure', 'product\'s name A-Z'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          selectedindex == 1 ? AppColors.white : AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading:
            selectedindex == 1 || selectedindex == 2 ? false : true,
        bottom: selectedindex == 1
            ? PreferredSize(
                preferredSize: const Size.fromHeight(200),
                child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(color: AppColors.primary),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage(AppAssets.sterylabtrnsparant),
                          width: 150,
                        ),
                        Text(
                          'Devloping medical device for 40 years',
                          style: TextStyle(color: AppColors.white),
                        )
                      ]),
                ))
            : null,
        elevation: 0,
        leading: selectedindex == 1 || selectedindex == 0 || selectedindex == 2
            ? null
            : const Icon(Icons.arrow_back_ios),
        backgroundColor: AppColors.primary,
        title: (selectedindex == 1)
            ? null
            : (selectedindex == 3)
                ? const Text(
                    'Select language',
                    style: TextStyle(color: AppColors.white),
                  )
                : const Image(
                    image: AssetImage(AppAssets.sterylabtrnsparant),
                    height: 50,
                    width: 100,
                  ),
        centerTitle: selectedindex == 0 || selectedindex == 2 ? true : false,
      ),
      drawer: selectedindex == 1 || selectedindex == 2 || selectedindex == 3
          ? null
          : const Drawer(
              backgroundColor: AppColors.primary, child: DrawerWidget()),
      body: Screenlist[selectedindex],
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppColors.transperent,
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxHeight: 60),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: AppColors.nevigationColor,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Expanded(
                  child: Bottomnavbutton(
                icons: Icons.view_compact,
                tital: 'Home',
                index: 0,
                selectedindex: selectedindex,
                ontap: () {
                  setState(() {
                    selectedindex = 0;
                  });
                },
              )),
              Expanded(
                  child: Bottomnavbutton(
                icons: Icons.account_balance,
                tital: 'Company',
                index: 1,
                selectedindex: selectedindex,
                ontap: () {
                  setState(() {
                    selectedindex = 1;
                  });
                },
              )),
              Expanded(
                  child: Bottomnavbutton(
                icons: Icons.mail,
                tital: 'Contact',
                index: 2,
                selectedindex: selectedindex,
                ontap: () {
                  setState(() {
                    selectedindex = 2;
                  });
                },
              )),
              Expanded(
                  child: Bottomnavbutton(
                icons: Icons.public,
                tital: 'Language',
                index: 3,
                selectedindex: selectedindex,
                ontap: () {
                  setState(() {
                    selectedindex = 3;
                  });
                },
              )),
            ],
          ),

          // child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       GestureDetector(
          //         onTap: () {},
          //         child: Column(
          //           children: const [
          //             Icon(
          //               Icons.account_balance_outlined,
          //               color: AppColors.white,
          //             ),
          //             Text(
          //               'company',
          //               style: TextStyle(
          //                 color: AppColors.white,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //
          //       GestureDetector(
          //         onTap: () {},
          //         child: Column(
          //           children: const [
          //             Icon(
          //               Icons.language,
          //               color: AppColors.white,
          //             ),
          //             Text(
          //               'Language',
          //               style: TextStyle(
          //                 color: AppColors.white,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
