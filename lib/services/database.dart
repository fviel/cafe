import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  //referência pra collection. Se ela não existir, o firestore vai criar pra mim
  final CollectionReference brewCollection = Firestore.instance.collection('brews');


}