import 'package:flutter/material.dart';

enum TypeNothing { datanull, search, bookmark }

class NothingWidget extends StatelessWidget {
  final String message;
  final TypeNothing type;
  List<String> assets = [
    'assets/Illustrations/error.png',
    'assets/Illustrations/film.png',
    'assets/Illustrations/notbookmark.png'
  ];
  NothingWidget({super.key, required this.message, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        switch (type) {
          TypeNothing.datanull => Image.asset(
              assets[0],
              scale: 1.5,
            ),
          TypeNothing.search => Image.asset(
              assets[1],
              scale: 1.5,
            ),
          TypeNothing.bookmark => Image.asset(
              assets[2],
              scale: 1.5,
            ),
        },
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            message,
            textAlign: TextAlign.center,
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
