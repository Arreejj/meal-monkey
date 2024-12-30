import 'package:flutter/material.dart';
import 'package:areej/common/color_extension.dart';
import 'package:areej/common_widget/tab_button.dart';
import 'package:areej/view/menu/menu_view.dart';

class NavBar extends StatefulWidget {
  final int initialTab;
  final List<Widget> pages;

  const NavBar({
    Key? key,
    this.initialTab = 2,
    required this.pages,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBare();
}

class _NavBare extends State<NavBar> {
  late int selectedTab;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
    currentPage = widget.pages[selectedTab];
  }

  void onTabSelected(int tabIndex) {
    setState(() {
      selectedTab = tabIndex;
      currentPage = widget.pages[selectedTab];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      backgroundColor: const Color(0xfff5f5f5),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () => onTabSelected(2),
          shape: const CircleBorder(),
          backgroundColor:
              selectedTab == 2 ? TColor.primary : TColor.placeholder,
          child: Image.asset(
            "assets/img/tab_home.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: TColor.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                title: "home",
                icon: "assets/img/tab_menu.png",
                onTap: () => onTabSelected(0),
                isSelected: selectedTab == 0,
              ),
              TabButton(
                title: "menu",
                icon: "assets/img/tab_offer.png",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MenuView(), // Navigate to MenuView
                    ),
                  );
                },
                isSelected: selectedTab == 1,
              ),
              const SizedBox(width: 40, height: 40),
              TabButton(
                title: "Profile",
                icon: "assets/img/tab_profile.png",
                onTap: () => onTabSelected(3),
                isSelected: selectedTab == 3,
              ),
              TabButton(
                title: "More",
                icon: "assets/img/tab_more.png",
                onTap: () => onTabSelected(4),
                isSelected: selectedTab == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
