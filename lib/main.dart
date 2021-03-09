import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/api/services.dart';
import 'package:try_flutter/bloc/album/bloc.dart';
import 'package:try_flutter/bloc/theme/theme_bloc.dart';
import 'package:try_flutter/screens/album_screen.dart';
import 'package:try_flutter/settings/preferences.dart';

import 'bloc/theme/theme_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: BlocProvider(
                create: (BuildContext context) =>
                    AlbumBloc(albumRepository: AlbumService()),
                child: AlbumScreen()),
          );
        },
      ),
    );
  }
}
