import 'package:flutter/material.dart';
import 'package:news_app/features/splash/view.dart';
import 'package:news_app/home/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit().getHeadLineData;

    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}
