import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_scanner/bloc/my_bloc.dart';
import 'package:fruits_scanner/bloc/states.dart';

class FruitIcon extends StatefulWidget {
  const FruitIcon({super.key});

  @override
  State<FruitIcon> createState() => _FruitIconState();
}

class _FruitIconState extends State<FruitIcon> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Positioned(
          top: 10.h,
          left: 30.w,
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 25.r,
            child: Padding(
              padding:  EdgeInsets.all(5.0.w),
              child: Image.asset("assets/strawberry.png"),
            ),
          ),
        );
      },
    );
  }
}
