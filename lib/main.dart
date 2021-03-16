import 'package:flutter/material.dart';
import 'package:cafe/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:cafe/services/auth.dart';
import 'package:cafe/entities/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( //tem que tipar a stream, estou recebendo a User
      value:AuthService().userStream, //userStream é o nome da stream que estou capturando
      child: MaterialApp(
        home:Wrapper(),
      ),
    );
  }
}

