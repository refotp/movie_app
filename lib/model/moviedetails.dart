class MovieDetails {
  final String title;
  final String year;
  final String rate;
  final String release;
  final String genre;
  final String plot;
  final String poster;

  MovieDetails(
      {required this.title,
      required this.year,
      required this.rate,
      required this.release,
      required this.genre,
      required this.plot,
      required this.poster});

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
      title: json["Title"] == 'N/A' ? '' : json["Title"],
      year: json["Year"] == 'N/A' ? '' : json["Year"],
      rate: json["Rated"] == 'N/A' ? '' : json["Rated"],
      release: json["Released"] == 'N/A' ? '' : json["Released"],
      genre: json["Genre"] == 'N/A' ? '' : json["Genre"],
      plot: json["Plot"] == 'N/A' ? '' : json["Plot"],
      poster: json["Poster"] == 'N/A'
          ? 'https://betravingknows.com/wp-content/uploads/2017/06/video-movie-placeholder-image-grey.png'
          : json["Poster"]);
}
