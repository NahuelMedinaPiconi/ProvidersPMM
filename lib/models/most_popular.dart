import 'dart:convert';

import 'package:movies_app/models/movie.dart';

class MostPopularResponse {
    final int page;
    final List<Movie> results;
    final int totalPages;
    final int totalResults;

    MostPopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory MostPopularResponse.fromRawJson(String str) => MostPopularResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MostPopularResponse.fromJson(Map<String, dynamic> json) => MostPopularResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

