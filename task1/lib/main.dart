import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/presentation/login_screen.dart';
import 'package:task1/presentation/splash_screen.dart';
import 'package:task1/providers/post_provider.dart';
import 'package:task1/providers/user_provider.dart';

import 'presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TASK 1',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
