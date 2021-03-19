import 'package:cafe/entities/user.dart';
import 'package:cafe/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //obtém uma instância do firebase auth, láaa do firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //cria o obj usuário baseado no user do firebase
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // Método que vai retornar firebaseUsers sempre que mudar o estado em Authetication
  //Stream<FirebaseUser> get user{
  Stream<User> get userStream {
    //return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));

    //esta linha faz exatamente o mesmo que a anterior...
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Método para sign in anônimo
  Future signInAnon() async {
    try {
      AuthResult resultado = await _auth.signInAnonymously();
      FirebaseUser user = resultado.user;
      return _userFromFirebaseUser(user);
      //return null;

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //método para sigin in com email e pass
  Future siginWithEmailAndPassword({String email, String password}) async {
    try {
      AuthResult resultado = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = resultado.user;
      print('email: [$email]');
      print('pwd: [$password]');
      //se sucesso, vai me retornar uma entidade user de entities/user.dart
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      print('email: [$email]');
      print('pwd: [$password]');
      return null;
    }
  }

  //registrar como email e pass
  Future registerWithEmailAndPassword({String email, String password}) async {
    try {
      AuthResult resultado = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = resultado.user;

      print('registerWithEmailAndPassword - obtive o user');
      //cria um document no firestore para o novo uid
      // DatabaseService dbService = await DatabaseService(uid: user.uid);
      // dbService.updateUserData('0', 'Novo membro', 100);
      await DatabaseService(uid: user.uid).updateUserData('0', 'Novo membro', 100);
      print('registerWithEmailAndPassword - doc do user criado no firebase');


      print('email: [$email]');
      print('pwd: [$password]');
      //se sucesso, vai me retornar uma entidade user de entities/user.dart
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      print('email: [$email]');
      print('pwd: [$password]');
      return null;
    }
  }


  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
