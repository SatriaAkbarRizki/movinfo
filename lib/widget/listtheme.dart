import 'package:flutter/material.dart';

class ListThemeModal extends StatelessWidget {
  const ListThemeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      children: [
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff5d8274)),
              borderRadius: BorderRadius.circular(15)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Light Theme',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 18),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff5d8274)),
              borderRadius: BorderRadius.circular(15)),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Dark Theme',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 18),
              ),
            ),
          ),
        )
      ],
    );
  }
}
