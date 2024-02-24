import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fruits_scanner/widgets/nutrition_fact.dart';

import '../widgets/option_box.dart';

class ScanFruits extends StatefulWidget {
  const ScanFruits({Key? key}) : super(key: key); // Fixed constructor

  @override
  State<ScanFruits> createState() => _ScanFruitsState();
}

class _ScanFruitsState extends State<ScanFruits> {
  Image setImage(String image) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: setImage("assets/fruit.png")),
            Positioned.fill(
              child: setImage(
                "assets/scan_img.png",
              ),
            ),
            Positioned(
              top: 50.h,
              left: 20.w,
              child: SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: GestureDetector(
                      onTap: () {}, child: Image.asset("assets/close.png"))),
            ),
            const Stack(
              children: [
                NutritionFact(),
                OptionBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
