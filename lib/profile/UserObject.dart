class UserObject {
  final String uid;
  final String name;
  final String email;
  //final DateTime dateTime;
  final String password;

  UserObject({
    required this.uid,
    required this.name,
    required this.email,
    required this.password,
    //required this.dateTime,
  });
  UserObject.fromJson(Map<dynamic, dynamic> res)
      : uid = res['uid'],
        name = res['name'],
        email = res['email'],
        password = res['password'];
        //dateTime = res['dateTime'];

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'name':name,
      'email': email,
      'password': password,
      //'datetime': dateTime,
    };
  }
}
