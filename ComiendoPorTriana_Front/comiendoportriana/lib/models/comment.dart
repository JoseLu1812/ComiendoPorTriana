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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['barName'] = barName;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
