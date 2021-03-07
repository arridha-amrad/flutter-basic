import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/api/services.dart';
import 'package:try_flutter/bloc/album/bloc.dart';
import 'package:try_flutter/screens/album_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (BuildContext context) =>
              AlbumBloc(albumRepository: AlbumService()),
          child: AlbumScreen()),
    );
  }
}
