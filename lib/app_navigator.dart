import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:try_flutter/nav_cubit.dart';
import 'package:try_flutter/post_details_view.dart';
import 'package:try_flutter/post_model.dart';
import 'package:try_flutter/post_view.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post?>(
      builder: (context, post) {
        return Navigator(
            pages: [
              MaterialPage(child: PostView()),
              if (post != null) MaterialPage(child: PostDetailsView(post: post))
            ],
            onPopPage: (route, result) {
              context.read<NavCubit>().popToPost();
              return route.didPop(result);
            });
      },
    );
  }
}
