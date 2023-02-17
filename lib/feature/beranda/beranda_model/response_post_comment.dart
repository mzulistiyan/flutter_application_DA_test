class ResponsePostComment {
  String? id;
  String? message;
  Owner? owner;
  String? post;
  String? publishDate;

  ResponsePostComment(
      {this.id, this.message, this.owner, this.post, this.publishDate});

  ResponsePostComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    post = json['post'];
    publishDate = json['publishDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['post'] = post;
    data['publishDate'] = publishDate;
    return data;
  }
}

class Owner {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  Owner({this.id, this.title, this.firstName, this.lastName, this.picture});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    return data;
  }
}
