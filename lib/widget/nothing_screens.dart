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
        const Center(
          child: Text(
            'Search Movie Your Favorit',
            style: TextStyle(
              fontFamily: 'Abrill',
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
