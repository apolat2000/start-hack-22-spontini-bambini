class User {
  User({required this.firstName, required this.lastName});

  String firstName;
  String lastName;

  String get name => firstName + " " + lastName;
}
