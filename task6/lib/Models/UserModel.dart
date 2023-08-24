class UserModel {
  String email;
  String firstName;
  String lastName;
  String userId;
  bool isLoggedIn; 

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userId,
    this.isLoggedIn = false, 
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'userId': userId,
      'isLoggedIn': isLoggedIn,
    };
  }
  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      userId: json['userId'],
      isLoggedIn: json['isLoggedIn'] ?? false, 
    );
  }
}