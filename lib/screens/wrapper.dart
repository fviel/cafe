import 'package:flutter/material.dart';
import 'package:cafe/screens/home/home.dart';
import 'package:cafe/screens/authenticate/authenticate.dart';
import 'package:cafe/services/auth.dart';
import 'package:cafe/entities/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Sempre que um user login, a main.dart captura o evento da stream pelo provider e atualiza esta var
    final user = Provider.of<User>(context);
    print(user);
    //dependendo do objeto user que eu receber, encaminharei ele para um outro widget
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
