import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class ApiService {
  Future<Movie> topHeadlines() async {
    final response =
    await http.get(Uri.parse('http://192.168.0.102/backend_movie/public/api/movie'));
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}