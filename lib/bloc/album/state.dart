import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:try_flutter/models/abum_model.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumLoading extends AlbumState {}

class AlbumInitState extends AlbumState {}

class AlbumLoaded extends AlbumState {
  final List<Album> albums;
  AlbumLoaded({@required this.albums});
}

class AlbumListError extends AlbumState {
  final error;
  AlbumListError({@required this.error});
}
