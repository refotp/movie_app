import 'package:aldmictest/controller/moviedetailspagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailsPage extends StatelessWidget {
  final String movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final controller = MovieDetailsPageController();

    controller.fetchMovieDetails(movieId);
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: const Color.fromARGB(255, 0, 23, 41),
                    iconTheme: const IconThemeData(color: Colors.white),
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        controller.movieDetails.value.poster,
                        fit: BoxFit.cover,
                      ),
                      titlePadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      centerTitle: true,
                    ),
                    titleSpacing: 0,
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.movieDetails.value.title,
                            style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'ProtestStrike',
                                overflow: TextOverflow.visible),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                controller.movieDetails.value.year,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(controller.movieDetails.value.rate,
                                  style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Sinopsis',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            controller.movieDetails.value.plot,
                            style:
                                const TextStyle(overflow: TextOverflow.visible),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.saveFavoriteMovie(
                                  controller.movieDetails.value);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color.fromARGB(255, 0, 40, 71)),
                              child: const Center(
                                child: Text(
                                  'Tambah ke favorit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
