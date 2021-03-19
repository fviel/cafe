import 'package:cafe/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cafe/services/database.dart';
import 'package:cafe/screens/home/brew_list.dart';
import 'package:cafe/entities/brew.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
        value: DatabaseService().brewStream,
        child: Scaffold(
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
          body: BrewList(),

        )
    );
  }
}
