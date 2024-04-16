import 'package:flutter/material.dart';

class NothingBookMark extends StatelessWidget {
  const NothingBookMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Illustrations/notbookmark.png',
          scale: 1.5,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Oh noo... you dont have bookmark',
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
