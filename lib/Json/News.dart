// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.id,
    this.newsTitle,
    this.newsText,
    this.newsImageLink,
    this.createdAt,
    this.updatedAt,
    this.comment,
  });

  int id;
  String newsTitle;
  String newsText;
  String newsImageLink;
  DateTime createdAt;
  DateTime updatedAt;
  List<Comment> comment;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["ID"] == null ? null : json["ID"],
    newsTitle: json["newsTitle"] == null ? null : json["newsTitle"],
    newsText: json["newsText"] == null ? null : json["newsText"],
    newsImageLink: json["newsImageLink"] == null ? null : json["newsImageLink"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
    comment: json["comment"] == null ? null : List<Comment>.from(json["comment"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "newsTitle": newsTitle == null ? null : newsTitle,
    "newsText": newsText == null ? null : newsText,
    "newsImageLink": newsImageLink == null ? null : newsImageLink,
    "CreatedAt": createdAt == null ? null : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "UpdatedAt": updatedAt == null ? null : "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
    "comment": comment == null ? null : List<dynamic>.from(comment.map((x) => x.toJson())),
  };
}

class Comment {
  Comment({
    this.id,
    this.newsId,
    this.userId,
    this.userName,
    this.commentText,
    this.commentStatus,
  });

  int id;
  int newsId;
  int userId;
  String userName;
  String commentText;
  int commentStatus;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["ID"] == null ? null : json["ID"],
    newsId: json["NewsID"] == null ? null : json["NewsID"],
    userId: json["UserID"] == null ? null : json["UserID"],
    userName: json["UserName"] == null ? null : json["UserName"],
    commentText: json["CommentText"] == null ? null : json["CommentText"],
    commentStatus: json["CommentStatus"] == null ? null : json["CommentStatus"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "NewsID": newsId == null ? null : newsId,
    "UserID": userId == null ? null : userId,
    "UserName": userName == null ? null : userName,
    "CommentText": commentText == null ? null : commentText,
    "CommentStatus": commentStatus == null ? null : commentStatus,
  };
}