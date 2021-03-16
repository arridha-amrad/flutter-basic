import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/app_navigator.dart';
import 'package:try_flutter/nav_cubit.dart';
import 'package:try_flutter/post_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => NavCubit()),
        BlocProvider(create: (context) => PostBloc()..add(LoadedPostEvent())),
      ], child: AppNavigator()),
    );
  }
}
