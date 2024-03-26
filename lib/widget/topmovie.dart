
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/screens/detail_screen.dart';
import 'package:movinfo/service/filterData.dart';

class TopMovieWidget extends StatelessWidget {
  final MovieModel movie;
  const TopMovieWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () =>
              context.go(DetailScreen.routName, extra: {'movies': movie}),
          child: Stack(
            children: [
              Container(
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                          image: NetworkImage(
                              FilterData.filterUrlImage(movie.posterPath!)),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black, blurRadius: 5)
                      ])),
              Container(
                alignment: Alignment.bottomLeft,
                width: 190,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    movie.title!,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
