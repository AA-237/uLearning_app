class RegisterState {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  // optional named parameter
  const RegisterState({
     this.userName = "",
     this.email = "",
     this.password = "",
     this.rePassword = "",
  });

  // copyWith does not mutate the original object but
  // returns a new object with same properties as the original object
  // but with the value you specify
  RegisterState copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    // ?? which means if a value exists use it other wise use another as shown below
    return RegisterState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
// making the state immutable by passing assigning the fields to final
// the why because we want the value to change using your permission
// immutable => thread safe
