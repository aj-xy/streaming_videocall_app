import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:streaming_videocall_app/pages/signinpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 11, 64, 1),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    color: Color.fromRGBO(244, 245, 251, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
              SizedBox(
                height: 20,
              ),
              Lottie.network(
                  'https://lottie.host/5b8a6bdc-102a-461c-b3e4-b3ef1e9e57b2/IAk5aa1OeU.json'
                  // 'https://lottie.host/060ebb02-752a-43f8-9262-0685c8923a81/HSb53CaT0V.json'
                  ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(5, 66, 112, 1),
                      foregroundColor: Color.fromRGBO(244, 245, 251, 1)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return signin();
                      },
                    ));
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
