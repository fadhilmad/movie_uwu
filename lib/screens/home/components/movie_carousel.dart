import 'package:flutter/material.dart';
import 'package:movie_uwu/api/api_server.dart';
import 'dart:math' as math;
import '../../../constants.dart';
import '../../../models/movie.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;
  late Future<Movie> futureAlbum;

  late List<Movie> movie;

  @override
  void initState() {
    super.initState();
    futureAlbum = ApiService().topHeadlines();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          // itemCount: movie.length,
          // we have 3 demo movies
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }


Widget buildMovieSlider(int index) => AnimatedBuilder(
  animation: _pageController,
  builder: (context, child) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 350),
      opacity: initialPage == index ? 1 : 0.4,
      child: Transform.rotate(
        angle: math.pi * 0,
        child: FutureBuilder<Movie>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            }
        ),
      ),
    );
  },
);
}
