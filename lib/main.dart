import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagenation/bloc/auth_cubit/auth_cubit.dart';
import 'package:pagenation/ui/pagenation_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
     BlocProvider(create: (context) =>  AuthCubit(),)
    ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageNationPage(),
    );
  }
}
