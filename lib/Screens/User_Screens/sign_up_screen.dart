import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vencat/Screens/User_Screens/phone_verification_screen.dart';
import 'package:vencat/StateController/user_state_controller.dart';

import '../../DataModel/UserModel/user_model.dart';
import '../../Firebase/user_firebase.dart';
import '../../ViewModel/user_vm/user_sign_up_vm_imp.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  DateTime date = DateTime.now();

  final userDetailsViewModel = UserCreateAccountViewModelImp();
  final UserStateController userStateController =  Get.put(UserStateController());
  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final UserService userService = UserService();
  final _formKey =
      GlobalKey<FormState>(); // Step 2: Create GlobalKey<FormState>

  String? temp;
  String? n;
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: FaIcon(
                                FontAwesomeIcons.circleArrowLeft,
                                size: 40,
                                color: Color(0xFFFF6222),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 50,
                                  color: Color(0xFFFF6222),
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFFF6222),
                                fontWeight: FontWeight.w900),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Display Name',
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text("Date of Birth"),
                          TextButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1980),
                                  lastDate: DateTime(2025)).then((value) {
                                    setState(() {
                                      date = value!;
                                    });
                              });
                            },
                            child: Text("select date of birth"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: InternationalPhoneNumberInput(
                            hintText: "Phone Number",
                            textStyle: TextStyle(fontSize: 23),
                            onInputChanged: (PhoneNumber number) {
                              temp = number.dialCode;
                              print(number.phoneNumber);
                              n = number.phoneNumber;
                            },
                            onInputValidated: (bool value) {},
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            textAlign: TextAlign.start,
                            initialValue: number,
                            textFieldController: phoneController,
                            formatInput: false,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF2B3454)),
                        ),
                        onPressed: () async {
                          // Step 3: Validate form when button is pressed
                          if (_formKey.currentState!.validate()) {
                            // Form is validated, proceed with your logic
                            bool phoneExist = await userService
                                .checkIfPhoneExists(phoneController.text);

                            if (phoneExist) {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text('Error'),
                                  content:
                                      const Text('Phone is already in use.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              UserModel userModel = UserModel(
                                  phoneNumber: phoneController.text,
                                  userId: '',
                                  userDisplayName: firstNameController.text,
                                  dateOfBirth: date.millisecondsSinceEpoch,
                                  registrationDate: DateTime.now().millisecondsSinceEpoch);

                              userStateController.userInitState.value =
                                  userModel;

                              Get.to(() => PinCodeVerificationScreen(
                                  phoneNumber: n,
                                  phonenumbertext: phoneController.text));
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Verify',
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xFFFF6222),
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
