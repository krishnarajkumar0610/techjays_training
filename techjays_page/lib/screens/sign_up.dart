import 'package:flutter/material.dart';
import 'package:project_two/screens/screen_one.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _dateOfbirth = TextEditingController();
  bool b = false;
  String gen = "Select Gender";
  Icon gen_icon = const Icon(Icons.person);
  void setGender(String gender, Icon icon) {
    setState(() {
      gen_icon = icon;
      gen = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            width: 300,
            height: 130,
            child: Image.network(
                "https://th.bing.com/th/id/OIP.JrKqmLhbs8I0iiYCJbrXjwHaFj?w=234&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7"),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: _firstName,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    label: Text("First name"), icon: Icon(Icons.person)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: _lastName,
                decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    label: Text("Last name (Optional)")),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _dateOfbirth,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.date_range),
                    label: Text("Date of birth (YYYY-MM-DD"),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phoneNumber,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  label: Text("Phone number"),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        title: const Text(
                          "Select Gender",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              setGender("Male", const Icon(Icons.male));
                              Navigator.pop(context);
                            },
                            child: Text("Male"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              setGender("Female", const Icon(Icons.female));
                              Navigator.pop(context);
                            },
                            child: Text("Female"),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              setGender("Others", const Icon(Icons.person));
                              Navigator.pop(context);
                            },
                            child: Text("Others"),
                          )
                        ],
                      ));
            },
            icon: gen_icon,
            label: Text('$gen'),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ElevatedButton(
                      onPressed: () {
                        bool b = checkAll();
                        if (b) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenOne()));
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(fontSize: 25),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff553a85)),
                    ),
                  ))),
        ]),
      ),
    );
  }

  bool checkAll() {
    String fName = _firstName.text;
    String lName = _lastName.text;
    String dob = _dateOfbirth.text;
    String phNum = _phoneNumber.text;

    if (fName.startsWith(' ') ||
        fName.isEmpty ||
        dob.isEmpty ||
        phNum.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Techjays sign up form"),
                content: const Text("Please fill all the fields"),
                actions: [
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Close"))
                ],
              ));
      return false;
    } else if (fName == lName) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Techjays sign up form"),
                content: Text("First and Last name should not same"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Close"))
                ],
              ));
      return false;
    } else if (phNum.length != 10) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Techjays sign up form"),
                content: const Text("Phone number contains 10 digits"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Close"))
                ],
              ));
      return false;
    } else if (!dob.isEmpty) {
      List<String> dateAndtime = dob.split('-');

      dynamic year = dateAndtime[0].length == 4 ? int.parse(dateAndtime[0]) : 0;
      dynamic month = dateAndtime[1].length > 0 && dateAndtime[1].length < 3
          ? int.parse(dateAndtime[1])
          : 0;
      dynamic date = dateAndtime[2].length > 0 && dateAndtime[1].length < 3
          ? int.parse(dateAndtime[2])
          : 0;

      if ((year < 2000) ||
          (month < 1 || month > 12) ||
          (date < 1 || date > 31)) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: const Text("Error in Setting date"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"))
                  ],
                ));
        return false;
      }
    }
    return true;
  }
}
