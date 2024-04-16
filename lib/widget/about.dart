import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 500,
        child: Wrap(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              child: Text(
                'MOVINFO',
                style: TextStyle(
                    fontFamily: 'Abrill',
                    fontSize: 24,
                    color: Theme.of(context).textTheme.titleMedium?.color),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Movinfo is application collection movie top, popular and upcoming, this app will give you notice about release new movie and application is open source also built with Flutter',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        wordSpacing: 2.0,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  'Thanks RemixIcon for Icons & Illustraion by Icons8',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        wordSpacing: 2.0,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
