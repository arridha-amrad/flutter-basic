import 'package:try_flutter/models/abum_model.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbumList();
}
