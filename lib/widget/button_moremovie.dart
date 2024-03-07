import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/screens/category_screen.dart';

class ButtonMoreMovie extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;

  const ButtonMoreMovie({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ElevatedButton(
          onPressed: () => context.go(CategoryScreen.routeName, extra: {
                'title': title,
                'movies': movies,
              }),
          child: const Text('More...',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Questrial',
              ))),
    );
  }
}
