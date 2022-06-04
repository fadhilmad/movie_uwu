import 'package:flutter/material.dart';
import 'package:movie_uwu/models/movie.dart';
import 'package:movie_uwu/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}
