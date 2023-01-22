import 'package:flutter/material.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/utilitys/assets_images.dart';
import 'package:mysterylab/widgets/common_button_widget.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Product info',
          style: TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 250,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.productinfo), fit: BoxFit.fill)),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text: 'PROJECT',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                WidgetSpan(
                  child: Transform.translate(
                    offset: const Offset(4, -5),
                    child: const Text(
                      '®',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textScaleFactor: 0.7,
                    ),
                  ),
                )
              ]),
            )

            // Text(
            //   'porject^®',
            //   style: TextStyle(
            //       color: AppColors.primary,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 24),
            // ),
            ),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Huber needlees and set',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColors.primary,
            unselectedLabelColor: AppColors.tabunselctedcolor,
            labelColor: AppColors.primary,
            controller: controller,
            tabs: const [
              Tab(
                text: 'Discription',
              ),
              Tab(
                text: 'instruction for use',
              ),
            ],
          ),
        ),
        const Divider(
          height: 5,
          thickness: 5,
          color: AppColors.background,
        ),
        Flexible(
          child: TabBarView(
            controller: controller,
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    ' data' * 100,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(' data ' * 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CommonButtonWidget(
                        onTap: () {}, text: 'Download instruction'),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 200,
                    decoration: const BoxDecoration(
                        color: AppColors.background,
                        image: DecorationImage(
                            image: AssetImage(AppAssets.labdoctor),
                            fit: BoxFit.fill)),
                  )
                ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
