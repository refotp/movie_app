class MovieDetails {
  final String id;
  final String title;
  final String year;
  final String rate;
  final String release;
  final String genre;
  final String plot;
  final String poster;
  final String type;

  MovieDetails(
      {required this.id,
      required this.title,
      required this.year,
      required this.rate,
      required this.release,
      required this.genre,
      required this.plot,
      required this.poster,
      required this.type});

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
      id: json["imdbID"] == 'N/A' ? '' : json["imdbID"],
      title: json["Title"] == 'N/A' ? '' : json["Title"],
      year: json["Year"] == 'N/A' ? '' : json["Year"],
      rate: json["Rated"] == 'N/A' ? '' : json["Rated"],
      release: json["Released"] == 'N/A' ? '' : json["Released"],
      genre: json["Genre"] == 'N/A' ? '' : json["Genre"],
      plot: json["Plot"] == 'N/A' ? '' : json["Plot"],
      type: json["Type"] == 'N/A' ? '' : json["Type"],
      poster: json["Poster"] == 'N/A'
          ? 'https://betravingknows.com/wp-content/uploads/2017/06/video-movie-placeholder-image-grey.png'
          : json["Poster"]);
}
