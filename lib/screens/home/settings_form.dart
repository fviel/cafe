import 'package:flutter/material.dart';
import 'package:cafe/shared/constants.dart';

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
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          Text('Update your brew settings',
              style: TextStyle(
                fontSize: 12,
                color: Colors.brown[800],
              )),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
              decoration:
                  textInputDecorationFernando.copyWith(hintText: 'Name'),
              //validator é a função que valida o campo
              validator: (val) => val.isEmpty ? 'Please inform a name' : null,
              onChanged: (val) {
                setState(() => _currentName = val);
              }),
          SizedBox(
            height: 20.0,
          ),
          DropdownButtonFormField(
            decoration: textInputDecorationFernando,
            value: _currentSugars ?? '0',
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
            onChanged: (val) => setState(() => _currentStrength = val.round()),
            value: (_currentStrength ?? 100.00).toDouble(),
            min: 100.0,
            max: 900.0,
            divisions: 8,
            //passei o valor de strength dentro, pra mudar a cor do componente
            activeColor: Colors.brown[_currentStrength ?? 100.00],
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
              print('_currentName: ${_currentName}');
              print('_currentSugars: ${_currentSugars}');
              print('_currentStrength: ${_currentStrength}');
            },
          ),
        ]));
  }
}
