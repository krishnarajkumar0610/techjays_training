import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruits_scanner/bloc/my_bloc.dart';
import 'package:fruits_scanner/bloc/states.dart';
import 'package:fruits_scanner/widgets/option_widgets/alternate_button.dart';
import 'package:fruits_scanner/widgets/option_widgets/drag_bar.dart';
import 'package:fruits_scanner/widgets/option_widgets/fruit_icon.dart';
import 'package:fruits_scanner/widgets/option_widgets/fruit_name.dart';

import 'option_widgets/add_button.dart';

class OptionBox extends StatefulWidget {
  const OptionBox({super.key});

  @override
  State<OptionBox> createState() => _OptionBoxState();
}

class _OptionBoxState extends State<OptionBox> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: state.containerHeight == false ? 530 : 600,
          left: 20,
          child: Container(
            width: 320,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: const Stack(
              children: [
                DragBar(),
                FruitIcon(),
                FruitName(),
                AlternateButton(),
                AddButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
