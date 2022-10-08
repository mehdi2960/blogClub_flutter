import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = const Color(0Xff00253C);
    final secendryTextColor = const Color(0XFF2D4379);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Club',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          subtitle1: TextStyle(
              color: secendryTextColor,
              fontSize: 17,
              fontWeight: FontWeight.bold),
          headline6: TextStyle(
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
          ),
          bodyText2: TextStyle(color: secendryTextColor, fontSize: 12),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppData.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, Jonathan!!",
                      style: themeData.textTheme.subtitle1,
                    ),
                    Image.asset(
                      'assets/img/icons/Notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headline6,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                  itemCount: stories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final story = stories[index];
                    return Container(
                      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    colors: [
                                      Color(0xff376AED),
                                      Color(0xff49B0E2),
                                      Color(0xff9CECFB),
                                    ],
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(
                                      'assets/img/stories/${story.imageFileName}'),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Image.asset(
                                  'assets/img/icons/${story.iconFileName}',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(story.name),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
