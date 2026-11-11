import "package:movies_app/models/models.dart";

class ArtistResponse {
    final int resultCount;
    final List<Song> results;

    ArtistResponse({
        required this.resultCount,
        required this.results,
    });

    factory ArtistResponse.fromRawJson(String str) => ArtistResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ArtistResponse.fromJson(Map<String, dynamic> json) => ArtistResponse(
        resultCount: json["resultCount"],
        results: List<Song>.from(json["results"].map((x) => Song.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}
