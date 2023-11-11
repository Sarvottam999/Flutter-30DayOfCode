// create model class for login and register
class User {
  final int id;
  final String email;
  final String password;

  User({required this.id,required this.email,required this.password, });

  Map<String, dynamic> toMap() {
    return { "id": id, 'email': email, 'password': password};
  }

  @override
  String toString() {
    return 'Dog{id: $id, email: $email, password: $password,}';
  }
}