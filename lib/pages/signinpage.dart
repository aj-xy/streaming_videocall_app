import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streaming_videocall_app/pages/contactspage.dart';
import 'package:streaming_videocall_app/pages/signuppage.dart';
import 'package:streaming_videocall_app/providers/authprovider.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 11, 64, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 66, 112, 1),
        foregroundColor: Color.fromRGBO(244, 245, 251, 1),
        title: Text(
          "Signin",
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
              controller: emailController,
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
              controller: passwordController,
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
                  String email = emailController.text;
                  String password = passwordController.text;
                  await authProvider.signIn(email, password);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return contacts();
                    },
                  ));
                },
                child: Text(
                  "Signin",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Dont Have an Account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromRGBO(244, 245, 251, 1)),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(5, 66, 112, 1),
                    foregroundColor: Color.fromRGBO(244, 245, 251, 1)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return signup();
                    },
                  ));
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
