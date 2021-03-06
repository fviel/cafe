import 'package:flutter/material.dart';
import 'package:cafe/services/auth.dart';
import 'package:cafe/shared/constants.dart';
import 'package:cafe/shared/loading.dart';

class SignIn extends StatefulWidget {
  //criei a funcion como uma var desta classe
  final Function telaASerExibida;

  //contrutora recebendo a function como um parm
  SignIn({this.telaASerExibida});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //essa globalkey ao form deste widget
  final _formKey = GlobalKey<FormState>();

  //instancia da classe que criei para tratar os erviço de autenticação
  final AuthService _auth = new AuthService();

  //variáveis locais do text field state
  String email = '';
  String password = '';
  String error = '';

  //controle se estou exibindo a tela de loading
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text(
          'Sign in to Brew Crew',
        ),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.telaASerExibida();
              }),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                //usa a constante que criei lá em shared, mas trocando a var de hint
                decoration: textInputDecorationFernando.copyWith(hintText: 'Email'),
                //validator é a função que valida o campo
                validator: (val) {
                  if (val.isEmpty) {
                    return 'Informe um email';
                  }
                  return null;
                },
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
              TextFormField(
                  decoration: textInputDecorationFernando.copyWith(hintText: 'Password'),
                  obscureText: true,
                  //validator é a função que valida o campo
                  validator: (val) => val.length < 6
                      ? 'Informe uma senha acima de 6 chars'
                      : null,
                  onChanged: (val) {
                    //mapeia o conteúdo deste campo na var password
                    setState(() => password = val);
                  }),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  //valida o form baseado no seu estado atual
                  if (_formKey.currentState.validate()) {
                    setState(() => loading = true);
                    // dynamic result = await _auth.signInAnon();
                    dynamic result = await _auth.siginWithEmailAndPassword(email: email, password: password);
                    if (result == null) {
                      setState(() => error = 'Não foi possível fazer o signin com estas credenciais.');
                      setState(() => loading = false);
                    }
                  } else {
                    print('form inválido');
                  }
                },
              ),
              SizedBox(height: 20.0),
              //exibe a mesg de erro na text abaixo...
              Text(
                error,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ]),
          )),
    );
  }
}
