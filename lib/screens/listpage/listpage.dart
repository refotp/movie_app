import 'package:aldmictest/controller/homepagecontroller.dart';
import 'package:aldmictest/screens/detailpage/moviedetails.dart';
import 'package:aldmictest/services/authenticationservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => AuthenticationService.instance.logout(),
              icon: const Icon(
                Ionicons.log_out,
                color: Colors.white,
              ))
        ],
        backgroundColor: const Color.fromARGB(255, 0, 46, 84),
        title: const Text(
          'List Movie',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: const Color.fromRGBO(0, 24, 35, 1),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                TextField(
                  style: const TextStyle(color: Color.fromARGB(255, 2, 28, 69)),
                  cursorColor: Colors.blue,
                  decoration: const InputDecoration(
                      filled: true,
                      focusColor: Colors.orange,
                      icon: Icon(Ionicons.search),
                      iconColor: Colors.white),
                  onSubmitted: (value) => controller.searchMovies(value),
                  controller: controller.searchMovie,
                ),
                Expanded(
                  child: Obx(() {
                    if (!controller.isSearch.value) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                                'assets/Animation - 1709110839965.json',
                                width: 150,
                                height: 150),
                            const Text(
                              'Cari film kesukaanmu',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            )
                          ]);
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: ListView.separated(
                          itemCount: controller.moviesList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () => Get.to(() => MovieDetailsPage(
                                      movieId: controller.moviesList[index].id,
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
                                            controller.moviesList[index].poster,
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
                                              controller
                                                  .moviesList[index].title,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'ProtestStrike'),
                                            ),
                                            Text(
                                              controller.moviesList[index].type,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              controller.moviesList[index].year,
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
                      );
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
