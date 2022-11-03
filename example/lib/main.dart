import 'dart:developer';

import 'package:example/constant/dimens.dart' as example;
import 'package:example/constant/strings.dart' as example;
import 'package:example/constant/styles.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'constant/colors.dart' as example;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: example.Strings.appName,
      theme: ThemeData(fontFamily: Fonts.poppins),
      home: const BottomNavigatorExample(title: example.Strings.appName),
    );
  }
}

class BottomNavigatorExample extends StatefulWidget {
  const BottomNavigatorExample({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
}

class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
  bool circleButtonToggle = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 3,
              backgroundColor: Colors.black,
              title: Text(widget.title),
            ),
            backgroundColor: Colors.white70,
            floatingActionButton: const SizedBox(
              height: example.Dimens.heightNormal,
              width: example.Dimens.widthNormal,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: const Center(child: Text('Hello World!'),),
            bottomNavigationBar: AnimatedBottomNavigationBar(
              appbarColor: Colors.white,
              appbarGradient: const LinearGradient(
                  colors: [Colors.white, Colors.white12],
                  stops: [0.2, 0.8],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              bottomBar: [
                BottomBarItemsModel(
                  icon: const Icon(Icons.home, size: example.Dimens.iconNormal),
                  iconSelected: const Icon(Icons.home,
                      color: Colors.red, size: example.Dimens.iconNormal),
                  title: example.Strings.home,
                  dotColor: Colors.amberAccent,
                  onTap: () {
                    log('Home');
                  },
                ),
                BottomBarItemsModel(
                  icon:
                      const Icon(Icons.search, size: example.Dimens.iconNormal),
                  iconSelected: const Icon(Icons.search,
                      color: AppColors.cherryRed,
                      size: example.Dimens.iconNormal),
                  title: example.Strings.search,
                  dotColor: example.AppColors.cherryRed,
                  onTap: () {
                    log('Search');
                  },
                ),
                BottomBarItemsModel(
                  icon:
                      const Icon(Icons.person, size: example.Dimens.iconNormal),
                  iconSelected: const Icon(Icons.person,
                      color: AppColors.cherryRed,
                      size: example.Dimens.iconNormal),
                  title: example.Strings.person,
                  dotColor: example.AppColors.cherryRed,
                  onTap: () {
                    log('Profile');
                  },
                ),
                BottomBarItemsModel(
                    icon: const Icon(Icons.settings,
                        size: example.Dimens.iconNormal),
                    iconSelected: const Icon(Icons.settings,
                        color: AppColors.cherryRed,
                        size: example.Dimens.iconNormal),
                    title: example.Strings.settings,
                    dotColor: example.AppColors.cherryRed,
                    onTap: () {
                      log('Settings');
                    }),
              ],
              bottomBarCenter: BottomBarCenterModel(
                centerBackgroundColor: example.AppColors.cherryRed,
                centerIcon: const FloatingCenterButton(
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ),
                centerIconChild: [
                  FloatingCenterButtonChild(
                    child: const Icon(
                      Icons.adb,
                      color: AppColors.white,
                    ),
                    onTap: () => log('Item1'),
                  ),
                  FloatingCenterButtonChild(
                    child: const Icon(
                      Icons.access_alarm,
                      color: AppColors.white,
                    ),
                    onTap: () => log('Item2'),
                  ),
                  FloatingCenterButtonChild(
                    child: const Icon(
                      Icons.account_balance_rounded,
                      color: AppColors.white,
                    ),
                    onTap: () => log('Item3'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
