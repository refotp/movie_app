import 'package:aldmictest/model/favoritemovie.dart';
import 'package:aldmictest/services/authenticationservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FavoritePageController extends GetxController {
  static FavoritePageController get instance => Get.find();
  RxBool isLoading = true.obs;
  late List<FavoriteMovie> favoriteFilms = [];
  List get favFilms => films;
  RxList<FavoriteMovie> films = <FavoriteMovie>[].obs;

  @override
  void onInit() {
    getFavoriteMovies();

    super.onInit();
  }

  Future<void> getFavoriteMovies() async {
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(AuthenticationService.instance.authUser?.uid)
          .collection('favorite_movies')
          .snapshots()
          .listen((querySnapshot) {
        List<FavoriteMovie> favoriteMovies = querySnapshot.docs.map((doc) {
          return FavoriteMovie(
            id: doc['id'],
            poster: doc['poster'],
            title: doc['title'],
            type: doc['type'],
            year: doc['year'],
          );
        }).toList();
        films.value = favoriteMovies;

        isLoading.value = false;
      });
    } catch (e) {
      throw '$e';
    } finally {
      isLoading.value = false;
    }
  }
}
