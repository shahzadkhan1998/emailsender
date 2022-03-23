import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String name;
  final String subject;
  final String message;
  const HomePage({
    Key? key,
    required this.email,
    required this.name,
    required this.subject,
    required this.message,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? email;
  String? name;
  String? subject;
  String? message;

  final String serviceId = "service_ptawspd";
  final String templateID = "template_zc80uo7";
  final String userID = "user_Wce2FcM9rcwu9sJ6rAf8K";

  Future sendTransactionAlert() async {
    //https://api.emailjs.com/api/v1.0/email/send//
    final Uri uri = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final Response response = await http.post(
      uri,
      headers: {
        'Origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "service_id": serviceId,
        "template_id": templateID,
        "user_id": userID,
        "template_params": {
          "user_email": email,
          "user_name": name,
          "user_message": message,
          "from_subject": subject,
          "from_name": "Admin",
          "user_account": "265458745211232",
          "user_bankID": "110211",
        },
      }),
    );
    debugPrint(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send Email"),
      ),
      body:  Center(
        child: ElevatedButton(
          onPressed: () {
            sendTransactionAlert();
          },
          
          child: const Text("Sent Email"),
        ),
      ),
    );
  }
}
