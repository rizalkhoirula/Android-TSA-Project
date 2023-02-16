import 'package:flutter/material.dart';
import 'package:semangat/chats.dart';
import 'main.dart';


class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RegisterPage(),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
            ),
          ),
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: ExactAssetImage('assets/img/register.png'),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: const Text(
              "Silahkan isi form pendaftaran dibawah ini dengan benar dan tepat",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          // Padding(padding: EdgeInsets.only(top: 30)),
          // Row(
          //   children: <Widget>[
          //     const Text(
          //       "Create your ",
          //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          //     ),
          //     const Text(
          //       "account",
          //       style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
          //     ),
          //   ],
          // ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 5),
            child: const Text(
              "Create Your Account",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: const Text(
              "Full Name",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter fullname',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
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
          Container(
            padding: EdgeInsets.only(top: 5),
          ),
          CheckboxListTile(
            title: Text(
              'Saya menyetujui syarat, ketentuan, dan privasi Finham',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            value: checked,
            activeColor: Color.fromARGB(255, 16, 29, 37),
            onChanged: (value) {
              print(value);
              setState(() {
                checked = true;
              });
            },
          ),
          Container(
            height: 85,
            padding: EdgeInsets.only(top: 30),
            child: ElevatedButton(
              child: const Text(
                "Register",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
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
                "Already have an account?",
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
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
