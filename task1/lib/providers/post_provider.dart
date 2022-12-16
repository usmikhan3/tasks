import 'package:flutter/cupertino.dart';
import 'package:task1/models/post_model.dart';
import 'package:task1/models/user_model.dart';
import 'package:task1/services/api.dart';

class PostProvider with ChangeNotifier {
  bool isLoading = true;
  List<PostModel> posts = [];
  List<UserModel> users = [];

  PostProvider() {
    fetchPostData();
  }

  Future<void> fetchPostData() async {
    List<dynamic> _posts = await API.getPosts();

    List<PostModel> temp = [];

    for (var post in _posts) {
      PostModel newPost = PostModel.fromJson(post);

      temp.add(newPost);
    }
    posts = temp;
    isLoading = false;
    notifyListeners();
  }
}
