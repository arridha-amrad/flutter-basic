import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/bloc/album/bloc.dart';
import 'package:try_flutter/bloc/album/event.dart';
import 'package:try_flutter/bloc/album/state.dart';
import 'package:try_flutter/bloc/theme/theme_bloc.dart';
import 'package:try_flutter/bloc/theme/theme_event.dart';
import 'package:try_flutter/models/abum_model.dart';
import 'package:try_flutter/settings/preferences.dart';
import 'package:try_flutter/settings/theme.dart';
import 'package:try_flutter/widgets/error.dart';
import 'package:try_flutter/widgets/text_mine.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadAlbum();
  }

  _loadAlbum() async {
    context.read<AlbumBloc>().add(AlbumEvents.fetchAlbums);
  }

  _loadTheme() {
    context.read<ThemeBloc>().add(ThemeEvent(appTheme: Preferences.getTheme()));
  }

  _setTheme(bool light) {
    AppTheme selectedTheme = light ? AppTheme.darkTheme : AppTheme.lightTheme;
    context.read<ThemeBloc>().add(ThemeEvent(appTheme: selectedTheme));
    Preferences.savedTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
        actions: [
          Switch(
              activeColor: Colors.black,
              value: Preferences.getTheme() == AppTheme.darkTheme,
              onChanged: (val) {
                _setTheme(val);
              })
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      BlocBuilder<AlbumBloc, AlbumState>(
          builder: (BuildContext context, AlbumState state) {
        if (state is AlbumListError) {
          final error = state.error;
          return ErrorTxt(error.message, _loadAlbum);
        } else if (state is AlbumLoaded) {
          return _listAlbum(state.albums);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      })
    ]);
  }

  Widget _listAlbum(List<Album> albums) {
    return Expanded(
        child: ListView.builder(
            itemCount: albums.length,
            itemBuilder: (_, index) {
              Album album = albums[index];
              return ListTile(
                title: MyText(album.id.toString()),
                subtitle: MyText(
                  album.title,
                ),
                leading: CircleAvatar(
                  child: Text(album.userId.toString()),
                ),
              );
            }));
  }
}
