import 'dart:convert';
import 'package:aldmictest/model/moviedetails.dart';
import 'package:aldmictest/model/movies.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();
  static Future<List<dynamic>> fetchMovieList(
      String apiKey, String searchTerm) async {
    final response = await client
        .get(Uri.parse('http://www.omdbapi.com/?s=$searchTerm&apikey=$apiKey'));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      var list = (responseData['Search'] as List)
          .map((item) => MovieList.fromJson(item))
          .toList();
      return list;
    } else {
      throw Exception('Failed to load movie list');
    }
  }

  static Future<MovieDetails> fetchMovieDetails(
      String apiKey, String id) async {
    final response = await client
        .get(Uri.parse('http://www.omdbapi.com/?i=$id&apikey=$apiKey'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return MovieDetails.fromJson(json);
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}
