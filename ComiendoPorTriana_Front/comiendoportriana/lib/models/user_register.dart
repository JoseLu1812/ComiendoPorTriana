class UserRegister {
  String? email;
  String? username;
  String? password;
  String? verifiedPassword;
  String? fullName;

  UserRegister(this.email, this.username, this.password, this.verifiedPassword,
      this.fullName);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['verifiedPassword'] = verifiedPassword;
    data['fullName'] = fullName;
    return data;
  }
}
