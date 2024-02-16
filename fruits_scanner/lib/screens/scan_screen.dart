import 'package:flutter/material.dart';

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
            SizedBox(
              width: double.infinity,
              child: setImage("assets/fruit.png"),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: setImage(
                "assets/scan_img.png",
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: SizedBox(
                  width: 30,
                  height: 30,
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
