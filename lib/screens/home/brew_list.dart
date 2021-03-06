import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:cafe/entities/brew.dart';
import 'package:cafe/screens/home/brew_tile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];
    brews.forEach((brew) {
      print(brew.name);
      print(brew.sugars);
      print(brew.strength);
    });


    //Retorna a lista de brews, cada um vira um card BrewTile
    return ListView.builder(
      itemCount:brews.length,
      itemBuilder: (context, index){
        return BrewTile(brew:brews[index]);
      },
    );
  }
}
