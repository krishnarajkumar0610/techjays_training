import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitName extends StatefulWidget {
  const FruitName({super.key});

  @override
  State<FruitName> createState() => _FruitNameState();
}

class _FruitNameState extends State<FruitName> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 22.h,
      left: 90.w,
      child: Text(
        "Strawberry",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          letterSpacing: 0.5.sp,
        ),
      ),
    );
  }
}
