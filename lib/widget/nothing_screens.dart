import 'package:flutter/material.dart';

class NothingSearch extends StatelessWidget {
  const NothingSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/Illustrations/film.png",
          scale: 1.5,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Search Movie Your Favorite',
            style: TextStyle(
                fontFamily: 'Abrill',
                fontSize: 18,
                color: Theme.of(context).textTheme.titleMedium?.color),
          ),
        )
      ],
    );
  }
}
