import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello"),
          centerTitle: true,
          leading: null,
        ),
        // body: ,
        bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius:BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                Icon(Icons.settings),
                Icon(Icons.person),
                Icon(Icons.info),
              ],
            )));
  }
}
