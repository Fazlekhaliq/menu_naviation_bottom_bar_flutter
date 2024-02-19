

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menu_naviation_bottom_bar_flutter/pages/screeen1.dart';
import 'package:menu_naviation_bottom_bar_flutter/pages/screen2.dart';
import 'package:menu_naviation_bottom_bar_flutter/pages/screen3.dart';
import 'package:menu_naviation_bottom_bar_flutter/pages/screen4.dart';
import 'package:menu_naviation_bottom_bar_flutter/pages/screen5.dart';
class MenuNavigationBar extends StatefulWidget {
  const MenuNavigationBar({Key? key}) : super(key: key);

  @override
  _MenuNavigationBarState createState() => _MenuNavigationBarState();
}

class _MenuNavigationBarState extends State<MenuNavigationBar> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5(),


  ];

  void itemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            IndexedStack(
              index: selectedIndex,
              children: pages,
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                height: 76.0,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.deepPurple.shade900,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _icons("images/home-4-line.svg", "Home", selectedIndex == 0,
                            () {
                          itemTap(0);
                        }),
                    _icons("images/Basketball line.svg", "Events",
                        selectedIndex == 1, () {
                          itemTap(1);
                        }),
                    _icons("images/group-line.svg", "People", selectedIndex == 2,
                            () {
                          itemTap(2);
                        }),
                    _icons("images/Remix Icon.svg", "Feed", selectedIndex == 3,
                            () {
                          itemTap(3);
                        }),
                    _icons("images/Shape.svg", "Activity", selectedIndex == 4,
                            () {
                          itemTap(4);
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _icons(
      String path, String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              path,
              color: isSelected ? Colors.white : Color(0xff8A8A8A),
              width: 22.0,
              height: 22.0,
            ),
            SizedBox(height: 4.0),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xff8A8A8A),
                fontSize: 10,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
