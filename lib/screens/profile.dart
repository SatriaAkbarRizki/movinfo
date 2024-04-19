import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movinfo/widget/about.dart';
import 'package:movinfo/widget/listmenu.dart';
import 'package:movinfo/widget/listtheme.dart';

import '../widget/profile.dart';

class ProfileScreens extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Example',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  'Description',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          useSafeArea: true,
                          context: context,
                          builder: (context) => const Padding(
                            padding: EdgeInsets.all(20),
                            child: ListThemeModal(),
                          ),
                        ),
                        child: const ListMenu(
                          nameList: 'Theme Mode',
                        ),
                      ),
                      InkWell(
                          onTap: () => Future.delayed(
                              const Duration(milliseconds: 500),
                              () => showDialog(
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) => ProfileSettings(),
                                  )),
                          child: const ListMenu(nameList: 'Profile Settings')),
                      InkWell(
                          onTap: () => Future.delayed(
                              const Duration(milliseconds: 500),
                              () => showDialog(
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) => const AboutApp(),
                                  )),
                          child: const ListMenu(nameList: 'About'))
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => showDialog(
                useSafeArea: true,
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Text(
                    'Log Out?',
                    style: TextStyle(
                        color: Theme.of(context).textTheme.titleSmall?.color),
                  ),
                  content: Text('Are you sure want to log out??',
                      style: TextStyle(
                          color:
                              Theme.of(context).textTheme.titleSmall?.color)),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          log('no log out');
                          context.pop();
                        },
                        child: const Text('No')),
                    ElevatedButton(onPressed: () {}, child: const Text('Yes'))
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Log Out',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 16, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
