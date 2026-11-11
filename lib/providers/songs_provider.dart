import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class SongsProvider extends ChangeNotifier {

  String _baseUrl = "itunes.apple.com";
  String _endPoint = "search";

  List<Song> searchedArtist = [];
  List<Song> otherSongs = [];

  MoviesProvider(String artist) {
    this.getSearchedArtist(artist);
    this.getOtherSongs();
  }

  getSearchedArtist(String artist) async {
    var url =
        Uri.https(_baseUrl, "search", {'term': artist, "media" : "music", "entity": "song", "attribute": "artistTerm"});
    var result = await http.get(url);
    
    final searchedArtistResponse = ArtistResponse.fromRawJson(result.body);
    searchedArtist = searchedArtistResponse.results;

    notifyListeners();
  }

  getOtherSongs() async {
    var url =
        Uri.https(_baseUrl, _endPoint, {'term': "greatest+hits+rock", "media" : "music", "entity": "song"});
    var result = await http.get(url);
    
    final otherSongsResponse = ArtistResponse.fromRawJson(result.body);
    otherSongs = otherSongsResponse.results;

    notifyListeners();
  }
}
