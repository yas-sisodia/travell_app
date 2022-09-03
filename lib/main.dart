import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travell_app/cubit/app_cubit_logics.dart';
import 'package:travell_app/cubit/app_cubits.dart';
import 'package:travell_app/pages/detail_page.dart';
import 'package:travell_app/pages/navpages/main_page.dart';
import 'package:travell_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(),
        child:  AppCubitLogics(),
    ));
  }
}
