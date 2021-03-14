import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child:Text('Widget Home',
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.orange,
          ),),
      ),
    );
  }
}
