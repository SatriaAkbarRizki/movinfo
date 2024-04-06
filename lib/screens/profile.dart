import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movinfo/widget/listmenu.dart';
import 'package:movinfo/widget/listtheme.dart';

class ProfileScreens extends StatelessWidget {
  static String routeName = '/profile';
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Example',
                  style: TextStyle(
                    fontFamily: 'Abrill',
                    fontSize: 18,
                    letterSpacing: 1.2,
                  ),
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
                      const ListMenu(nameList: 'Profile Settings'),
                      const ListMenu(nameList: 'About')
                    ],
                  ),
                ),
              ),
            ),
            Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
