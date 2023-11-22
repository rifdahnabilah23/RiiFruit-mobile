import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:riifruit/screens/login.dart';
import 'package:riifruit/screens/menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
          create: (_) {
              CookieRequest request = CookieRequest();
              return request;
          },
          child: MaterialApp(
              title: 'Flutter App',
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                  useMaterial3: true,
              ),
              home: LoginPage(),
            ),
      );
    // return MaterialApp(
    //   title: 'RiiFruit Apps',
    //   theme: ThemeData(
    //     appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 69, 45, 14)),
    //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    //     useMaterial3: true,
    //   ),
    //   home: MyHomePage(),
    // );
  }
}


