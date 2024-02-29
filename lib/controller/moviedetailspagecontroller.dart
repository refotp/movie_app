import 'dart:convert';
import 'package:aldmictest/model/moviedetails.dart';
import 'package:aldmictest/secrets/apikey.dart';
import 'package:aldmictest/services/authenticationservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    try {
      openDialig();
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
    } catch (e) {
      Get.back();
      throw 'Something went wrong';
    } finally {
      Get.back();
      Get.snackbar("Sukses", "Film berhasil ditambahkan!",
          backgroundColor: const Color.fromARGB(255, 1, 114, 26),
          colorText: Colors.white);
    }
  }

  void openDialig() {
    Get.dialog(
        Dialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: const SizedBox(
            width: 100,
            height: 150,
            child: SpinKitCubeGrid(
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
