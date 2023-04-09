import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/pro_demo2.dart';
import 'package:provider_demo/controller/song_provider.dart';
import 'package:provider_demo/views/page1.dart';

import 'controller/pro_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderDemo>(create: (_)=>ProviderDemo()),
        ChangeNotifierProvider<ProDemo2>(create: (_)=>ProDemo2()),
        ChangeNotifierProvider<SongProvider>(create: (_)=>SongProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page1(),
      ),
    );
  }
}