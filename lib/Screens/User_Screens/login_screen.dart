import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vencat/Screens/User_Screens/sign_up_screen.dart';


class LoginScreentut extends StatefulWidget {
  const LoginScreentut({Key? key}) : super(key: key);

  @override
  State<LoginScreentut> createState() => _LoginScreentutState();
}

class _LoginScreentutState extends State<LoginScreentut> {

  static Future<User?> loginUsingEmailAndPassword(
      {required String email,
        required String password,
        required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        _showUserNotFoundAlert(context); // Show user not found alert
      } else if (e.code == "wrong-password") {
        _showPasswordIncorrectAlert(context); // Show password incorrect alert
      }
    }
    return user;
  }

  static void _showUserNotFoundAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text('No user found for that email.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void _showPasswordIncorrectAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Login Failed'),
          content: Text('The password you entered is incorrect.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Labor Shortage"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/Logo.jpg"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 44.0,
                ),
                TextField(
                  controller: emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "user Email",
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                TextField(
                  controller: passwordTextController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "User Password",
                    prefixIcon: Icon(
                      Icons.security,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "  don't Remember your Password ?",
                  style: TextStyle(color: Colors.blue),
                ),
                const SizedBox(
                  height: 88,
                ),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () async {
                      User? user = await loginUsingEmailAndPassword(
                          email: emailTextController.text,
                          password: passwordTextController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                      }
                    },
                    fillColor: Colors.cyan,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    onPressed: () {
                      Get.to(() => SignUpForm());
                    },
                    fillColor: Colors.cyan,
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
