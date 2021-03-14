
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{

  //obtém uma instância do firebase auth, láaa do firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Método para sign in anônimo
  Future signInAnon() async{
    try{

     // AuthResult resultado = await _auth.signInAnonymously();
      //FirebaseUser user = resultado.user;
      //return user;
      return null;

    }catch(e){
      print(e.toString());
      return null;
    }
}

  //método para sigin in com email e pass


  //registrar como email e pass

  //sign out
}