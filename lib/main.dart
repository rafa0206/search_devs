import 'package:flutter/material.dart';
import 'package:search_devs/ui/views/dev_view.dart';
import 'package:search_devs/ui/views/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0069CA)),
        // useMaterial3: true,
      ),
      home: const SearchView(),
      // home: const DevView(),
    );
  }
}

