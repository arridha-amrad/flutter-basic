import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/nav_cubit.dart';
import 'package:try_flutter/post_bloc.dart';

class PostView extends StatefulWidget {
  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    // BlocProvider.of<PostBloc>(context).add(LoadedPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post View"),
        ),
        body: BlocBuilder<PostBloc, PostState>(
            builder: (BuildContext context, PostState state) {
          if (state is LoadingPostState) {
            return Center(child: Text('loading 🧨'));
          } else if (state is LoadedPostState) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<PostBloc>().add(LoadedPostEvent()),
              child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2.0,
                      child: ListTile(
                        onTap: () => context
                            .read<NavCubit>()
                            .showPostDetails(state.posts[index]),
                        title: Text(state.posts[index].title),
                        subtitle: Text(state.posts[index].body),
                      ),
                    );
                  }),
            );
          } else if (state is FailedToLoadPostState) {
            return Text('Error occured, ${state.error}');
          }
          return Container();
        }));
  }
}
