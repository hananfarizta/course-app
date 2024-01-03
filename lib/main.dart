import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mycourse/course_provider.dart';
import 'package:mycourse/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CourseProvider())
      ],
      child: MaterialApp(
        title: 'UTS RIO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
