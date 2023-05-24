class SignInStates {
  final String email;
  final String password;

  const SignInStates({
    this.email = "",
    this.password = "",
  });

  // a method that copy what is entered from the ui and change it
  SignInStates copyWith({
    String? email,
    String? password,
  }) {
    return SignInStates(
      // checks if value is empty else passes this.email
      email: email??this.email,
      password: password??this.password,
    );
  }
}
