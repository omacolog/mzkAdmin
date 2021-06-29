// To parse this JSON data, do
//
//     final survey = surveyFromJson(jsonString);

import 'dart:convert';

Survey surveyFromJson(String str) => Survey.fromJson(json.decode(str));

String surveyToJson(Survey data) => json.encode(data.toJson());

class Survey {
  Survey({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.surveyName,
    this.surveyQuestion,
    this.surveyImage,
    this.surveyStartDate,
    this.surveyEndDate,
    this.sSurveyAvailable,
    this.surveySelection,
    this.surveyWinner,
    this.surveyOption,
    //SurveyOption surveyOption= new SurveyOption(id:soId ,createdAt:soCreateAt,updatedAt:soUpdateAt,surveyId:1 ,surveyOption:soSurveyOptiom),
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String surveyName;
  String surveyQuestion;
  String surveyImage;
  DateTime surveyStartDate;
  DateTime surveyEndDate;
  bool sSurveyAvailable;
  dynamic surveySelection;
  dynamic surveyWinner;
  List<SurveyOption> surveyOption;

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
    id: json["ID"] == null ? null : json["ID"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
    surveyName: json["surveyName"] == null ? null : json["surveyName"],
    surveyQuestion: json["surveyQuestion"] == null ? null : json["surveyQuestion"],
    surveyImage: json["surveyImage"] == null ? null : json["surveyImage"],
    surveyStartDate: json["surveyStartDate"] == null ? null : DateTime.parse(json["surveyStartDate"]),
    surveyEndDate: json["surveyEndDate"] == null ? null : DateTime.parse(json["surveyEndDate"]),
    sSurveyAvailable: json["ısSurveyAvailable"] == null ? null : json["ısSurveyAvailable"],
    surveySelection: json["SurveySelection"],
    surveyWinner: json["SurveyWinner"],
    surveyOption: json["surveyOption"] == null ? null : List<SurveyOption>.from(json["surveyOption"].map((x) => SurveyOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "CreatedAt": createdAt == null ? null : createdAt.toIso8601String(),
    "UpdatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "surveyName": surveyName == null ? null : surveyName,
    "surveyQuestion": surveyQuestion == null ? null : surveyQuestion,
    "surveyImage": surveyImage == null ? null : surveyImage,
    "surveyStartDate": surveyStartDate == null ? null : surveyStartDate.toIso8601String(),
    "surveyEndDate": surveyEndDate == null ? null : surveyEndDate.toIso8601String(),
    "ısSurveyAvailable": sSurveyAvailable == null ? null : sSurveyAvailable,
    "SurveySelection": surveySelection,
    "SurveyWinner": surveyWinner,
    "surveyOption": surveyOption == null ? null : List<dynamic>.from(surveyOption.map((x) => x.toJson())),
  };
}

class SurveyOption {
  SurveyOption({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.surveyId,
    this.surveyOption,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  int surveyId;
  String surveyOption;

  factory SurveyOption.fromJson(Map<String, dynamic> json) => SurveyOption(
    id: json["ID"] == null ? null : json["ID"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
    surveyId: json["SurveyID"] == null ? null : json["SurveyID"],
    surveyOption: json["surveyOption"] == null ? null : json["surveyOption"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id == null ? null : id,
    "CreatedAt": createdAt == null ? null : createdAt.toIso8601String(),
    "UpdatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "SurveyID": surveyId == null ? null : surveyId,
    "surveyOption": surveyOption == null ? null : surveyOption,
  };
}
