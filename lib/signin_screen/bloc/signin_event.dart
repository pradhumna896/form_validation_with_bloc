abstract class SigninEvent{}

class SigninTextChangedEvent extends SigninEvent{
  final String emailValue;
  final String passwordValue;
  SigninTextChangedEvent(this.emailValue, this.passwordValue);
}

class SigninSubmittedEvent extends SigninEvent{
  final String email;
  final String password;
  SigninSubmittedEvent(this.email,this.password);
  
}