import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/model/movie.dart';
import 'package:movinfo/screens/detail.dart';
import 'package:movinfo/service/filterData.dart';
import 'package:transparent_image/transparent_image.dart';

import '../bloc/movie/movie_bloc.dart';

class ListMovieWidget extends StatelessWidget {
  bool? showExpanded;
  String routePage;
  List<MovieModel> movies;
  ListMovieWidget(
      {super.key,
      this.showExpanded,
      this.routePage = '/',
      required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: showExpanded == true ? movies.length : 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2, childAspectRatio: 0.75),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => context.go(DetailScreen.routName,
              extra: {'routePage': routePage, 'movies': movies[index]}),
          child: Stack(
            children: [
              Container(
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 5)
                    ]),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: FilterData.filterUrlImage(movies[index].posterPath!),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                width: 200,
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
                    movies[index].title!,
                    style: Theme.of(context).textTheme.titleSmall,
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
                            movies[index].isSaved == false
                                ? context
                                    .read<MovieBloc>()
                                    .add(OnSavedBookMark(movies: movies[index]))
                                : context.read<MovieBloc>().add(
                                    OnUnSavedBookMark(movies: movies[index]));
                          },
                          icon: Icon(Icons.favorite,
                              color: movies[index].isSaved == true
                                  ? Colors.red
                                  : Colors.white)));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
