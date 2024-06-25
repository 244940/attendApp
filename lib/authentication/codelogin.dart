import 'package:flutter/material.dart';
import 'package:app_2/authentication/register.dart';

class CodeLogin extends StatefulWidget {
  const CodeLogin({super.key});

  @override
  State<CodeLogin> createState() => _CodeLoginState();
}

class _CodeLoginState extends State<CodeLogin> {
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPhoneSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Get your login code',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            const Text("Select one of theses medthod"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPhoneSelected = true;
                    });
                  },
                  child: Text('Phone'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPhoneSelected
                        ? const Color.fromARGB(255, 134, 172, 190)
                        : Colors.white70,
                  ),
                ),
                SizedBox(width: 10), // Space between buttons
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPhoneSelected = false;
                    });
                  },
                  child: Text('E-mail'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPhoneSelected
                        ? Colors.white70
                        : const Color.fromARGB(255, 134, 172, 190),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (isPhoneSelected)
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 95, 145, 192).withOpacity(.2),
                ),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone),
                      border: InputBorder.none,
                      hintText: "Phone Number",
                    ),
                  ),
                ),
              )
            else
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 95, 145, 192).withOpacity(.2),
                ),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: "E-mail",
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * .8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 39, 67, 82),
              ),
              child: TextButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // send code medthod
                  }
                },
                child: const Text(
                  "Send Code",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Create new account "),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text("Sign Up here"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
