import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_project/bloc/git_bloc.dart';
import 'package:git_project/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => GitBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.urbanistTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
