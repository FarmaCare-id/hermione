// import 'package:best_flutter_ui_templates/app_theme.dart';
// import 'package:best_flutter_ui_templates/custom_drawer/drawer_user_controller.dart';
// import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
// import 'package:best_flutter_ui_templates/feedback_screen.dart';
// import 'package:best_flutter_ui_templates/help_screen.dart';
// import 'package:best_flutter_ui_templates/home_screen.dart';
// import 'package:best_flutter_ui_templates/invite_friend_screen.dart';
import 'package:farmacare/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_drawer/home_drawer.dart';
import '../../widgets/custom_drawer/drawer_user_controller.dart';
import 'package:farmacare/ui/home/home.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColors.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = HomeScreen();
          });
          break;
        // case DrawerIndex.Help:
        //   setState(() {
        //     screenView = HelpScreen();
        //   });
        //   break;
        // case DrawerIndex.FeedBack:
        //   setState(() {
        //     screenView = FeedbackScreen();
        //   });
        //   break;
        // case DrawerIndex.Invite:
        //   setState(() {
        //     screenView = InviteFriend();
        //   });
        //   break;
        default:
          break;
      }
    }
  }
}
