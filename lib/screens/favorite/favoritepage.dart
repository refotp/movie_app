import 'package:aldmictest/controller/favoritepagecontroller.dart';
import 'package:aldmictest/screens/detailpage/moviedetails.dart';
import 'package:aldmictest/services/authenticationservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritePageController();
    controller.onInit();

    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 24, 35, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 46, 84),
          title: const Text(
            'Favorite film',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
              onPressed: () {
                AuthenticationService.instance.logout();
              },
              icon: const Icon(
                Ionicons.log_out,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(AuthenticationService.instance.authUser?.uid)
              .collection('favorite_movies')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/Animation - 1709110839965.json',
                          width: 150, height: 150),
                      const Text(
                        'Kamu belum memiliki film favorit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      )
                    ]),
              );
            } else {
              return Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: ListView.separated(
                          itemCount: controller.films.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () => Get.to(() => MovieDetailsPage(
                                      movieId:
                                          controller.favoriteFilms[index].id,
                                    )),
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Positioned(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200,
                                          color: Colors.black,
                                          child: Image.network(
                                            controller.films[index].poster,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      color: const Color.fromRGBO(
                                          1, 19, 38, 0.788),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.films[index].title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'ProtestStrike'),
                                            ),
                                            Text(
                                              controller.films[index].type,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              controller.films[index].year,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                        ),
                      ),
              );
            }
          },
        ));
  }
}
