import 'package:bloc_app/cubit/themes_cubit.dart';
import 'package:bloc_app/cubit/users_cubit.dart';
import 'package:bloc_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemesCubit(),
      child: BlocProvider(
        create: (context) => UsersCubit()..getUsers(),
        child: BlocBuilder<ThemesCubit, bool>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                brightness: state ? Brightness.dark : Brightness.light,
                useMaterial3: true,
              ),
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}
