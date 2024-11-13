import 'package:dearfam/src/screen/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:dearfam/src/screen/home.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final ValueNotifier<bool> refreshNotifier = ValueNotifier<bool>(false);

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  refreshListenable: refreshNotifier,
  initialLocation: '/',
  routes: [
    // BottomBar를 포함한 경로
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => Home(),
    ),

    // 다른 경로들을 추가하세요
  ],
);
