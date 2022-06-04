import 'package:flutter/material.dart';
import 'package:movie_uwu/api/api_server.dart';
import 'package:movie_uwu/components/genre_card.dart';
import 'package:movie_uwu/models/movie.dart';

import '../../../constants.dart';

// class Genres extends StatelessWidget {
//   const Genres({
//     required this.movie,
//   });

class Genre extends StatefulWidget {
  const Genre({Key? key, required this.movie}) : super(key: key);

  final Movie movie;
  @override
  State<Genre>createState() => _genreState();
}

class _genreState extends State<Genre> {

  late Future<Movie> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = ApiService().topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
          height: 36,
          child : FutureBuilder<Movie>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          )
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//       child: SizedBox(
//         height: 36,
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: movie.genre.length,
//           itemBuilder: (context, index) => GenreCard(
//             genre: movie.genre[index],
//           ),
//         ),
//       ),
//     );
//   }
// }

// const Genres({
// required this.movie,
// });
//
// final Movie movie;
//
// @override
// void initState() {
//   super.initState();
//   futureAlbum = fetchAlbum();
// }
//
// @override
// Widget build(BuildContext context) {
//   return Padding(
//     padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//     child: SizedBox(
//         height: 36,
//         child : FutureBuilder<Movie>(
//           future: futureAlbum,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text(snapshot.data!.title);
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//
//             // By default, show a loading spinner.
//             return const CircularProgressIndicator();
//           },
//         )
//     ),
//   );
// }
