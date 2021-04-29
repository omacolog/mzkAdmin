// To parse this JSON data, do
//
//     final videosData = videosDataFromJson(jsonString);

import 'dart:convert';

VideosData videosDataFromJson(String str) => VideosData.fromJson(json.decode(str));

String videosDataToJson(VideosData data) => json.encode(data.toJson());

class VideosData {
  VideosData({
    this.id,
    this.videoId,
    this.videoTitle,
    this.videoText,
    this.videoImageLink,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String videoId;
  String videoTitle;
  String videoText;
  String videoImageLink;
  DateTime createdAt;
  DateTime updatedAt;

  factory VideosData.fromJson(Map<String, dynamic> json) => VideosData(
    id: json["ID"] == null ? null : json["ID"],
    videoId: json["videoId"] == null ? null : json["videoId"],
    videoTitle: json["videoTitle"] == null ? null : json["videoTitle"],
    videoText: json["videoText"] == null ? null : json["videoText"],
    videoImageLink: json["videoImageLink"] == null ? null : json["videoImageLink"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "videoId": videoId == null ? null : videoId,
    "videoTitle": videoTitle == null ? null : videoTitle,
    "videoText": videoText == null ? null : videoText,
    "videoImageLink": videoImageLink == null ? null : videoImageLink,
    "CreatedAt": createdAt == null ? null : "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    "UpdatedAt": updatedAt == null ? null : "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
  };
}