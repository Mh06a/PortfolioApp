class User {
  //step1 ----> here I will Create the class's variables :
  final int id;
  final String username;
  final String password;

  //step2 ----> here I will Create The constructor :
  User({required this.id, required this.username, required this.password});

  //step3 ----> here I will Create Methode to transfer from Json :
  factory User.fromJson(Map<String, dynamic> josn) {
    return User(
      id: josn['id'],
      username: josn['username'],
      password: josn['password'],
    );
  }
}
