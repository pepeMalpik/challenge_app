// To parse this JSON data, do
//
//     final quoteResponse = quoteResponseFromJson(jsonString);

import 'dart:convert';

QuoteResponse quoteResponseFromJson(String str) =>
    QuoteResponse.fromJson(json.decode(str));

String quoteResponseToJson(QuoteResponse data) => json.encode(data.toJson());

class QuoteResponse {
  QuoteResponse({
    required this.success,
    required this.contents,
    required this.baseurl,
    required this.copyright,
  });

  final Success success;
  final Contents contents;
  final String baseurl;
  final Copyright copyright;

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => QuoteResponse(
        success: Success.fromJson(json["success"]),
        contents: Contents.fromJson(json["contents"]),
        baseurl: json["baseurl"],
        copyright: Copyright.fromJson(json["copyright"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success.toJson(),
        "contents": contents.toJson(),
        "baseurl": baseurl,
        "copyright": copyright.toJson(),
      };
}

class Contents {
  Contents({
    required this.quotes,
  });

  final List<Quote> quotes;

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quotes": List<dynamic>.from(quotes.map((x) => x.toJson())),
      };
}

class Quote {
  Quote({
    required this.quote,
    required this.length,
    required this.author,
    required this.tags,
    required this.category,
    required this.language,
    required this.date,
    required this.permalink,
    required this.id,
    required this.background,
    required this.title,
  });

  final String quote;
  final String length;
  final String author;
  final List<String> tags;
  final String category;
  final String language;
  final DateTime date;
  final String permalink;
  final String id;
  final String background;
  final String title;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quote: json["quote"],
        length: json["length"],
        author: json["author"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        category: json["category"],
        language: json["language"],
        date: DateTime.parse(json["date"]),
        permalink: json["permalink"],
        id: json["id"],
        background: json["background"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "quote": quote,
        "length": length,
        "author": author,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "category": category,
        "language": language,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "permalink": permalink,
        "id": id,
        "background": background,
        "title": title,
      };
}

class Copyright {
  Copyright({
    required this.year,
    required this.url,
  });

  final int year;
  final String url;

  factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        year: json["year"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "url": url,
      };
}

class Success {
  Success({
    required this.total,
  });

  final int total;

  factory Success.fromJson(Map<String, dynamic> json) => Success(
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
      };
}
