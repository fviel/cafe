
import 'package:cafe/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

  //obtém uma instância do firebase auth, láaa do firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //cria o obj usuário baseado no user do firebase
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid):null;
  }

  // Método que vai retornar firebaseUsers sempre que mudar o estado em Authetication
  //Stream<FirebaseUser> get user{
  Stream<User> get user{
    //return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));

    //esta linha faz exatamente o mesmo que a anterior...
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //Método para sign in anônimo
  Future signInAnon() async{
    try{

      AuthResult resultado = await _auth.signInAnonymously();
      FirebaseUser user = resultado.user;
      return _userFromFirebaseUser(user);
      //return null;

    }catch(e){
      print(e.toString());
      return null;
    }
}

  //método para sigin in com email e pass


  //registrar como email e pass

  //sign out
}