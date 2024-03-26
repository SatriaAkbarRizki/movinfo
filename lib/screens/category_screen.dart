import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movinfo/service/filterData.dart';
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
            onPressed: () => context.go('/'), icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(children: [
        ListMovieWidget(
            showExpanded: true,
            routePage: routeName,
          
            movies: FilterData.dataNotNull(
              
              data['movies'],
            ))
      ]),
    );
  }

  
}
