import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travell_app/cubit/app_cubits.dart';
import 'package:travell_app/misc/colors.dart';
import 'package:travell_app/pages/navpages/main_page.dart';
import 'package:travell_app/pages/welcome_page.dart';

import '../pages/detail_page.dart';
import '../pages/navpages/home_page.dart';
import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is DetailState){
            return DetailPage();
          }
          if(state is WelcomeState){
            return WelcomePage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(color: AppColors.mainColor,),);
          }
          if(state is LoadedState){
            return MainPage();
          }
          // else{
          //   return Container();
          // }
          return Container();
        }),
    );
  }
}