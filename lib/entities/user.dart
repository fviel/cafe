//representa o usuário logado
class User{
  final String uid;
  // final bool isAnonymous;
  // final String phoneNumber;
  // final String providerId;
  // final String displayName;
  // final String email
  // final Long creationTimestamp;
  // final Long lastSignInTimestamp;
  // final bool isEmailVerified;

  User ({ this.uid});
}


//representa os dados de aplicação de um dado usuário
class UserData{
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid, this.name, this.sugars, this.strength});
}