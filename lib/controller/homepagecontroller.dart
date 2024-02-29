import 'package:aldmictest/model/movies.dart';
import 'package:aldmictest/secrets/apikey.dart';
import 'package:aldmictest/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  TextEditingController searchMovie = TextEditingController();
  final RxList moviesList = <MovieList>[].obs;
  RxBool isSearch = false.obs;

  Future<void> searchMovies(String search) async {
    isSearch.value = true;
    searchMovie.text = search;
    try {
      final fetchedMovies =
          await ApiService.fetchMovieList(ApiKey().apiKey, search);
      moviesList.assignAll(fetchedMovies);
    } catch (e) {
      throw 'Something went wrong';
    } finally {}
  }
}
