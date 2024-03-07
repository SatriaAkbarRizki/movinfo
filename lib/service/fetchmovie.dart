import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:movinfo/model/movie.dart';

class FetchApiMovie {
  static Future<List<MovieModel>?> fetchApiMovie(String categoryMovie) async {
    const String api_key = "api_key=YOUR API KEY";

    String baseUrl =
        "https://api.themoviedb.org/3/movie/$categoryMovie?$api_key&region=it";

    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List dataJson = jsonDecode(response.body)['results'];
        List<MovieModel> data =
            dataJson.map((e) => MovieModel.fromJson(e)).toList();
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log('[MESSAGE ERROR]: ${e.toString()}');
    }
    return null;
  }
}
