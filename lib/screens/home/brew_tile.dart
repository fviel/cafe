import 'package:flutter/material.dart';
import 'package:cafe/entities/brew.dart';

class BrewTile extends StatelessWidget {

  final Brew brew;

  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
            backgroundImage: AssetImage('assets/images/coffee_icon.png'),
          ),
            title: Text(brew.name),
          subtitle: brew.sugars == '0' ? Text('Takes no sugar') :  brew.sugars == '1' ? Text('Takes ${brew.sugars} only one sugar') : Text('Takes ${brew.sugars} sugars'),
        ),
      ),
    );
  }
}
