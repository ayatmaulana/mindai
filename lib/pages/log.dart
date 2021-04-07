import 'package:flutter/material.dart';

class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Expanded(
        child: Container(
          // height: 90,
          color: Color(0xFF2c3e50),
        ),
      ),
    ));
  }
}
