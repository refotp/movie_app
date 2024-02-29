import 'dart:convert';
import 'package:aldmictest/model/moviedetails.dart';
import 'package:aldmictest/secrets/apikey.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MovieDetailsPageController extends GetxController {
  final String apiKey = ApiKey().apiKey;
  RxBool isLoading = true.obs;
  Rx<MovieDetails> movieDetails = MovieDetails(
    title: '',
    year: '',
    rate: '',
    release: '',
    genre: '',
    plot: '',
    poster: '',
  ).obs;

  void fetchMovieDetails(String id) async {
    try {
      final response = await http
          .get(Uri.parse('http://www.omdbapi.com/?i=$id&apikey=$apiKey'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        movieDetails.value = MovieDetails.fromJson(json);
      } else {
        throw Exception('Failed to load movie details');
      }
    } catch (e) {
      throw '$e';
    } finally {
      isLoading.value = false;
    }
  }
}
