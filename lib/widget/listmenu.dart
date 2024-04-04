import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final String nameList;
  const ListMenu({super.key, required this.nameList});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            nameList,
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 16),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
