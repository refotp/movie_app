import 'dart:convert';
import 'package:aldmictest/model/moviedetails.dart';
import 'package:aldmictest/secrets/apikey.dart';
import 'package:aldmictest/services/authenticationservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class MovieDetailsPageController extends GetxController {
  final String apiKey = ApiKey().apiKey;
  RxBool isLoading = true.obs;
  Rx<MovieDetails> movieDetails = MovieDetails(
    id: '',
    title: '',
    year: '',
    rate: '',
    release: '',
    genre: '',
    plot: '',
    type: '',
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

  Future<void> saveFavoriteMovie(MovieDetails movieDetails) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(AuthenticationService.instance.authUser?.uid)
        .collection('favorite_movies')
        .where('id', isEqualTo: movieDetails.id)
        .get();

    if (querySnapshot.docs.isEmpty) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(AuthenticationService.instance.authUser?.uid)
          .collection('favorite_movies')
          .doc(movieDetails.id)
          .set({
        'id': movieDetails.id,
        'poster': movieDetails.poster,
        'title': movieDetails.title,
        'type': movieDetails.type,
        'year': movieDetails.year,
      });
    }
  }
}
