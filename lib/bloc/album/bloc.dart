import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/api/Exception.dart';
import 'package:try_flutter/bloc/album/event.dart';
import 'package:try_flutter/bloc/album/state.dart';
import 'package:try_flutter/models/abum_model.dart';
import 'package:try_flutter/repository/album_repo.dart';

class AlbumBloc extends Bloc<AlbumEvents, AlbumState> {
  final AlbumRepository albumRepository;
  List<Album> albums;
  AlbumBloc({this.albumRepository}) : super(AlbumInitState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumLoading();
        try {
          albums = await albumRepository.getAlbumList();
          yield AlbumLoaded(albums: albums);
        } on SocketException {
          yield AlbumListError(
              error: NoInternetException("Connection failure"));
        } on HttpException {
          yield AlbumListError(
              error: NoServiceFoundException("No Service Found"));
        } on FormatException {
          yield AlbumListError(
              error: InvalidFormatException("Invalid Format Exception"));
        } catch (e) {
          yield AlbumListError(error: UnknownException("Unknown Error"));
        }
        break;
    }
  }
}
