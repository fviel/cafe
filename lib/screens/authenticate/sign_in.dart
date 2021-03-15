import 'package:flutter/material.dart';
import 'package:cafe/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(
          'Sign in to Brew Crew',
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
            child: Text('Sign in anon'),
            onPressed: () async {
              dynamic result =  await _auth.signInAnon();
              if(result == null){
                print('Ocorreu um erro no sign in');
              }else{
                print('Sign in anônimo realizado com sucesso!');
                print(result.uid);
              }
            }),
      ),
    );
  }
}