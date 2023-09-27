import 'package:example/pages/mine/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:awesome_base/awesome_base.dart';

import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LazyIndexedStack(
          index: _currentIndex,
          itemBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return const HomePage();
              case 1:
                return const MinePage();
              default:
                return const HomePage();
            }
          },
          itemCount: 2,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Mine'),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
