import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/models/post_model.dart';
import 'package:task1/models/user_model.dart';
import 'package:task1/providers/post_provider.dart';
import 'package:task1/providers/user_provider.dart';
import 'package:task1/widgets/post_list_tile.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  const HomeScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
        appBar: AppBar(
          title: const Text("Lorem Ipsum"),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(
                text: 'All Post',
              ),
              Tab(
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(controller: _tabController, children: [
          Consumer<PostProvider>(
            builder: (context, postProvider, child) {
              if (postProvider.isLoading == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (postProvider.posts.length > 0) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: postProvider.posts.length,
                    itemBuilder: (context, index) {
                      PostModel postModel = postProvider.posts[index];
                      return PostListTile(postModel: postModel);
                    },
                  );
                } else {
                  return Text("data not found");
                }
              }
            },
          ),
          Consumer<UserProvider>(builder: (context, userProvider, child) {
            UserModel userDetail =
                userProvider.fetchUserByUsername(widget.username);
            return Column(
              children: [
                ListTile(
                  title: const Text(
                    "Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Text(
                    userDetail.name.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(),
                ListTile(
                  title: const Text(
                    "Username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Text(
                    userDetail.username.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: const Text(
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  trailing: Text(
                    userDetail.email.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            );
          }),
        ]));
  }
}
