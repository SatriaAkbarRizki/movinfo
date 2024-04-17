import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movinfo/bloc/movie/movie_bloc.dart';
import 'package:movinfo/service/filterData.dart';
import 'package:movinfo/widget/listmovie.dart';
import 'package:movinfo/widget/nothing_screens.dart';

class SearchScreens extends StatelessWidget {
  const SearchScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            forceMaterialTransparency: true,
            title: TextFormField(
              style: TextStyle(
                  color: Theme.of(context).textTheme.titleMedium?.color),
              decoration: const InputDecoration(
                labelText: 'Search Movie',
              ),
              onChanged: (value) =>
                  context.read<MovieBloc>().add(OnSearchMovie(title: value)),
            ),
          )
        ],
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(
                child:
                    Lottie.asset('assets/animations/loading.json', height: 150),
              );
            } else if (state is MovieFailure) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is MovieLoaded) {
              if (state.moviesSearch?.length == 0 ||
                  state.moviesSearch == null) {
                return NothingWidget(
                  message: 'Search Movie Your Favorite',
                  type: TypeNothing.search,
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: ListMovieWidget(
                        showExpanded: true,
                        movies: FilterData.dataNotNull(state.moviesSearch!)),
                  ),
                );
              }
            }
            return NothingWidget(
              message: 'Search Movie Your Favorite',
              type: TypeNothing.search,
            );
          },
        ),
      ),
    );
  }
}
