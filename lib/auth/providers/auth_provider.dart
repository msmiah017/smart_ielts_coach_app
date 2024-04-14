import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_ielts_coach_app/auth/models/user.dart';
import 'package:smart_ielts_coach_app/auth/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  //++++++++++++++++++++++++++User Registration Codes++++++++++++++++++++++++++++++//
  //--------------------Codes related to state management-------------------------//
  String invalidEmailErrorMessage = "Please enter a valid email address.";

  bool _nullAccountName = false;
  bool get nullAccountName => _nullAccountName;
  void setNullAccountName(bool value) {
    _nullAccountName = value;
    notifyListeners();
  }

  bool _isEmailInvalid = false;
  bool get isEmailInvalid => _isEmailInvalid;
  void setIsEmailInvalid(bool value) {
    _isEmailInvalid = value;
    notifyListeners();
  }

  String _errorPasswordMessage = "Password too short or too long";
  String get errorPasswordMessage => _errorPasswordMessage;
  void setErrorPassMessage(newMessage) {
    _errorPasswordMessage = newMessage;
    notifyListeners();
  }

  bool _arePasswordsIdentical = true;
  bool get arePasswordsIdentical => _arePasswordsIdentical;
  void setArePasswordsIdentical(bool passState) {
    _arePasswordsIdentical = passState;
    notifyListeners();
  }

  AccountType _selectedRole = AccountType.candidate;
  AccountType get selectedRole => _selectedRole;
  void setSelectedRole(AccountType role) {
    _selectedRole = role;
    notifyListeners();
  }

  String? _accountName;
  String? get accountName => _accountName;
  void setAccountName(name) {
    _accountName = name;
    notifyListeners();
  }

  String? _email;
  String? get email => _email;
  void setEmail(emailId) {
    _email = emailId;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  void setPassword(newPass) {
    _email = newPass;
    notifyListeners();
  }

  bool _isRegistrationLoading = false;
  bool get isRegistrationLoading => _isRegistrationLoading;
  void setRegistrationIsLoading(bool value) {
    _isRegistrationLoading = value;
    notifyListeners();
  }
//  ---------------------------------------------------------------------//

  bool _userAdded = false;
  bool get userAdded => _userAdded;
  void setUserAddedState(bool value) {
    _userAdded = value;
    notifyListeners();
  }

  String _registrationMessage = "";
  String get registrationMessage => _registrationMessage;
  void setRegistrationMessage(String message) {
    _registrationMessage = message;
    notifyListeners();
  }

  // -------------API Codes End------------
  AuthService authService = AuthService();
  Future<void> registerNewUser(User newUser) async {
    final requestMessage = await authService.register(newUser);
    if (requestMessage == "success") {
      setUserAddedState(true);
      setRegistrationMessage("Successfully registered.");
    } else if (requestMessage == "existing_user") {
      setUserAddedState(false);
      setRegistrationMessage("The user already exists.");
    } else if (requestMessage == "failed") {
      setUserAddedState(false);
      setRegistrationMessage(
          "Unable to register with the provided information.");
    } else {
      setUserAddedState(false);
      setRegistrationMessage(
          "There is an issue with the server. Please try later.");
    }
    notifyListeners();
  }

  // -------------API Codes End------------

  //++++++++++++++++++++++++++User Registration Ends Here++++++++++++++++++++++++++++++//

//++++++++++++++++++++++++++User Login Codes Start++++++++++++++++++++++++++++++//

  bool _isPassOrEmailEmpty = false;
  bool get isPassOrEmailEmpty => _isPassOrEmailEmpty;
  void setIsPassOrEmailEmpty(bool value) {
    _isPassOrEmailEmpty = value;
    notifyListeners();
  }

  String _loginErrorMessage = "";
  String get loginErrorMessage => _loginErrorMessage;
  void setLoginErrorMessage(String message) {
    _loginErrorMessage = message;
    notifyListeners();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  void setLoggedIn(bool value) {
    _loggedIn = value;
    notifyListeners();
  }

  String _loginMessage = "";
  String get loginMessage => _loginMessage;
  void setLoginMessage(String value) {
    _loginMessage = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // void changeLoadingState(){
  //   setIsLoading(false);
  //   notifyListeners();
  // }

//++++++++++++++++++++++++++User Login Codes Ends Here++++++++++++++++++++++++++++++//

  //-----------------------Codes related to api request----------------------//


  Future<void> loginUser(RegisteredUser existingUser) async {
    final loginStatus = await authService.login(existingUser);
    if (loginStatus.isNotEmpty) {}
    if (loginStatus == "success") {
      setLoggedIn(true);
      setIsLoading(false);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
    } else if (loginStatus == "invalid") {
      setLoggedIn(false);
      setIsLoading(false);
      setLoginErrorMessage("Email and password are not matching.");
    } else if (loginStatus == "timeout") {
      setLoggedIn(false);
      setIsLoading(false);
      setLoginErrorMessage("Something went wrong. Please try later.1");
    } else {
      setLoggedIn(false);
      setIsLoading(false);
      setLoginMessage("Something went wrong. Please try later.2");
    }
  }
}
