import 'package:flutter/material.dart';
import 'package:plants/utils/colors.dart';
import 'package:plants/view/MyCart.dart';
import 'package:plants/view/home.dart';
import 'package:plants/view/profile.dart';
import 'package:plants/view/settings.dart';

final screens = [
  home(),
  MyCart(),
  profileScreen(),
  settingScreen(),
];

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(
    vsync: this,
    length: tabs.length,
  );

  final tabs = [
    Tab(
      icon: Image.asset(
        "assets/icons/home.png",
        width: 30,
        height: 30,
        color: Colors.black,
      ),
    ),
    Tab(
      icon: Image.asset(
        "assets/icons/shopping.png",
        width: 30,
        height: 30,
      ),
    ),
    Tab(
      icon: Image.asset(
        "assets/icons/profile.png",
        width: 30,
        height: 30,
      ),
    ),
    Tab(
      icon: Image.asset(
        "assets/icons/profile.png",
        width: 30,
        height: 30,
      ),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: screens[currentIndex],
          ),
          Container(
            color: UltColor.blue,
            child: TabBar(
              controller: tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: UltColor.purpel, width: 4.0),
                insets: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
              ),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              tabs: [
                Tab(
                  icon: Image.asset(
                    "assets/icons/home.png",
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    "assets/icons/shopping.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    "assets/icons/profile.png",
                    width: 30,
                    height: 30,
                  ),
                ),
                Tab(
                  icon: Image.asset(
                    "assets/icons/settings.png",
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
