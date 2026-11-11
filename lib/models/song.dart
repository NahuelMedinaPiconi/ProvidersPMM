import 'package:movies_app/models/models.dart';

class Song {
    final int artistId;
    final int collectionId;
    final int trackId;
    final String artistName;
    final String collectionName;
    final String trackName;
    final String collectionCensoredName;
    final String trackCensoredName;
    final String artistViewUrl;
    final String collectionViewUrl;
    final String trackViewUrl;
    final String previewUrl;
    final String artworkUrl30;
    final String artworkUrl60;
    final String artworkUrl100;
    final double collectionPrice;
    final double trackPrice;
    final DateTime releaseDate;
    final int discCount;
    final int discNumber;
    final int trackCount;
    final int trackNumber;
    final int trackTimeMillis;
    final String country;
    final String currency;
    final String primaryGenreName;
    final bool isStreamable;

    String get overview {
      final duracion = Duration(milliseconds: trackTimeMillis);
      final minutos = duracion.inMinutes;
      final segundos = (duracion.inSeconds % 60).toString().padLeft(2, '0');

      return "$trackName, del álbum $collectionName por la banda $artistName. "
          "Es una canción de género $primaryGenreName lanzada en ${releaseDate.year} (pista $trackNumber de $trackCount). "
          "Tiene una duración de $minutos:$segundos minutos y un precio de $trackPrice $currency.";
    }

    String get fullArtworkUrl {
      return artworkUrl100.replaceAll('100x100bb', '600x600bb');
    }

    Song({
        required this.artistId,
        required this.collectionId,
        required this.trackId,
        required this.artistName,
        required this.collectionName,
        required this.trackName,
        required this.collectionCensoredName,
        required this.trackCensoredName,
        required this.artistViewUrl,
        required this.collectionViewUrl,
        required this.trackViewUrl,
        required this.previewUrl,
        required this.artworkUrl30,
        required this.artworkUrl60,
        required this.artworkUrl100,
        required this.collectionPrice,
        required this.trackPrice,
        required this.releaseDate,
        required this.discCount,
        required this.discNumber,
        required this.trackCount,
        required this.trackNumber,
        required this.trackTimeMillis,
        required this.country,
        required this.currency,
        required this.primaryGenreName,
        required this.isStreamable,
    });

    factory Song.fromRawJson(String str) => Song.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Song.fromJson(Map<String, dynamic> json) => Song(
        artistId: json["artistId"],
        collectionId: json["collectionId"],
        trackId: json["trackId"],
        artistName: json["artistName"]!,
        collectionName: json["collectionName"],
        trackName: json["trackName"],
        collectionCensoredName: json["collectionCensoredName"],
        trackCensoredName: json["trackCensoredName"],
        artistViewUrl: json["artistViewUrl"],
        collectionViewUrl: json["collectionViewUrl"],
        trackViewUrl: json["trackViewUrl"],
        previewUrl: json["previewUrl"],
        artworkUrl30: json["artworkUrl30"],
        artworkUrl60: json["artworkUrl60"],
        artworkUrl100: json["artworkUrl100"],
        collectionPrice: json["collectionPrice"]?.toDouble(),
        trackPrice: json["trackPrice"]?.toDouble(),
        releaseDate: DateTime.parse(json["releaseDate"]),
        discCount: json["discCount"],
        discNumber: json["discNumber"],
        trackCount: json["trackCount"],
        trackNumber: json["trackNumber"],
        trackTimeMillis: json["trackTimeMillis"],
        country: json["country"]!,
        currency: json["currency"]!,
        primaryGenreName: json["primaryGenreName"]!,
        isStreamable: json["isStreamable"],
    );

    Map<String, dynamic> toJson() => {
        "artistId": artistId,
        "collectionId": collectionId,
        "trackId": trackId,
        "artistName": artistName,
        "collectionName": collectionName,
        "trackName": trackName,
        "collectionCensoredName": collectionCensoredName,
        "trackCensoredName": trackCensoredName,
        "artistViewUrl": artistViewUrl,
        "collectionViewUrl": collectionViewUrl,
        "trackViewUrl": trackViewUrl,
        "previewUrl": previewUrl,
        "artworkUrl30": artworkUrl30,
        "artworkUrl60": artworkUrl60,
        "artworkUrl100": artworkUrl100,
        "collectionPrice": collectionPrice,
        "trackPrice": trackPrice,
        "releaseDate": releaseDate.toIso8601String(),
        "discCount": discCount,
        "discNumber": discNumber,
        "trackCount": trackCount,
        "trackNumber": trackNumber,
        "trackTimeMillis": trackTimeMillis,
        "country": country,
        "currency": currency,
        "primaryGenreName": primaryGenreName,
        "isStreamable": isStreamable,
    };
}