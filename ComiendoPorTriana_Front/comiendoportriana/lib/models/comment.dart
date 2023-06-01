class Comment {
  String? username;
  String? barName;
  String? title;
  String? body;

  Comment({this.username, this.barName, this.title, this.body});

  Comment.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    barName = json['barName'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['barName'] = this.barName;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
