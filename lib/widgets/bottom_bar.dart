import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_ui/utils/constants.dart';

class BottomBar extends StatelessWidget {
  final Function changeIndex;
  final int currentIndex;
  BottomBar({required this.changeIndex, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Constants.primaryColor2,
      currentIndex: this.currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Color.fromRGBO(202, 205, 219, 1),
      ),
      selectedIconTheme: IconThemeData(
        color: Constants.primaryColor,
      ),
      onTap: (index) {
        changeIndex(index);
      },
      items: [
        BottomNavigationBarItem(
            label: "",
            activeIcon: Icon(
              FluentIcons.home_32_filled,
              color: Colors.white,
            ),
            icon: Icon(
              FluentIcons.home_32_regular,
              color: Colors.white,
            )),
        BottomNavigationBarItem(
          label: "",
          activeIcon: Icon(
            FluentIcons.grid_28_filled,
            color: Colors.white,
          ),
          icon: Icon(
            FluentIcons.grid_28_regular,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          activeIcon: Icon(
            FluentIcons.search_32_filled,
            color: Colors.white,
          ),
          icon: Icon(
            FluentIcons.search_32_regular,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          activeIcon: Icon(
            FluentIcons.bookmark_32_filled,
            color: Colors.white,
          ),
          icon: Icon(
            FluentIcons.bookmark_32_regular,
            color: Colors.white,
          ),
        ),
        BottomNavigationBarItem(
          label: "",
          activeIcon: Icon(
            FluentIcons.person_32_filled,
            color: Colors.grey,
          ),
          icon: Icon(
            FluentIcons.person_32_regular,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }
}
