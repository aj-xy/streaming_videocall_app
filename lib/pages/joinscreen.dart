import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streaming_videocall_app/providers/calleridprovider.dart';
import 'package:streaming_videocall_app/pages/callscreen.dart';
import 'package:streaming_videocall_app/services/signallingservice.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  dynamic incomingSDPOffer;
  final remoteCallerIdTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    SignallingService.instance.socket!.on("newCall", (data) {
      if (mounted) {
        setState(() => incomingSDPOffer = data);
      }
    });
  }

  _joinCall({
    required String callerId,
    required String calleeId,
    dynamic offer,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CallScreen(
          callerId: callerId,
          calleeId: calleeId,
          offer: offer,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final callerIdProvider = Provider.of<CallerIDProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 11, 64, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(5, 66, 112, 1),
        foregroundColor: Color.fromRGBO(244, 245, 251, 1),
        centerTitle: true,
        title: const Text(""),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      style: TextStyle(
                          color: Color.fromRGBO(1, 18, 24, 1),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          prefixText: "Your Caller ID",
                          fillColor: Color.fromRGBO(244, 245, 251, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(244, 245, 251, 1))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(244, 245, 251, 1)))),
                      controller: TextEditingController(
                        text: callerIdProvider.callerID,
                      ),
                      readOnly: true,
                      textAlign: TextAlign.center,
                      enableInteractiveSelection: false,
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: remoteCallerIdTextEditingController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(1, 18, 24, 1),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: "Remote Caller ID",
                          fillColor: Color.fromRGBO(244, 245, 251, 1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(244, 245, 251, 1))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(244, 245, 251, 1)))),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(5, 66, 112, 1),
                          foregroundColor: Color.fromRGBO(244, 245, 251, 1)),
                      child: const Text(
                        "Invite",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _joinCall(
                          callerId: callerIdProvider.callerID,
                          calleeId: remoteCallerIdTextEditingController.text,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (incomingSDPOffer != null)
              Positioned(
                child: ListTile(
                  title: Text(
                    "Incoming Call from ${incomingSDPOffer["callerId"]}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.call_end),
                        color: Colors.redAccent,
                        onPressed: () {
                          setState(() => incomingSDPOffer = null);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.call),
                        color: Colors.greenAccent,
                        onPressed: () {
                          _joinCall(
                            callerId: incomingSDPOffer["callerId"]!,
                            calleeId: callerIdProvider.callerID,
                            offer: incomingSDPOffer["sdpOffer"],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
