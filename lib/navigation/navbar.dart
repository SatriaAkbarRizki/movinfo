import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movinfo/cubit/navigation_cubit.dart';
import 'package:movinfo/screens/bookmark.dart';
import 'package:movinfo/screens/home.dart';
import 'package:movinfo/screens/profile.dart';
import 'package:movinfo/screens/search.dart';

class NavBarMovie extends StatelessWidget {
  final List listPage = [
    const HomeScreens(),
    const SearchScreens(),
    BookmarkScreens(),
    const ProfileScreens()
  ];
  NavBarMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) => listPage[state],
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, int>(
        builder: (context, state) {
          return ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: SvgPicture.asset(
                        'assets/icons/home.svg',
                        color: state == 0
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                      )),
                  BottomNavigationBarItem(
                      label: 'Search',
                      icon: SvgPicture.asset(
                        'assets/icons/search.svg',
                        color: state == 1
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                      )),
                  BottomNavigationBarItem(
                      label: 'Bookmark',
                      icon: SvgPicture.asset(
                        'assets/icons/bookmark.svg',
                        color: state == 2
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                      )),
                  BottomNavigationBarItem(
                      label: 'Profile',
                      icon: SvgPicture.asset(
                        'assets/icons/user.svg',
                        color: state == 3
                            ? Theme.of(context)
                                .bottomNavigationBarTheme
                                .selectedItemColor
                            : Theme.of(context)
                                .bottomNavigationBarTheme
                                .unselectedItemColor,
                      ))
                ],
                currentIndex: context.read<NavBarCubit>().state,
                onTap: (value) =>
                    context.read<NavBarCubit>().switchNavBar(value),
              ));
        },
      ),
    );
  }
}
