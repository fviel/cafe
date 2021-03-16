import 'package:cafe/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(
          'Home Brew Crew',
        ),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign out'),
              onPressed: () async {
                dynamic result = await _auth.signOut();
                if (result == null) {
                  print('SignOut anônimo realizado com sucesso!');
                } else {
                  print('Ocorreu um erro no signOut.');
                  print(result.uid);
                }
              }),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Text('body do widget')),
    );
  }
}
