import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_ielts_coach_app/auth/models/user.dart';
import 'package:smart_ielts_coach_app/auth/screens/login_screen.dart';
import 'package:smart_ielts_coach_app/main.dart';
import 'package:smart_ielts_coach_app/utils/custom_form_fields.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

import '../../utils/custom_widgets.dart';
import '../providers/auth_provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // AccountType _selectedRole = AccountType.candidate; // Default selection

  TextEditingController registerAccountNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registration',
          style: bodyTextLarge(context, Theme.of(context).colorScheme.onBackground),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  child: DropdownButton<AccountType>(
                    value: authProvider.selectedRole,
                    underline: Container(),
                    isExpanded: true,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontFamily: 'Kameron',
                    ),
                    onChanged: (AccountType? newValue) {
                      authProvider.setSelectedRole(newValue!);
                    },
                    items: AccountType.values.map((AccountType value) {
                      return DropdownMenuItem<AccountType>(
                        value: value,
                        child: Text(
                            value.toString().toUpperCase().split('.').last),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                      height: height * 0.07,
                      width: width * 0.8,
                      child: CustomTextField(
                        context: context,
                        labelText: "Account Name: ",
                        hintText: "Mohammad Hasan",
                        password: false,
                        controller: registerAccountNameController,
                      )),
                ),
                buildErrorMessageWidget(context, "Account name is required.",
                    authProvider.nullAccountName, width),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                      height: height * 0.07,
                      width: width * 0.8,
                      child: CustomTextField(
                        context: context,
                        labelText: "Your Email: ",
                        hintText: "example@gamil.com",
                        password: false,
                        controller: registerEmailController,
                        onChanged: (newEmail) {
                          authProvider.setEmail(newEmail);
                        },
                      )),
                ),
                buildErrorMessageWidget(
                    context,
                    authProvider.invalidEmailErrorMessage,
                    authProvider.isEmailInvalid,
                    width),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                      height: height * 0.07,
                      width: width * 0.8,
                      child: CustomTextField(
                        context: context,
                        labelText: "Password: ",
                        hintText: "Abc1234&",
                        password: true,
                        controller: registerPasswordController,
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: height * 0.07,
                    width: width * 0.8,
                    child: CustomTextField(
                      context: context,
                      labelText: "Confirm Password: ",
                      hintText: "Abc1234&",
                      password: true,
                      controller: registerConfirmPasswordController,
                      onChanged: (newPass) {
                        authProvider.setPassword(newPass);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                buildErrorMessageWidget(
                    context,
                    authProvider.errorPasswordMessage,
                    !authProvider.arePasswordsIdentical,
                    width),
                const SizedBox(
                  height: 30,
                ),
                CustomSubmitButton(
                    context: context,
                    buttonText: 'Register',
                    onPressed: () async {
                      if (registerAccountNameController.text.isEmpty) {
                        authProvider.setNullAccountName(true);
                      } else {
                        authProvider.setNullAccountName(false);
                        if (registerEmailController.text.isEmpty ||
                            !registerEmailController.text.contains("@")) {
                          authProvider.setIsEmailInvalid(true);
                        } else {
                          authProvider.setIsEmailInvalid(false);
                          if (registerPasswordController.text !=
                              registerConfirmPasswordController.text) {
                            authProvider.setArePasswordsIdentical(false);
                            authProvider.setErrorPassMessage(
                                'Passwords are not matching.');
                          } else {
                            if (registerPasswordController.text.length < 6) {
                              authProvider.setArePasswordsIdentical(false);
                              authProvider.setErrorPassMessage(
                                  'Password is too short. Please enter a password between 6-14 characters.');
                            } else if (registerPasswordController.text.length >
                                14) {
                              authProvider.setArePasswordsIdentical(false);
                              authProvider.setErrorPassMessage(
                                  'Password is too long. Please enter a password between 6-14 characters.');
                            } else {
                              authProvider.setArePasswordsIdentical(true);
                              User newUser = User(
                                  authProvider.selectedRole,
                                  registerAccountNameController.text,
                                  registerEmailController.text,
                                  registerConfirmPasswordController.text);

                              authProvider.setRegistrationIsLoading(true);
                              await authProvider.registerNewUser(newUser);
                              authProvider.setRegistrationIsLoading(false);
                              if (mounted && authProvider.userAdded) {
                                Fluttertoast.showToast(
                                    msg: "Successfully Registered.",
                                    toastLength: Toast.LENGTH_LONG,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    textColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary);
                                authProvider.setUserAddedState(true);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              }
                            }
                          }
                        }
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Already registered?',
                  style: bodyTextMedium(context, Theme.of(context).colorScheme.onBackground),
                ),
                // textBtn(context, 'Login Instead')
                CustomTextButton(
                    context: context,
                    buttonText: 'Login Instead',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    }),
                const SizedBox(
                  height: 10,
                ),
                buildErrorMessageWidget(
                    context,
                    authProvider.registrationMessage,
                    !authProvider.userAdded,
                    width),
              ],
            ),
            if (authProvider.isRegistrationLoading)
              Container(
                height: height,
                width: width,
                color: const Color(0x5A008080),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.secondary,
                  backgroundColor: Colors.red,
                )),
              ),
          ]),
        ),
      ),
    );
  }
}
