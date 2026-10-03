import 'dart:convert';

import 'package:appli_perso/homepage.dart';
import 'package:flutter/material.dart';

import 'definitionPerso/perso.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> click() async {
    debugPrint("connection");

    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage("flutter app")));
    });
  }



  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: click,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Connect',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: googleLoginButton(),
      ),
    );
  }
}
