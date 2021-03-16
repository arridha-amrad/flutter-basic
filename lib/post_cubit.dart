import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/data_service.dart';
import 'package:try_flutter/post_model.dart';

class PostCubit extends Cubit<List<Post>> {
  PostCubit() : super([]);
  void getPosts() async => emit(await DataService.getPosts());
}
