import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_scanner/bloc/my_bloc.dart';
import 'package:fruits_scanner/bloc/states.dart';

class NutritionFact extends StatelessWidget {
  const NutritionFact({super.key});

  Text textTitle(String text, double size) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size),
    );
  }

  SizedBox space() {
    return const SizedBox(
      width: 20,
    );
  }

  Column columnText(String title, String subTitile, double size) {
    return Column(
      children: [textTitle(title, size), textTitle(subTitile, size)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: state.containerHeight==false ? 10:-120,
          left: 20,
          child: Container(
              width: 320,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: 100,
                      top: 10,
                      child: textTitle("Nutrition Fact", 15)),
                  Positioned(
                    top: 40,
                    left: 25,
                    child: Row(children: [
                      columnText("Serving Size", "170g", 10),
                      space(),
                      columnText("Calories", "150", 10),
                      space(),
                      columnText("Carbs", "1g", 10),
                      space(),
                      columnText("Protein", "30g", 10),
                      space(),
                      columnText("Fat", "5g", 10)
                    ]),
                  )
                ],
              )),
        );
      },
    );
  }
}
