import 'package:aldmictest/model/movies.dart';
import 'package:aldmictest/secrets/apikey.dart';
import 'package:aldmictest/services/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

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
      Get.snackbar('', '',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Ionicons.warning,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          titleText: const Text(
            'Error',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          messageText: const Text(
            'Film tidak dapat ditemukan',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ));
    } finally {}
  }
}
