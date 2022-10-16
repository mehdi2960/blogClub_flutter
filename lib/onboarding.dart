import 'package:blog_club/auth.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  final items = AppData.onBoardingItems;

  int page = 0;
  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Image.asset('assets/img/icons/onboarding.png')),
            Container(
              height: 260,
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 32, bottom: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Column(
                          children: [
                            Text(
                              item.title,
                              style: themeData.textTheme.headline5,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              item.description,
                              style: themeData.textTheme.subtitle1!
                                  .apply(fontSizeDelta: 0.8),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                            dotWidth: 8,
                            dotHeight: 8,
                            activeDotColor: themeData.colorScheme.primary,
                            dotColor:
                                themeData.colorScheme.primary.withOpacity(0.1),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(84, 60),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (page == items.length - 1) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            } else {
                              _pageController.animateToPage(
                                page + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate,
                              );
                            }
                          },
                          child: Icon(
                            page == items.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
