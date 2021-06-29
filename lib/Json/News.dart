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

  factory News.fromJson(Map<String, dynamic> json) {
    return json != null
        ? News(
            id: json["ID"] == null ? null : json["ID"],
            newsTitle: json["newsTitle"] == null ? null : json["newsTitle"],
            newsText: json["newsText"] == null ? null : json["newsText"],
            newsImageLink:
                json["newsImageLink"] == null ? null : json["newsImageLink"],
            createdAt: json["CreatedAt"] == null
                ? null
                : DateTime.parse(json["CreatedAt"]),
            updatedAt: json["UpdatedAt"] == null
                ? null
                : DateTime.parse(json["UpdatedAt"]),
            comment: json["comment"] == null
                ? null
                : List<Comment>.from(
                    json["comment"].map((x) => Comment.fromJson(x))),
          )
        : null;
  }

  Map<String, dynamic> toJson() => {
        "ID": this.id == null ? null : this.id,
        "newsTitle": this.newsTitle == null ? null : this.newsTitle,
        "newsText": this.newsText == null ? null : this.newsText,
        "newsImageLink": this.newsImageLink == null ? null : this.newsImageLink,
        "CreatedAt": this.createdAt == null
            ? null
            : "${this.createdAt.year.toString().padLeft(4, '0')}-${this.createdAt.month.toString().padLeft(2, '0')}-${this.createdAt.day.toString().padLeft(2, '0')}",
        "UpdatedAt": this.updatedAt == null
            ? null
            : "${this.updatedAt.year.toString().padLeft(4, '0')}-${this.updatedAt.month.toString().padLeft(2, '0')}-${this.updatedAt.day.toString().padLeft(2, '0')}",
        "comment": this.comment == null
            ? null
            : List<dynamic>.from(this.comment.map((x) => x.toJson())),
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

  factory Comment.fromJson(Map<String, dynamic> json) {
    return json != null
        ? Comment(
            id: json["ID"] == null ? null : json["ID"],
            newsId: json["NewsID"] == null ? null : json["NewsID"],
            userId: json["UserID"] == null ? null : json["UserID"],
            userName: json["UserName"] == null ? null : json["UserName"],
            commentText:
                json["CommentText"] == null ? null : json["CommentText"],
            commentStatus:
                json["CommentStatus"] == null ? null : json["CommentStatus"],
          )
        : null;
  }

  Map<String, dynamic> toJson() => {
        "ID": this.id == null ? null : this.id,
        "NewsID": this.newsId == null ? null : this.newsId,
        "UserID": this.userId == null ? null : this.userId,
        "UserName": this.userName == null ? null : this.userName,
        "CommentText": this.commentText == null ? null : this.commentText,
        "CommentStatus": this.commentStatus == null ? null : this.commentStatus,
      };
}
