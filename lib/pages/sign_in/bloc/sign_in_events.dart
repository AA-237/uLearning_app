abstract class SignInEvent{
  const SignInEvent();
}

class EmailEvent extends SignInEvent{
  final String email;

  EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent{
  final String password;
  PasswordEvent(this.password);
}

// absctract class enables us to extends other classes