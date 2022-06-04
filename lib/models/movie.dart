// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

List<Movie> movieFromJson(String str) => List<Movie>.from(json.decode(str).map((x) => Movie.fromJson(x)));

String movieToJson(List<Movie> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movie {
  Movie({
    required this.id,
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.year,
    required this.numRating,
    required this.review,
    required this.scoreRating,
    required this.rating,
    required this.plot,
    required this.cast,
    required this.genre,
  });

  int id;
  String poster;
  String backdrop;
  String title;
  int year;
  int numRating;
  int review;
  int scoreRating;
  int rating;
  String plot;
  List<Cast> cast;
  Map<String, String> genre;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    poster: json["poster"],
    backdrop: json["backdrop"],
    title: json["title"],
    year: json["year"],
    numRating: json["num_rating"],
    review: json["review"],
    scoreRating: json["score_rating"],
    rating: json["rating"],
    plot: json["plot"],
    cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
    genre: Map.from(json["genre"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "poster": poster,
    "backdrop": backdrop,
    "title": title,
    "year": year,
    "num_rating": numRating,
    "review": review,
    "score_rating": scoreRating,
    "rating": rating,
    "plot": plot,
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    "genre": Map.from(genre).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Cast {
  Cast({
    required this.originalName,
    required this.movieName,
    required this.images,
  });

  String originalName;
  String movieName;
  String images;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
    originalName: json["original_name"],
    movieName: json["movie_name"],
    images: json["images"],
  );

  Map<String, dynamic> toJson() => {
    "original_name": originalName,
    "movie_name": movieName,
    "images": images,
  };
}
