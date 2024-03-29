import 'package:blog_club/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const int homeIndex = 0;
const int articleIndex = 1;
const int profileIndex = 2;

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    profileIndex: _profileKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: IndexedStack(
            index: selectedScreenIndex,
            children: [
              _navigator(_homeKey, homeIndex, const HomeScreen()),
              _navigator(
                  _articleKey,
                  articleIndex,
                  const Center(
                    child: Text('Article'),
                  )),
              _navigator(
                  _profileKey,
                  profileIndex,
                  const Center(
                    child: Text('Profile'),
                  )),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'خانه'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.cart), label: 'سبد خرید'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'پروفایل'),
            ],
            currentIndex: selectedScreenIndex,
            onTap: (selectedIndex) {
              setState(() {
                _history.remove(selectedScreenIndex);
                _history.add(selectedScreenIndex);
                selectedScreenIndex = selectedIndex;
              });
            },
          ),
        ),
        onWillPop: _onWillPop);
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: selectedScreenIndex != index,
                child: child,
              ),
            ),
          );
  }
}