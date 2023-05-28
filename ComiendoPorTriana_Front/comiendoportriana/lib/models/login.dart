import 'package:comiendoportriana/models/bar_list.dart';

class LoginResponse {
  String? id;
  String? username;
  String? fullName;
  String? email;
  List<BarContent>? favList;
  //List<Null>? comments;
  String? createdAt;
  String? token;
  String? refreshToken;

  LoginResponse(
      {this.id,
      this.username,
      this.fullName,
      this.email,
      this.favList,
      //this.comments,
      this.createdAt,
      this.token,
      this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
    email = json['email'];
    if (json['favList'] != null) {
      favList = <BarContent>[];
      json['favList'].forEach((v) {
        favList!.add(new BarContent.fromJson(v));
      });
    }
    //if (json['comments'] != null) {
    //  comments = <Null>[];
    //  json['comments'].forEach((v) {});
    //}
    createdAt = json['createdAt'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['fullName'] = fullName;
    data['email'] = email;
    if (this.favList != null) {
      data['favList'] = this.favList!.map((v) => v.toJson()).toList();
    }
    //if (this.comments != null) {
    //  data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    //}
    data['createdAt'] = this.createdAt;
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
