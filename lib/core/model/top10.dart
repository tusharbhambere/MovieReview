// To parse this JSON data, do
//
//     final stricker = strickerFromJson(jsonString);

import 'dart:convert';

Movie strickerFromJson(String str) => Movie.fromJson(json.decode(str));

String strickerToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    required this.result,
    this.queryParam,
    this.code,
    required this.message,
  });

  List<Result> result;
  QueryParam? queryParam;
  int? code;
  String message;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        queryParam: QueryParam.fromJson(json["queryParam"]),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
        "queryParam": queryParam!.toJson(),
        "code": code,
        "message": message,
      };
}

class QueryParam {
  QueryParam({
    this.category,
    this.language,
    this.genre,
    this.sort,
  });

  String? category;
  String? language;
  String? genre;
  String? sort;

  factory QueryParam.fromJson(Map<String, dynamic> json) => QueryParam(
        category: json["category"],
        language: json["language"],
        genre: json["genre"],
        sort: json["sort"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "language": language,
        "genre": genre,
        "sort": sort,
      };
}

class Result {
  Result({
    this.id,
    this.director,
    this.writers,
    this.stars,
    this.releasedDate,
    this.productionCompany,
    this.title,
    this.language,
    this.runTime,
    this.genre,
    this.voted,
    this.poster,
    this.pageViews,
    this.description,
    this.upVoted,
    this.downVoted,
    this.totalVoted,
    required this.voting,
  });

  String? id;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  Language? language;
  int? runTime;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? pageViews;
  String? description;
  List<String>? upVoted;
  List<String>? downVoted;
  int? totalVoted;
  int voting;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        director: List<String>.from(json["director"].map((x) => x)),
        writers: List<String>.from(json["writers"].map((x) => x)),
        stars: List<String>.from(json["stars"].map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany:
            List<String>.from(json["productionCompany"].map((x) => x)),
        title: json["title"],
        language: languageValues.map![json["language"]],
        runTime: json["runTime"] == null ? null : json["runTime"],
        genre: json["genre"],
        voted: List<Voted>.from(json["voted"].map((x) => Voted.fromJson(x))),
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        upVoted: json["upVoted"] == null
            ? null
            : List<String>.from(json["upVoted"].map((x) => x)),
        downVoted: json["downVoted"] == null
            ? null
            : List<String>.from(json["downVoted"].map((x) => x)),
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "director": List<dynamic>.from(director!.map((x) => x)),
        "writers": List<dynamic>.from(writers!.map((x) => x)),
        "stars": List<dynamic>.from(stars!.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany":
            List<dynamic>.from(productionCompany!.map((x) => x)),
        "title": title,
        "language": languageValues.reverse[language],
        "runTime": runTime == null ? null : runTime,
        "genre": genre,
        "voted": List<dynamic>.from(voted!.map((x) => x.toJson())),
        "poster": poster,
        "pageViews": pageViews,
        "description": description,
        "upVoted":
            upVoted == null ? null : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null
            ? null
            : List<dynamic>.from(downVoted!.map((x) => x)),
        "totalVoted": totalVoted,
        "voting": voting,
      };
}

enum Language { KANNADA }

final languageValues = EnumValues({"Kannada": Language.KANNADA});

class Voted {
  Voted({
    this.upVoted,
    this.downVoted,
    this.id,
    this.updatedAt,
    this.genre,
  });

  List<String>? upVoted;
  List<dynamic>? downVoted;
  String? id;
  int? updatedAt;
  String? genre;

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        upVoted: List<String>.from(json["upVoted"].map((x) => x)),
        downVoted: List<dynamic>.from(json["downVoted"].map((x) => x)),
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "upVoted": List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": List<dynamic>.from(downVoted!.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
