
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vencat/Firebase/user_firebase.dart';
import 'package:vencat/Screens/User_Screens/phone_verification_screen.dart';
import 'package:vencat/Screens/User_Screens/sign_up_screen.dart';

import '../../StateController/user_state_controller.dart';

class LoginScreentut extends StatefulWidget {
  const LoginScreentut({super.key});

  @override
  State<LoginScreentut> createState() => _LoginScreentutState();
}

class _LoginScreentutState extends State<LoginScreentut> {

  Locale dropdownvaleloc = Locale("en", "US");
  String dropdownValue = 'English';
  Locale localeset = Locale("en", "US");
  List<Locale> languages = <Locale>[Locale("en", "US"), Locale("es", "ES")];
  List<String> items = <String>[
    'English',
    'Spanish',
  ];

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final UserService userService = UserService();
  String? temp;
  String? n;
  PhoneNumber number = PhoneNumber(isoCode: 'US');

  final UserStateController userStateController =  Get.put(UserStateController());

  @override
  Widget build(BuildContext context) {
    final languageController = Rx<Locale>(context.locale);

    return Builder(builder: (context) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset("assets/images/mainpagebackground.png"),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 22.0,
                      ),
                      Center(
                        child: Text(
                          "Welcome",
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFFFF6222),
                              fontWeight: FontWeight.w600),
                        ).tr(),
                      ),
                      Center(
                        child: Text(
                          "to labor ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFF6222),
                          ),
                        ),
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
                      const SizedBox(
                        height: 24,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: DropdownButton<Locale>(
                            onChanged: (Locale? newValue) {
                              setState(() {
                                localeset = newValue!;
                                languageController.value = localeset;
                                Get.updateLocale(localeset);
                                context.setLocale(localeset);
                                Get.to(() => LoginScreentut());
                              });
                            },
                            value: localeset,
                            items: languages.map<DropdownMenuItem<Locale>>(
                                  (Locale value) {
                                return DropdownMenuItem<Locale>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: RawMaterialButton(
                            onPressed: () async {

                              bool numberExists = await userService
                                  .checkIfPhoneExists(phoneController.text);

                              if (numberExists) {

                                Get.put(userStateController.userInitState.value.phoneNumber=phoneController.text);

                                Get.to(
                                      () => PinCodeVerificationScreen(
                                    phoneNumber: n,
                                    phonenumbertext: phoneController.text,
                                  ),
                                );
                              } else {
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text('Error'),
                                    content:
                                    const Text('Phone is not registered.'),
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
                              }
                            },
                            fillColor: Color(0xFF2B3454),
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Color(0xFFFF6222),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ).tr(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: RawMaterialButton(
                            onPressed: () {
                              Get.to(()=>SignUpForm());
                            },
                            fillColor: Color(0xFFF2F2F2),
                            elevation: 0.0,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Color(0xFFFF6222),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ).tr(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
