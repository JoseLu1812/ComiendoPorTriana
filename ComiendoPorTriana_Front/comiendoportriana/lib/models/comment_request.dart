class CommentRequest {
  String? title;
  String? body;

  CommentRequest(this.title, this.body);

  CommentRequest.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
