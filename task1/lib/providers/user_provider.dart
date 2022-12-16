import 'package:flutter/cupertino.dart';
import 'package:task1/models/user_model.dart';
import 'package:task1/services/api.dart';

class UserProvider with ChangeNotifier {
  bool isLoading = true;

  List<UserModel> users = [];

  UserProvider() {
    fetchUserData();
  }

  Future fetchUserData() async {
    List<dynamic> _users = await API.getUsers();

    List<UserModel> temp = [];

    for (var user in _users) {
      UserModel newUser = UserModel.fromJson(user);

      temp.add(newUser);
    }
    users = temp;
    isLoading = false;
    notifyListeners();
  }

  UserModel fetchUserByUsername(String username) {
    UserModel user =
        users.where((element) => element.username == username).toList()[0];

    return user;
  }
}
