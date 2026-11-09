import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/most_popular.dart';
import 'package:movies_app/models/movie.dart';

class MoviesProvider extends ChangeNotifier {

  String _baseUrl = "api.themoviedb.org";
  String _apiKey = "0dbfd80c37541cc5e4287449f4250640";
  String _language = "es-ES";
  String _page = "1";


  List<Movie> onDisplatMovie = [];
  List<Movie> mostPopularMovie = [];

  Map<int, List<Cast>> casting = {};

  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getMostPopularMovies();
  }

  getOnDisplayMovies() async {
    var url =
        Uri.https(_baseUrl, '3/movie/now_playing', {'api_key': _apiKey, "language": _language, "page": _page});
    var result = await http.get(url);
    
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(result.body);
    onDisplatMovie = nowPlayingResponse.results;

    notifyListeners();
  }

  getMostPopularMovies() async {
    var url =
        Uri.https(_baseUrl, '3/movie/popular', {'api_key': _apiKey, "language": _language, "page": _page});
    var result = await http.get(url);
    
    final mostPopularResponse = MostPopularResponse.fromRawJson(result.body);
    mostPopularMovie = mostPopularResponse.results;

    notifyListeners();
  }

  Future<List<Cast>> getCredits(int id) async {
    var url =
        Uri.https(_baseUrl, '3/movie/${id}/credits', {'api_key': _apiKey, "language": _language});
    var result = await http.get(url);
    
    final creditsResponse = CreditsResponse.fromRawJson(result.body);
   
    casting[id] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}
