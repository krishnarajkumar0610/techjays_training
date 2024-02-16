import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_scanner/bloc/events.dart';
import 'package:fruits_scanner/bloc/my_bloc.dart';
import 'package:fruits_scanner/bloc/states.dart';

class AlternateButton extends StatefulWidget {
  const AlternateButton({super.key});

  @override
  State<AlternateButton> createState() => _AlternateButtonState();
}

class _AlternateButtonState extends State<AlternateButton> {
  GestureDetector getButton(String text) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 250,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.deepPurple),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      left: 20,
      child: BlocConsumer<ScannerBloc, ScannerState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            width: 130,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepPurple,
            ),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // title: const Text('Select an Option'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 200,
                            // Adjust the height according to your need
                            //width: double.maxFinite,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Column(
                                  children: List.generate(
                                    6,
                                    // Replace 10 with the number of options you have
                                    (index) => ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            state.selectedIndex == index
                                                ? Colors.black
                                                : Colors.white,
                                        child: state.selectedIndex == index
                                            ? const Icon(Icons.check,
                                                color: Colors.white)
                                            : null,
                                      ),
                                      title: Text(state.options[index]),
                                      onTap: () {
                                        context
                                            .read<ScannerBloc>()
                                            .add(SetOption(index: index));
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          getButton("Search Manually"),
                          const SizedBox(
                            height: 5,
                          ),
                          getButton("Cancel")
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Center(
                child: Text(
                  "Alternative",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
