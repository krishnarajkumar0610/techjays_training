import "package:flutter/material.dart";
import 'package:navigation_app/screens/drawer_page.dart';
import 'package:navigation_app/screens/screen_one.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Navigation project"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: const Text(
            "Images and colors can be random. clicking on next should scroll to the next screen, clicking on back needs to go back to previous screen, next button shouldn't be displayed in the last screen, back button shouldn't be displayed in the first scree",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScreenOne()));
          },
          child: const Text(
            "Next",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )),
    );
  }
}
