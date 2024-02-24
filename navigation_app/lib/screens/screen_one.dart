import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);
  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  final Center tab_one = Center(
    child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: Colors.red),
            ),
  );
  final Center tab_two = Center(
     child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 76, 187, 16)),
            ),
   );  
  final Center tab_three = Center(
     child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: Color.fromARGB(255, 221, 11, 240)),
            ),
   );            
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "You are at Screen one",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            bottom: const TabBar(tabs: [
              Icon(Icons.home),
              Icon(Icons.person),
              Icon(Icons.settings),
            ]),
          ),
          body: TabBarView(children: [
            Center(
                child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                tab_one,
                Container(
                  width: 300,
                  height: 300,
                  child: Image.network(
                      "https://th.bing.com/th/id/OIP.JrKqmLhbs8I0iiYCJbrXjwHaFj?w=205&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
                )
              ],
            )),
            tab_two,
            tab_three
          ]),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
        ));
  }
}
