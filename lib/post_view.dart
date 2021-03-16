import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/post_cubit.dart';
import 'package:try_flutter/post_model.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post View"),
        ),
        body: BlocBuilder<PostCubit, List<Post>>(
            builder: (BuildContext context, List<Post> posts) {
          if (posts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              child: ListTile(
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
              ),
            );
          });
        }));
  }
}
