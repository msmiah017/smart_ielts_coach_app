import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_ielts_coach_app/auth/models/user.dart';
import 'package:smart_ielts_coach_app/auth/providers/auth_provider.dart';
import 'package:smart_ielts_coach_app/auth/screens/registration_screen.dart';
import 'package:smart_ielts_coach_app/home/screens/home_screen.dart';
import 'package:smart_ielts_coach_app/utils/custom_form_fields.dart';
import 'package:smart_ielts_coach_app/utils/global_utils.dart';

import '../../utils/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers for login
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final currentContext = context;
    return Scaffold(
      // #00000061
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.2,
                      width: width * 0.6,
                      child: Image.asset(
                        'assets/logo/sic_black_bg_inapp.PNG',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: SizedBox(
                        height: height * 0.07,
                        width: width * 0.8,
                        // context, 'Your email:', 'example@gamil.com', false, controller: _loginEmailController
                        child: CustomTextField(
                            context: context,
                            labelText: 'Your email: ',
                            hintText: 'example@gamil.com',
                            password: false,
                            controller: _loginEmailController),
                      ),
                    ),
                    buildErrorMessageWidget(
                        context,
                        "Please enter a valid email address.",
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
                            labelText: 'Password: ',
                            hintText: '123456',
                            password: true,
                            controller: _loginPasswordController),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildErrorMessageWidget(
                        context,
                        "Please enter both email and password.",
                        authProvider.isPassOrEmailEmpty,
                        width),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomSubmitButton(
                        context: context,
                        buttonText: 'login',
                        onPressed: () async {
                          if (!mounted) return;
                          if (_loginEmailController.text.isEmpty ||
                              _loginPasswordController.text.isEmpty) {
                            authProvider.setIsPassOrEmailEmpty(true);
                            // authProvider.setLoginErrorMessage(
                            //     "Please enter both email and password.");
                          } else {
                            if (!_loginEmailController.text.contains("@")) {
                              authProvider.setIsEmailInvalid(true);
                            } else {
                              authProvider.setIsEmailInvalid(false);
                              authProvider.setIsLoading(true);
                              // authProvider.setLoggedIn(true);
                              // authProvider.setShowLoadingPage(true);
                              final user = RegisteredUser(
                                  _loginEmailController.text,
                                  _loginPasswordController.text);

                              await authProvider.loginUser(user);

                              //_loginEmailController.text.contains("test@")
                              // This line is just for testing convenience
                              if (_loginEmailController.text.contains("test@") || (mounted && authProvider.loggedIn)) {
                                authProvider.setIsLoading(false);
                                Navigator.pushReplacement(
                                    currentContext,
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()));
                              }
                            }
                            authProvider.setIsPassOrEmailEmpty(false);
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Have\'nt got any account?',
                        style: bodyTextMedium(context, Theme.of(context).colorScheme.onBackground)),
                    CustomTextButton(
                        context: context,
                        buttonText: 'Register Now',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegistrationScreen()));
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    buildErrorMessageWidget(
                        context,
                        authProvider.loginErrorMessage,
                        !authProvider.loggedIn,
                        width),
                  ]),
              if (authProvider.isLoading)
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
            ],
          ),
        ),
      ),
    );
  }
}
