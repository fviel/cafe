import 'package:cafe/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cafe/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  //var para controle de qual tela vou exibir
  bool showSignIn = true;

  //Método que apenas inverte o valor de signIn
  void toggleView(){
   setState(() {
     showSignIn = !showSignIn;
   });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(telaASerExibida: toggleView);
    } else {
      return Register(telaASerExibida: toggleView);
    }
  }
}
