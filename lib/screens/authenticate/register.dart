import 'package:flutter/material.dart';
import 'package:cafe/services/auth.dart';

class Register extends StatefulWidget {
  //criei a funcion como uma var desta classe
  final Function telaASerExibida;

  //contrutora recebendo a function como um parm
  Register({this.telaASerExibida});

  @override
  _RegisterState createState() => _RegisterState();
}

//-----------------------

class _RegisterState extends State<Register> {

  final AuthService _auth = new AuthService();
  //text field state
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(
          'Register to Brew Crew',
        ),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign in'),
              onPressed: () {
                widget.telaASerExibida();
              }),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    //mapeia o conteúdo deste campo na var password
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(obscureText: true, onChanged: (val) {
                //mapeia o conteúdo deste campo na var password
                setState(() => password = val);
              }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('Ocorreu um erro no sign in');

                  } else {
                    print('Sign in anônimo realizado com sucesso!');
                    print(result.uid);
                    print(email);
                    print(password);
                  }
                },
              )
            ]),
          )),
    );
  }
}
