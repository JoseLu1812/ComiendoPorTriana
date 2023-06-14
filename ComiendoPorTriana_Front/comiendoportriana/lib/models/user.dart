import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/login.dart';

class User {
  String? id;
  String? username;
  String? fullName;
  String? email;
  List<BarContent>? favList;
  String? createdAt;

  User(
      {this.id,
      this.username,
      this.fullName,
      this.email,
      this.favList,
      this.createdAt});

  User.fromLoginResponse(LoginResponse response) {
    id = response.id;
    username = response.username;
    fullName = response.fullName;
    email = response.email;
    favList = response.favList;
    createdAt = response.createdAt;
  }
}

class UserResponse extends User {
  UserResponse(id, username, fullName, email, favList, comments, createdAt)
      : super(id: id, username: username, fullName: fullName, email: email, favList: favList, /*comments: comments,*/ createdAt: createdAt);

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
    email = json['email'];
    if (json['favList'] != null) {
      favList = <BarContent>[];
      json['favList'].forEach((v) {
        favList!.add(BarContent.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['fullName'] = fullName;
    data['email'] = email;
    if (favList != null) {
      data['favList'] = favList!.map((v) => v.toJson()).toList();
    }    
    data['createdAt'] = createdAt;
    return data;
  }
}
