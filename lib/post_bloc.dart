import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/data_service.dart';
import 'package:try_flutter/post_model.dart';

abstract class PostEvent {}

class LoadedPostEvent extends PostEvent {}

class PullToRefresh extends PostEvent {}

abstract class PostState {}

class LoadingPostState extends PostState {}

class LoadedPostState extends PostState {
  final List<Post> posts;
  LoadedPostState({required this.posts});
}

class FailedToLoadPostState extends PostState {
  final String error;
  FailedToLoadPostState({required this.error});
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(LoadingPostState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is LoadedPostEvent || event is PullToRefresh) {
      yield LoadingPostState();
      var posts = <Post>[];
      try {
        posts = await DataService.getPosts();
      } catch (e) {
        yield FailedToLoadPostState(error: 'Failed to load posts');
      }
      yield LoadedPostState(posts: posts);
    }
  }
}
