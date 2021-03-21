import 'package:cafe/entities/user.dart';
import 'package:cafe/services/database.dart';
import 'package:cafe/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:cafe/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  //essa globalkey ao form deste widget
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final userLocal = Provider.of<User>(context);

    //para escutar uma Stream, posso usar o Provider, como foi feito em outras telas, ou usar o método aqui apresentado
    return StreamBuilder<UserData>(
        //mapeia o Stream a ser escutado
        stream: DatabaseService(uid: userLocal.uid).userDataStream,
        //dentro de builder, retornamos um Widget numa function
        //esse snapshot não é o do firebase, é uma implementação do  flutter sobre os dados vindos da stream
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //ok, se tem dados, então vamos usar isso
            UserData userDataLocal = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  Text('Update your brew settings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.brown[800],
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration:
                        textInputDecorationFernando.copyWith(hintText: 'Name'),
                    //validator é a função que valida o campo
                    validator: (val) =>
                        val.isEmpty ? 'Please inform a name' : null,
                    onChanged: (val) {
                      setState(() => _currentName = val);
                    },
                    initialValue: userDataLocal.name,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                    decoration: textInputDecorationFernando,
                    value: _currentSugars ?? userDataLocal.sugars,
                    onChanged: (val) => setState(() => _currentSugars = val),
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugars'),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Slider(
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                    value:
                        (_currentStrength ?? userDataLocal.strength).toDouble(),
                    min: 100.0,
                    max: 900.0,
                    divisions: 8,
                    //passei o valor de strength dentro, pra mudar a cor do componente
                    activeColor: Colors
                        .brown[_currentStrength ?? userDataLocal.strength],
                    inactiveColor: Colors.brown[100],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print('form da aba de baixo válido');

                        await DatabaseService(uid: userLocal.uid).updateUserData(
                            _currentSugars ?? userDataLocal.sugars,
                            _currentName ?? userDataLocal.name ,
                            _currentStrength ?? userDataLocal.strength);
                        //esconde a aba inferior
                        Navigator.pop(context);
                      } else {
                        print('form da aba de baixo inválido');
                      }

                      print('_currentName: ${_currentName}');
                      print('_currentSugars: ${_currentSugars}');
                      print('_currentStrength: ${_currentStrength}');
                    },
                  ),
                ]));
          } else {
            // esse  else é do if lá do topo do método
            //se não tem dados, exibe o loading
            return Loading();
          }
        });
  }
}
