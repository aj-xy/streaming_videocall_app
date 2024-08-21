import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streaming_videocall_app/pages/signinpage.dart';
import 'package:streaming_videocall_app/providers/authprovider.dart';
import 'package:streaming_videocall_app/providers/calleridprovider.dart';
import 'package:streaming_videocall_app/pages/homepage.dart';
import 'package:streaming_videocall_app/services/signallingservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(
        create: (context) => CallerIDProvider(
          Random().nextInt(999999).toString().padLeft(6, '0'),
        ),
      ),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final String websocketUrl = "WEB_SOCKET_SERVER_URL";
  @override
  Widget build(BuildContext context) {
    final selfCallerID = Provider.of<CallerIDProvider>(context).callerID;

    SignallingService.instance.init(
      websocketUrl: websocketUrl,
      selfCallerID: selfCallerID,
    );
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/login': (context) => signin(),
      },
    );
  }
}
