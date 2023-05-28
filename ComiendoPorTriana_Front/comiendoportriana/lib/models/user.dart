import 'package:comiendoportriana/models/bar_list.dart';
import 'package:comiendoportriana/models/login.dart';

class User {
  String? id;
  String? username;
  String? fullName;
  String? email;
  List<BarContent>? favList;
  //List<Null>? comments;
  String? createdAt;

  User(
      {this.id,
      this.username,
      this.fullName,
      this.email,
      this.favList,
      //this.comments,
      this.createdAt});

  User.fromLoginResponse(LoginResponse response) {
    this.id = response.id;
    this.username = response.username;
    this.fullName = response.fullName;
    this.email = response.email;
    this.favList = response.favList;
    //this.comments = response;
    this.createdAt = response.createdAt;
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
        favList!.add(new BarContent.fromJson(v));
      });
    }
    //if (json['comments'] != null) {
    //  comments = <Null>[];
    //  ['comments'].forEach((v) {
    //  });
    //}
    createdAt = json['createdAt'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    if (this.favList != null) {
      data['favList'] = this.favList!.map((v) => v.toJson()).toList();
    }    
    //if (this.comments != null) {
    //  data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    //}
    data['createdAt'] = this.createdAt;
    return data;
  }
}
