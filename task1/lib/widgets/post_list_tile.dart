import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/models/post_model.dart';
import 'package:task1/providers/post_provider.dart';
import 'package:task1/providers/user_provider.dart';

class PostListTile extends StatelessWidget {
  final PostModel postModel;
  const PostListTile({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostProvider postProvider =
        Provider.of<PostProvider>(context, listen: false);
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        "TITLE",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: postModel.userId == 1 ? Colors.red : Colors.black,
          fontWeight:
              postModel.userId == 1 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        postModel.body!,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontWeight:
              postModel.userId == 1 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
