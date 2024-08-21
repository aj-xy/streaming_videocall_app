import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/authprovider.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 11, 64, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 66, 112, 1),
        foregroundColor: Color.fromRGBO(244, 245, 251, 1),
        title: Text(
          "SignUp",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailcontroller,
              style: TextStyle(
                  color: Color.fromRGBO(1, 18, 24, 1),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  hintText: "Email",
                  fillColor: Color.fromRGBO(244, 245, 251, 1),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(244, 245, 251, 1))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(244, 245, 251, 1)))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordcontroller,
              obscureText: true,
              style: TextStyle(
                  color: Color.fromRGBO(1, 18, 24, 1),
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  hintText: "Password",
                  fillColor: Color.fromRGBO(244, 245, 251, 1),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(244, 245, 251, 1))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(244, 245, 251, 1)))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(5, 66, 112, 1),
                    foregroundColor: Color.fromRGBO(244, 245, 251, 1)),
                onPressed: () async {
                  String email = emailcontroller.text;
                  String password = passwordcontroller.text;
                  await authProvider.register(email, password);
                  if (authProvider.user != null) {
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign up failed'),
                      ),
                    );
                  }
                },
                child: Text(
                  "SignUp",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ],
        ),
      )),
    );
  }
}
