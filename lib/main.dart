import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/controller/pro_demo2.dart';
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
        ChangeNotifierProvider(create: (_)=>ProviderDemo()),
        ChangeNotifierProvider(create: (_)=>ProDemo2()),
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