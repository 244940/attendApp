import 'package:app_2/SQLite/sqlite.dart';
import 'package:app_2/authentication/login.dart';
import 'package:flutter/material.dart';

import '../JsonModels/users.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final email = TextEditingController();

  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text("สร้างบัญชีใหม่",
                        style: TextStyle(
                            fontSize: 38, fontWeight: FontWeight.bold)),
                  ),
                  //username
                  SizedBox(height: 70),
                  const Text(
                      "กรอกชื่อ-นามสกุลเป็นภาษาอังกฤษ เช่น PiyawanSaiwandee"),
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
                            return "กรุณากรอกชื่อให้เรียบร้อย";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: "ชื่อ-สกุล"),
                      )),
                  //email
                  Container(
                      margin: EdgeInsets.all(8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 95, 145, 192)
                              .withOpacity(.2)),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "กรุณากรอกอีเมลให้เรียบร้อย";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            border: InputBorder.none,
                            hintText: "E-mail"),
                      )),

                  //phone number
                  Container(
                      margin: EdgeInsets.all(8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 95, 145, 192)
                              .withOpacity(.2)),
                      child: TextFormField(
                        controller: phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "กรุณากรอกเบอร์โทรศัพท์มือถือให้เรียบร้อย";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.phone),
                            border: InputBorder.none,
                            hintText: "เบอร์โทรศัพท์มือถือ"),
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
                            return "กรุณากรอกรหัสผ่านให้เรียบร้อย";
                          }
                          if (value.length < 8) {
                            return 'รหัสผ่านจำเป็นต้องมี 8 ตัวอักษรขึ้นไป';
                          }
                          if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'รหัสผ่านจำเป็นต้องมีตัวเลขอย่างน้อยหนึ่งตัว';
                          }
                          return null;
                        },
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: "รหัสผ่าน",
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

                  //password confirm
                  Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromARGB(255, 95, 145, 192)
                              .withOpacity(.2)),
                      child: TextFormField(
                        controller: confirmpassword,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "กรุณากรอกรหัสผ่านให้เรียบร้อย";
                          } else if (value.length < 8) {
                            return 'รหัสผ่านจำเป็นต้องมี 8 ตัวอักษรขึ้นไป';
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return 'รหัสผ่านจำเป็นต้องมีตัวเลขอย่างน้อยหนึ่งตัว';
                          } else if (password.text != confirmpassword.text) {
                            return 'รหัสผ่านไม่ตรงกัน';
                          }
                          return null;
                        },
                        obscureText: !isVisible,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: "ยืนยันรหัสผ่าน",
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

                  const SizedBox(height: 10),

                  //sign button
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
                            //go to loginpage when complete create account
                            final db = DatabaseHelper();
                            db
                                .signup(Users(
                                    userName: username.text,
                                    userPassword: password.text))
                                .whenComplete(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            });
                          }
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  // login button if already have account
                  Row(
                    children: [
                      const Text("มีบัญชีอยู่แล้ว"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text("Login"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
