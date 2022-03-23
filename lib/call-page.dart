import 'package:flutter/material.dart';

import 'home.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('First Page'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage(
                      email: 'sk266349@gmail.com',
                      message:
                          'Hello iam from call page, this testing purposes',
                      name: 'XYZ',
                      subject: 'Admin Testing',
                    )));
          },
          child: Text("NextPage"),
        ),
      ),
    );
  }
}
