import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          ListTile(
            title: Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Text(
              "Leanne Graham",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Text(
              "Bret",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Text(
              "demo ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              "Zipcode ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: Text(
              "99744-746548",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
