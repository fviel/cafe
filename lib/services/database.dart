import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafe/entities/brew.dart';

class DatabaseService{

  //uid identifica o documento do user no BD
  final String uid;

  DatabaseService({this.uid});

  //referência pra collection. Se ela não existir, o firestore vai criar pra mim
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  //Stream que notifica sempre que há uma mudança no documento no bd
  Stream<List<Brew>> get brewStream {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // Stream<QuerySnapshot> get brewStream {
  //   return brewCollection.snapshots();
  // }

  //retorna uma lista de entidades Brew do snapshot de documentos da base
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    print('Primeiro doc: ${snapshot.documents.first}');

     return snapshot.documents.map((doc){
       return Brew(
         name: doc.data['name'] ?? '',
         strength: doc.data['strength'] ?? 100,
         sugars: doc.data['sugars']?? '0'
       );
     }).toList();
  }


  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}