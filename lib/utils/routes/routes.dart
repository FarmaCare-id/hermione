import 'package:farmacare/ui/appointment/appointment.dart';
import 'package:farmacare/ui/assistant/assistant.dart';
import 'package:farmacare/ui/community/community.dart';
import 'package:farmacare/ui/delivery/delivery.dart';
import 'package:farmacare/ui/drugs/drugs.dart';
import 'package:farmacare/ui/feedback/feedback.dart';
import 'package:farmacare/ui/home/home.dart';
import 'package:farmacare/ui/home/navigation_home_screen.dart';
import 'package:farmacare/ui/login/login.dart';
import 'package:farmacare/ui/register/register.dart';
import 'package:farmacare/ui/register/role_select.dart';
import 'package:farmacare/ui/register/name_input.dart';
import 'package:farmacare/ui/register/profession_select.dart';
import 'package:farmacare/ui/register/profession_verif.dart';
import 'package:farmacare/ui/landing/landing.dart';
import 'package:farmacare/ui/splash/splash.dart';
import 'package:farmacare/ui/wiki/wiki.dart';
import 'package:flutter/material.dart';

import 'package:farmacare/ui/home/post.dart';
import 'package:farmacare/ui/profile/profile.dart';
// import 'package:farmacare/ui/reply/replyApp.dart';
// import 'package:farmacare/ui/reply/reply.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String landing = '/landing';
  static const String login = '/login';
  static const String register = '/register';
  static const String roleSelect = '/register/role';
  static const String nameInput = '/register/name';
  static const String professionInput = '/register/profession';
  static const String professionVerif = '/register/profession/verif';
  
  static const String homeNavigate = '/homeNavigate';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String post = '/post';
  static const String reply = '/reply';
  static const String replyHome = '/replyHome';

  static const String drugs = '/drugs';
  static const String wiki = '/wiki';
  static const String assistant = '/assistant';
  static const String delivery = '/delivery';
  static const String appointment = '/appointment';
  static const String community = '/community';
  static const String feedback = '/feedback';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    landing: (BuildContext context) => LandingScreen(),
    login: (BuildContext context) => LoginScreen(),
    register: (BuildContext context) => RegisterScreen(),
    roleSelect: (BuildContext context) => RoleScreen(),
    nameInput: (BuildContext context) => NameInputRegisterScreen(),
    professionInput: (BuildContext context) => ProfessionInputRegisterScreen(),
    professionVerif: (BuildContext context) => ProfessionVerifRegisterScreen(),
    homeNavigate: (BuildContext context) => NavigationHomeScreen(),
    home: (BuildContext context) => HomeScreen(),
    profile: (BuildContext context) => ProfileScreen(),
    post: (BuildContext context) => PostScreen(),

    drugs : (BuildContext context) => DrugsScreen(),
    wiki: (BuildContext context) => WikiScreen(),
    assistant: (BuildContext context) => AssistantScreen(),
    delivery: (BuildContext context) => DeliveryScreen(),
    appointment: (BuildContext context) => AppointmentScreen(),
    community: (BuildContext context) => CommunityScreen(),
    feedback: (BuildContext context) => FeedbackScreen(),
    // reply: (BuildContext context) => ReplyApp(),
    // replyHome: (BuildContext context) => ReplyPage(),
  };
}
