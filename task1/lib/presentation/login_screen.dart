import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/models/user_model.dart';
import 'package:task1/providers/post_provider.dart';
import 'package:task1/providers/user_provider.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  navigateToHome(BuildContext context) {}
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<UserProvider>(
        builder: (context, userProvier, child) {
          UserModel userModel = userProvier.users[0];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/splash.jpeg",
                  height: 200,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Username",
                          fillColor: Colors.black12.withOpacity(0.04),
                          border: InputBorder.none,
                          filled: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                          fillColor: Colors.black12.withOpacity(0.04),
                          border: InputBorder.none,
                          filled: true,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility),
                            onPressed: () {},
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.all(15),
                        color: Colors.red,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          SnackBar snackBar1 = const SnackBar(
                            content: Text(
                                "Username/Password doesnot match\nuse Bret as username and password "),
                          );

                          SnackBar snackBar2 = const SnackBar(
                            content: Text("Please fill all the fields"),
                          );
                          if (usernameController.text !=
                              passwordController.text) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar1);
                          } else if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar2);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                          username: userModel.username!,
                                        )));
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
