import 'package:flutter/material.dart';
import 'package:mysterylab/screen/search_screen.dart';
import 'package:mysterylab/screen/speciality_screen.dart';
import 'package:mysterylab/widgets/home_container.dart';

import '../utilitys/appcolor.dart';
import '../utilitys/assets_images.dart';

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({super.key});

  @override
  State<SecondHomeScreen> createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
  int? currentindex;
  int currentpage = 0;
  final _controller = PageController(initialPage: 0);
  List mylist = [AppAssets.doctor, AppAssets.labdoctor, AppAssets.speciality1];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            height: 250,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 220,
                  color: AppColors.gradiantOne,
                  child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (int index) {
                        setState(() {
                          currentpage = index;
                        });
                      },
                      itemCount: mylist.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(mylist[index]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  right: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0.5, 1),
                                blurRadius: 10,
                                color: AppColors.grey)
                          ],
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: ' Search',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textgrey))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 1,
                  right: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Developing medical devices for 40 years',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                child: SizedBox(
                                  height: 6,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: mylist.length,
                                    itemBuilder: (context, index) {
                                      return dotContainer(index, context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Flexible(child: SizedBox())
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
          child: Row(
            children: const [
              Text(
                'Search Product by :',
                style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        HomeContainer(
            image: AppAssets.speciality1,
            tital: 'Speciality',
            index: 0,
            currentindex: currentindex,
            ontap: () {
              setState(() {
                currentindex = 0;
              });
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    SpecialityScreen(selectedindex: currentindex!),
              ));
            }),
        HomeContainer(
            image: AppAssets.speciality2,
            tital: 'Procedure',
            index: 1,
            currentindex: currentindex,
            ontap: () {
              setState(() {
                currentindex = 1;
              });
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    SpecialityScreen(selectedindex: currentindex!),
              ));
            }),
        HomeContainer(
            image: AppAssets.speciality3,
            tital: 'Product\'s name A-Z ',
            index: 2,
            currentindex: currentindex,
            ontap: () {
              setState(() {
                currentindex = 2;
              });
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    SpecialityScreen(selectedindex: currentindex!),
              ));
            })
        // Container(
        //   constraints: const BoxConstraints(maxWidth: 600),
        //   padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [
        //           AppColors.gradiantTwo,
        //           AppColors.gradiantOne,
        //         ],
        //       ),
        //       borderRadius: BorderRadius.all(Radius.circular(20))),
        //   margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        //   child: Row(children: [
        //     Expanded(
        //       child: Container(
        //         height: 100,
        //         width: 100,
        //         decoration: const BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(AppAssets.speciality3))),
        //       ),
        //     ),
        //     const Expanded(
        //         child: Text(
        //       'procedure',
        //       style: TextStyle(
        //           color: AppColors.primary,
        //           fontSize: 22,
        //           fontWeight: FontWeight.bold),
        //     ))
        //   ]),
        // ),
        // Container(
        //   constraints: const BoxConstraints(maxWidth: 600),
        //   padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [
        //           AppColors.gradiantTwo,
        //           AppColors.gradiantOne,
        //         ],
        //       ),
        //       borderRadius: BorderRadius.all(Radius.circular(20))),
        //   margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        //   child: Row(children: [
        //     Expanded(
        //       child: Container(
        //         height: 100,
        //         width: 100,
        //         decoration: const BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(AppAssets.speciality2))),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 30,
        //     ),
        //     const Expanded(
        //         child: Text(
        //       'product\'s name A-Z',
        //       style: TextStyle(
        //           color: AppColors.primary,
        //           fontSize: 22,
        //           fontWeight: FontWeight.bold),
        //     ))
        //   ]),
        // )
      ]),
    );
  }

  Widget dotContainer(int i, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      padding: const EdgeInsets.all(3),
      height: 6,
      width: 6,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: currentpage == i ? AppColors.white : Colors.transparent),
    );
  }
}
