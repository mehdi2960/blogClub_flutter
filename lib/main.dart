import 'package:blog_club/bottom_navigation.dart';
import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/splash_screen.dart';
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
    const primaryTextColor = Color(0Xff00253C);
    const secendryTextColor = Color(0XFF2D4379);
    const primaryColor = Color(0Xff376AED);

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
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          onBackground: primaryTextColor,
          background: Color(0xffFBFCFF),
          surface:Colors.white
        ),
        textTheme: const TextTheme(
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

      // home: Stack(
      //   children: const [
      //     Positioned.fill(child: HomeScreen()),
      //     Positioned(
      //       right: 0,
      //       left: 0,
      //       bottom: 0,
      //       child: BottomNavigation(),
      //     ),
      //   ],
      // ),

      home: const SplashScreen(),
    );
  }
}
