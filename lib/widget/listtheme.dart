import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movinfo/cubit/theme_cubit.dart';

class ListThemeModal extends StatelessWidget {
  const ListThemeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return Wrap(
          spacing: 5.0,
          children: [
            InkWell(
              onTap: () => context.read<ThemeCubit>().themeSwitch(false),
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: state == false ? 2.5 : 0,
                      color: state == false
                          ? const Color(0xff5d8274)
                          : Colors.black,
                    ),
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
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => context.read<ThemeCubit>().themeSwitch(true),
              child: Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: state == true ? 2.5 : 0,
                        color: state == true
                            ? const Color(0xff5d8274)
                            : Colors.black),
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
              ),
            )
          ],
        );
      },
    );
  }
}
