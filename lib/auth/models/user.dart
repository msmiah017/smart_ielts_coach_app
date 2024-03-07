class User {
  AccountType accountType;
  String accountName;
  String email;
  String password;
  User(this.accountType, this.accountName, this.email, this.password);
}
class RegisteredUser{
  String email;
  String password;
  RegisteredUser(this.email, this.password);
}

enum AccountType{
  candidate,
  tester
}