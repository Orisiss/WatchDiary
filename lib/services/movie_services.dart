import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchdiary/api_config.dart';

class MovieService {
  final String apiKey = ApiConfig.apiKey;
  final String baseUrl = ApiConfig.baseUrl;

  Future<List<dynamic>> getTrendingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/trending/movie/week?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Impossible de charger les films tendances');
    }
  }
}
