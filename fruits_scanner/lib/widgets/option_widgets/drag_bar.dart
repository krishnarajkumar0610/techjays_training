import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_scanner/bloc/my_bloc.dart';

import 'package:fruits_scanner/bloc/states.dart';

import '../../bloc/events.dart';

class DragBar extends StatefulWidget {
  const DragBar({super.key});

  @override
  State<DragBar> createState() => _DragBarState();
}

class _DragBarState extends State<DragBar> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Positioned(
          top: 5.h,
          left: 130.w,
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              return context.read<ScannerBloc>().add(BarEvent());
            },
            child: Container(
              width: 60.w,
              height: 8.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r), color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
