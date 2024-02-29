class MovieList {
  final String title;
  final String year;
  final String type;
  final String poster;
  final String id;

  MovieList(
      {required this.title,
      required this.year,
      required this.type,
      required this.poster,
      required this.id});

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
        title: json["Title"] == 'N/A' ? '' : json["Title"],
        year: json["Year"] == 'N/A' ? '' : json["Year"],
        id: json["imdbID"] == 'N/A' ? '' : json["imdbID"],
        type: json["Type"] == 'N/A' ? '' : json["Type"],
        poster: json["Poster"] == 'N/A'
            ? 'https://betravingknows.com/wp-content/uploads/2017/06/video-movie-placeholder-image-grey.png'
            : json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": id,
        "Type": type,
        "Poster": poster,
      };
}
