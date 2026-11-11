import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class SongsProvider extends ChangeNotifier {

  String _baseUrl = "itunes.apple.com";
  String _endPoint = "search";

  List<Song> searchedArtist = [];
  List<Song> otherSongs = [];

  SongsProvider(String artist) {
    this.getSearchedArtist(artist);
    this.getOtherSongs();
  }

  getSearchedArtist(String artist) async {
    try {
      final url = Uri.https(_baseUrl, _endPoint, {
        'term': artist,
        'media': 'music',
        'entity': 'song',
        'attribute': 'artistTerm',
        'limit': '10',
      });
      final result = await http.get(url);
      debugPrint('Status: ${result.statusCode}');

      final response = ArtistResponse.fromRawJson(result.body);
      searchedArtist = response.results;
      notifyListeners();
    } catch (e, st) {
      debugPrint('Error en getSearchedArtist: $e\n$st');
    }
  }

  getOtherSongs() async {
    var url =
        Uri.https(_baseUrl, _endPoint, {'term': "greatest hits rock", "media" : "music", "entity": "song"});
    var result = await http.get(url);
    
    final otherSongsResponse = ArtistResponse.fromRawJson(result.body);
    otherSongs = otherSongsResponse.results;

    notifyListeners();
  }
}
