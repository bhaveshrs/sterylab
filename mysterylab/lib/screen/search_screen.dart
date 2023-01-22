import 'package:flutter/material.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/utilitys/assets_images.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        title: const Image(
            width: 100, image: AssetImage(AppAssets.sterylabtrnsparant)),
      ),
      backgroundColor: AppColors.background,
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              filled: true,
              hintText: 'Search',
              fillColor: AppColors.white,
              border: InputBorder.none,
            ),
          ),
        )
      ]),
    );
  }
}
