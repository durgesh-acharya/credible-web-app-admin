// @dart=2.9
import 'package:flutter/material.dart';

class ReedemScreen extends StatefulWidget {
 

  @override
  State<ReedemScreen> createState() => _ReedemScreenState();
}

class _ReedemScreenState extends State<ReedemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
      ),
      body: Center(child : Text("Reedem")),
    );
  }
}