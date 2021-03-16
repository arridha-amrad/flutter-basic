import 'package:flutter/material.dart';
import 'package:try_flutter/post_model.dart';

class PostDetailsView extends StatelessWidget {
  final Post post;
  PostDetailsView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(post.id.toString()),
            Text(post.userId.toString()),
            Text(post.title),
            Text(post.body)
          ],
        ),
      ),
    );
  }
}
