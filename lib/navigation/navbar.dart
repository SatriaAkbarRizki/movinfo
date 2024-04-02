import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movinfo/cubit/navigation_cubit.dart';
import 'package:movinfo/screens/bookmark.dart';
import 'package:movinfo/screens/home.dart';
import 'package:movinfo/screens/search.dart';

class NavBarMovie extends StatelessWidget {
  final List listPage = [
    const HomeScreens(),
    const SearchScreens(),
     BookmarkScreens()
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
                items: const [
                  BottomNavigationBarItem(
                      label: 'Home',
                      icon: Icon(
                        Icons.home,
                      )),
                  BottomNavigationBarItem(
                      label: 'Search', icon: Icon(Icons.search)),
                  BottomNavigationBarItem(
                      label: 'Bookmark', icon: Icon(Icons.bookmark)),
                  BottomNavigationBarItem(
                      label: 'Profile', icon: Icon(Icons.people))
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
