class User {
  String displayName;
  String email;
  String id;
  String photoUrl;
  String token;

  User({
    this.displayName,
    this.email,
    this.id,
    this.photoUrl,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        displayName: json["displayName"],
        email: json["email"],
        id: json["id"],
        photoUrl: json["photoUrl"],
        token: json["idToken"],
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "id": id,
        "photoUrl": photoUrl,
        "idToken": token,
      };
}
