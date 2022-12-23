import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/media_quary.dart';
import 'package:movie_app/features/tv/presentation/screens/tv_screen.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';
import 'package:movie_app/root_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _homePage = [MainMoviesScreen(), TvScreen(),SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _homePage,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: const Color(0xff1E1E29),
        iconSize: context.weight * 0.14,
        mouseCursor: SystemMouseCursors.grab,
        showSelectedLabels: false,
        // unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        selectedItemColor: Colors.red.withOpacity(0.7),
        unselectedIconTheme:
            IconThemeData(color: Colors.white.withOpacity(0.7)),
        unselectedFontSize: 0.0,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Movie',
            icon: Icon(
              Icons.movie,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Tv',
            icon: Icon(
              Icons.screenshot_monitor_outlined,
            ),
          ),
          BottomNavigationBarItem(
              label: 'Setting',
              icon: Icon(Icons.settings))
        ],
      ),
    );
  }
}
