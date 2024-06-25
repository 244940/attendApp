import 'package:app_2/SQLite/sqlite.dart';
import 'package:app_2/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:app_2/authentication/codelogin.dart';

import '../screen/homepage.dart';
//import '../JsonModels/note_model.dart';
import '../JsonModels/users.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Textediting controller
  final username = TextEditingController();
  final password = TextEditingController();

  //hide or show password
  bool isVisible = false;
  //login bool
  bool isLoginTrue = false;
  // database
  final db = DatabaseHelper();
  Login() async {
    var response = await db
        .login(Users(userName: username.text, userPassword: password.text));
    if (response == true) {
      //if login correct goto homepage
      if (!mounted) return;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      //show error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  //form global key
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "lib/assets/login.png",
                      width: 180,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //username
                    Container(
                        margin: EdgeInsets.all(8),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 95, 145, 192)
                                .withOpacity(.2)),
                        child: TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username is required";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              border: InputBorder.none,
                              hintText: "username"),
                        )),
                    //password
                    Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color.fromARGB(255, 95, 145, 192)
                                .withOpacity(.2)),
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                              icon: const Icon(Icons.lock),
                              border: InputBorder.none,
                              hintText: "password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    //toggle hide password
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  icon: Icon(isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                        )),

                    const SizedBox(
                      height: 10,
                    ),

                    //login button
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 39, 67, 82)),
                      child: TextButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              //login method
                              Login();
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),

                    // OR
                    const Center(child: Text("OR")),
                    //login with code button
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 74, 78, 80)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CodeLogin()));
                          },
                          child: const Text(
                            "Use Login Code",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),

                    // sign up button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Create new account "),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: const Text("Sign Up here"),
                        ),
                      ],
                    ),

                    isLoginTrue
                        ? const Text("Username or Password incorrect",
                            style: TextStyle(color: Colors.red))
                        : const SizedBox(),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
