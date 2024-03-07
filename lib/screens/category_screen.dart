import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/widget/listmovie.dart';

class CategoryScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  static String routeName = '/category_screen';

  const CategoryScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(data['title']),
        leading: IconButton(
            onPressed: () => context.go('/'), icon: Icon(Icons.arrow_back)),
      ),
      body: ListView(children: [
        ListMovieWidget(
            showExpanded: true,
            routePage: routeName,
          
            movies: dataNotNull(
              data['movies'],
            ))
      ]),
    );
  }

  List<MovieModel> dataNotNull(List<MovieModel> movies) {
    for (int i = 0; i < movies.length; i++) {
      if (movies[i].posterPath == null) {
        log('Element is null: ${i.toString()}');
        movies.removeAt(i);
      }
    }
    return movies;
  }
}