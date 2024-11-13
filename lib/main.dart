import 'package:dearfam/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dearfam/core/routes/routes.dart'; // Unused import removed
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async'; // Timer를 사용하기 위해 추가

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

// ...

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    await [Permission.camera, Permission.photos].request();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // 디자인 기준 사이즈 설정
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'DearFam',
          theme: ThemeData(
            scaffoldBackgroundColor: ColorSystem.brandMainColor2,
            primaryColor: Colors.purple,
          ),
        );
      },
    );
  }
}
