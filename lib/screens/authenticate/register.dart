import 'package:flutter/material.dart';
import 'package:cafe/services/auth.dart';
import 'package:cafe/shared/constants.dart';
import 'package:cafe/shared/loading.dart';

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
  //essa globalkey ao form deste widget
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = new AuthService();

  //text field state
  String email = '';
  String password = '';
  String error = '';

  //controle se estou exibindo a tela de loading
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //faz um ternário pra decidir se vai mostrar o widget de loading ou a tela
    return loading ?  Loading() : Scaffold(
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
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecorationFernando.copyWith(hintText: 'Email'),
                //validator é a função que valida o campo
                validator:(val){
                  if(val.isEmpty){
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
                  validator:(val) => val.length<6 ? 'Informe uma senha acima de 6 chars' :  null,
                  onChanged: (val) {
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
                  //valida o form baseado no seu estado atual
                  if (_formKey.currentState.validate()) {
                    //ativa o widget de loading
                    setState(() => loading = true);
                    dynamic result = await _auth.registerWithEmailAndPassword(email:email, password:password);
                    if(result == null){
                      //adicionada esta validação para remover o erro de 'Unhandled Exception: setState() called after dispose():'
                      if (this.mounted) {
                        setState(() {
                          error = 'Falha ao registrar o usuário.';
                          loading = false;
                        });
                      }
                    }
                  //   //se não falhou na criação do usuário, a Stream de _auth já notificou o Wrapper e já roteou o usuário pra home...
                  // } else {
                  //   print('form inválido');
                   }
                },
              ),
              SizedBox(height: 20.0),
              //exibe a mesg de erro na text abaixo...
              Text(
                error,
                style:TextStyle(
                  fontSize: 14,
                  color:Colors.red,
                ),
              ),
            ]),
          )),
    );
  }
}
