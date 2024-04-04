import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/screens/detail.dart';
import 'package:movinfo/service/filterData.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/movie/movie_bloc.dart';

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
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5)
                    ]),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: FilterData.filterUrlImage(movie.posterPath!),
                  fit: BoxFit.fill,
                ),
              ),
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
              BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  return Positioned(
                      top: 2.0,
                      right: 0.0,
                      child: IconButton(
                          onPressed: () {
                            movie.isSaved == false
                                ? context
                                    .read<MovieBloc>()
                                    .add(OnSavedBookMark(movies: movie))
                                : context
                                    .read<MovieBloc>()
                                    .add(OnUnSavedBookMark(movies: movie));
                          },
                          icon: Icon(Icons.favorite,
                              color: movie.isSaved == true
                                  ? Colors.red
                                  : Colors.white)));
                },
              )
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
