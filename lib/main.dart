import 'package:flutter/material.dart';
import 'register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

void main(List<String> args) {
  runApp(login());
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool _switchVal = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoggedIn = false;
  String name = '';

  @override
  void initState() {
    super.initState();
    autoLogIn();
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('username');

    if (userId != null && userId == 'Admin') {
      setState(() {
        isLoggedIn = true;
        name = userId;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: ExactAssetImage('assets/img/login.png'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: const Text(
              "Silahkan masuk menggunakan username dan password anda",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5),
            child: const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 19),
            child: const Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter username',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: const Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter password',
              ),
            ),
          ),
          Container(),
          Container(
            height: 85,
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                String uname = nameController.text;
                String pass = passwordController.text;
                if (uname == "root" && pass == "root") {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(content: Text("Selamat Datang Admin")));
                  addStringToSF(uname);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Username atau password salah")));
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 16, 29, 37)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Does not have account?",
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => register())),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 16, 29, 37)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

addStringToSF(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('username', value);
}

getStringValueSF() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? userId = prefs.getString('username');
  return userId;
}
