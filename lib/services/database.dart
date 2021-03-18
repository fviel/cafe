import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  //uid identifica o documento do user no BD
  final String uid;

  DatabaseService({this.uid});

  //referência pra collection. Se ela não existir, o firestore vai criar pra mim
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  //Stream que notifica sempre que há uma mudança no documento no bd
  Stream<QuerySnapshot> get brewStream {
    return brewCollection.snapshots();
  }

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}