import 'package:blog_club/home.dart';
import 'package:blog_club/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const OnBoarding()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffE6EAF1),
        body: Center(
          child: Image.asset('assets/img/icons/LOGO.png',width: 100,),
        ),
      ),
    );
  }
}
