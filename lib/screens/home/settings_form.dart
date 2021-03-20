import 'package:flutter/material.dart';
import 'package:cafe/shared/constants.dart';


class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  //essa globalkey ao form deste widget
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0','1','2','3','4'];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children:<Widget>[
          Text('Update your brew settings',
              style: TextStyle(
                fontSize: 12,
                color: Colors.brown[800],
              )),
        ]
      )
    );
  }
}
