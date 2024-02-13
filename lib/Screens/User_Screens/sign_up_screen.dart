import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../DataModel/UserModel/user_model.dart';
import '../../Firebase/user_firebase.dart';
import '../../ViewModel/user_vm/user_sign_up_vm_imp.dart';

class SignUpForm extends StatelessWidget {
  final userDetailsViewModel = UserCreateAccountViewModelImp();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(height: 150, "assets/Logo.jpg"),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'First Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Last Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Phone Number'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password'),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (userCredential.user != null) {
                      // Create UserModel instance
                      UserModel userModel = UserModel(
                        userId: userCredential.user!.uid,
                        userFirstName: firstNameController.text,
                        userLastName: lastNameController.text,
                        phoneNumber: int.parse(phoneNumberController.text),
                        email: emailController.text,

                        dateOfBirth: 0,
                        registrationDate: DateTime.now().millisecondsSinceEpoch,
                      );

                      // Add user to Firebase
                      UserService().addUser(userModel);

                    } else {
                      print('User creation failed');
                    }
                  } catch (error) {
                    print('Error during sign up: $error');
                    if (error is FirebaseAuthException &&
                        error.code == 'email-already-in-use') {
                      Get.dialog(
                        AlertDialog(
                          title: Text('Error'),
                          content: Text('Email is already in use.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else if (error is FirebaseAuthException &&
                        error.code == 'weak-password') {
                      Get.dialog(
                        AlertDialog(
                          title: Text('Error'),
                          content: Text(
                              'Weak password. Must be more than 6 characters.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
