import 'package:fan_side_drawer/fan_side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marka/core/router/router.dart';
import 'package:marka/core/theme/app_colors.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

import 'widget/body_home.dart';
import 'widget/my_diary_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
    AnimationController? animationController;
     @override
  void initState() {
    

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    MyDiaryScreen(animationController: animationController!);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {
          Get.off(
            () =>  MyDiaryScreen(animationController: animationController!,),
            transition: Transition.rightToLeft,
          );
        }, icon: const Icon(Icons.notifications)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.add_business_outlined)),
        GestureDetector(
          child: const CircleAvatar(
            backgroundImage: AssetImage("asset/image/logo2.png"),
          ),
          onTap: () => showImageProfile(context),
        ),
      ]),
      drawer: Drawer(
        width: 255,
        child: FanSideDrawer(
          drawerType: DrawerType.pipe,
          menuItems: menuItems,
          selectedColor: AppColors.lightButton,
          selectedItemBackgroundColor: AppColors.lightSecondary.withOpacity(0.5),
        ),
      ),
      body: const BodyHome(),
    );
  }

  void showImageProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.asset("asset/image/logo2.png"),
          backgroundColor: Colors.transparent,
          
        );
      },
    );
  }

  List<DrawerMenuItem> get menuItems => [
        DrawerMenuItem(
            title: 'Home',
            icon: Icons.house_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Account Details',
            icon: Icons.account_circle_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Profile',
            icon: Icons.info_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Wallet',
            icon: Icons.wallet_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Transaactions',
            icon: Icons.attach_money_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Messages',
            icon: Icons.message_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Tickets',
            icon: Icons.support_agent_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Orders',
            icon: Icons.format_list_bulleted_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'App Settings',
            icon: Icons.adb_sharp,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Notifications',
            icon: Icons.alarm_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Subscribtion Plans',
            icon: Icons.question_answer_rounded,
            iconSize: 15,
            onMenuTapped: () {}),
        DrawerMenuItem(
            title: 'Shops',
            icon: Icons.store,
            iconSize: 15,
            onMenuTapped: () {}),
      ];
}
