import 'package:flutter/material.dart';
import 'package:cafe/screens/home/home.dart';
import 'package:cafe/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Dependnedo do estado do login, deverá retornar o Home ou o Authenticate
    //return Home();
    return Authenticate();

  }
}
