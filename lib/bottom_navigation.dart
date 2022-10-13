
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

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

