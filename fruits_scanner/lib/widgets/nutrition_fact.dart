import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SizedBox(
      width: 20.w,
    );
  }

  Column columnText(String title, String subTitle, double size) {
    return Column(
      children: [textTitle(title, size), textTitle(subTitle, size)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          bottom: state.containerHeight == false ? 10.h : -120.h,
          left: 20.w,
          child: Container(
              width: 320.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Positioned(
                      left: 100.w,
                      top: 10.h,
                      child: textTitle("Nutrition Fact", 15.sp)),
                  Positioned(
                    top: 40,
                    left: 25,
                    child: Row(children: [
                      columnText("Serving Size", "170g", 10.sp),
                      space(),
                      columnText("Calories", "150", 10.sp),
                      space(),
                      columnText("Carbs", "1g", 10.sp),
                      space(),
                      columnText("Protein", "30g", 10.sp),
                      space(),
                      columnText("Fat", "5g", 10.sp)
                    ]),
                  )
                ],
              )),
        );
      },
    );
  }
}
