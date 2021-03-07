import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:try_flutter/models/abum_model.dart';
import 'package:try_flutter/repository/album_repo.dart';

class AlbumService extends AlbumRepository {
  static const _baseURL = "jsonplaceholder.typicode.com";

  static const String _GET_ALBUMS = "/albums";

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.https(_baseURL, _GET_ALBUMS);
    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
