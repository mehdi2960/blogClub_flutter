import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          subtitle1: TextStyle(
            color: secendryTextColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
              fontWeight: FontWeight.bold,
              color: primaryTextColor,
              fontSize: 18),
          headline4: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: primaryTextColor,
          ),
          headline5: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: primaryTextColor,
          ),
          bodyText2: TextStyle(color: secendryTextColor, fontSize: 12),
        ),
      ),
      home: Stack(
        children: const [
          Positioned.fill(child: HomeScreen()),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: _BottomNavigation(),
          ),
        ],
      ),
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
          physics: const BouncingScrollPhysics(),
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
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 24),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headline4,
                ),
              ),
              _Story(stories: stories),
              const SizedBox(
                height: 16,
              ),

              // Slider
              const SliderList(),
              // Post
              const _PostList(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Slider
class SliderList extends StatelessWidget {
  const SliderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppData.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        final category = categories[index];
        return Stack(
          children: [
            Positioned.fill(
              top: 100,
              right: 55,
              left: 56,
              bottom: 15,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/img/posts/${category.imageFileName}',
                    fit: BoxFit.cover,
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Color(0xff0D253C), Colors.transparent]),
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              left: 42,
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Colors.white),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        height: 250,
        aspectRatio: 1.2,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        scrollDirection: Axis.horizontal,
        disableCenter: true,
        enlargeCenterPage: true,
        autoPlay: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
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
                    _StoryItem(story: story),
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
    );
  }
}

class _StoryItem extends StatelessWidget {
  const _StoryItem({
    Key? key,
    required this.story,
  }) : super(key: key);

  final Story story;

  @override
  Widget build(BuildContext context) {
    return story.isViewed
        ? _profileImageViewed(context)
        : _profileImageNormal();
  }

  Widget _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
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
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        strokeWidth: 2,
        borderType: BorderType.RRect,
        dashPattern: const [8, 3],
        radius: const Radius.circular(24),
        padding: const EdgeInsets.all(7),
        color: Theme.of(context).textTheme.bodyText2!.color!,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Image.asset(
      'assets/img/stories/${story.imageFileName}',
    );
  }
}

//PostList
class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppData.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: themeData.textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Color(0xff376AED),
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          physics:
              const ClampingScrollPhysics(), //Baraye Scroll Kardan 2Ta Mohtava
          itemCount: posts.length,
          // padding: const EdgeInsets.only(bottom: 40),
          itemExtent: 141,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Container(
              margin: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              // height: 149,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0x1a5282FF),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/posts/${post.imageFileName}',
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.caption,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff376AED)),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            post.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                CupertinoIcons.hand_thumbsup,
                                size: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                post.likes,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Icon(
                                CupertinoIcons.time,
                                size: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .color,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(post.likes),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    post.isBookmarked
                                        ? CupertinoIcons.bookmark_fill
                                        : CupertinoIcons.bookmark,
                                    size: 16,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff9b8487).withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  BottomNavigationItem(
                    title: 'Home',
                    iconFileName: 'Home.png',
                    activeIconFileName: 'Home.png',
                  ),
                  BottomNavigationItem(
                    title: 'Articles',
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'Articles.png',
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  BottomNavigationItem(
                    title: 'Search',
                    iconFileName: 'Search.png',
                    activeIconFileName: 'Search.png',
                  ),
                  BottomNavigationItem(
                    title: 'Menu',
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'Menu.png',
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: const Color(0xff376AED),
                  border: Border.all(color: Colors.white, width: 4),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {Key? key,
      required this.title,
      required this.iconFileName,
      required this.activeIconFileName})
      : super(key: key);

  final String title;
  final String iconFileName;
  final String activeIconFileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }
}

