import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final icons = const [
    Icon(Icons.mail),
    Icon(Icons.settings),
    Icon(Icons.notifications),
    Icon(Icons.chat),
    Icon(Icons.share),
    Icon(Icons.logout),
  ];
  final titles = [
    "Upload your Resume",
    "Settings",
    "Notification",
    "Chat with your buddies",
    "Share",
    "Sign out"
  ];
  final taps = [
    "Resume tapped",
    "Settings tapped",
    "Chat tapped",
    "Share tapped",
    "Sign out tapped"
  ];

  final userDetails = Flexible(
    child: ListView(
      children: const [
        UserAccountsDrawerHeader(
          accountEmail: Text(
            "Tonystark@gmail.com",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          accountName: Text("Tony stark"),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
            child: Image(
                image: NetworkImage(
                    "https://th.bing.com/th/id/OIP.k1jkY-qgTlzYmLkF4R4XXgHaHa?w=218&h=219&c=7&r=0&o=5&dpr=1.5&pid=1.7")),
          )),
          decoration: BoxDecoration(color: Colors.black),
        ),
      ],
    ),
  );

  Flexible buildOptions() {
    return Flexible(
        flex: 2,
        child: ListView.builder(
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return Column(children: [
              ListTile(
                leading: icons[index],
                title: Text(titles[index]),
                onTap: () => print(taps[index]),
              ),
              const Divider()
            ]);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      userDetails,
      // ListView.builder(itemBuilder: )
      buildOptions(),
      Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: const Text(
            "Project 1",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ))
    ]));
  }
}
