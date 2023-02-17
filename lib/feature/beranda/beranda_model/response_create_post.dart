class ResponseCreatePost {
  String? id;
  String? image;
  int? likes;
  String? link;
  List<String>? tags;
  String? text;
  String? publishDate;
  String? updatedDate;
  Owner? owner;

  ResponseCreatePost(
      {this.id,
      this.image,
      this.likes,
      this.link,
      this.tags,
      this.text,
      this.publishDate,
      this.updatedDate,
      this.owner});

  ResponseCreatePost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    link = json['link'];
    tags = json['tags'].cast<String>();
    text = json['text'];
    publishDate = json['publishDate'];
    updatedDate = json['updatedDate'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['likes'] = likes;
    data['link'] = link;
    data['tags'] = tags;
    data['text'] = text;
    data['publishDate'] = publishDate;
    data['updatedDate'] = updatedDate;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
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
