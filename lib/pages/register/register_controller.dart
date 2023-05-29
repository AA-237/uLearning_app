import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgtes/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
    }
    if (email.isEmpty) {
      toastInfo(msg: "User email can not be empty");
    }
    if (password.isEmpty) {
      toastInfo(msg: "User password can not be empty");
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Your password conformation is wrong");
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An email has been sent to $email, To activate it please check your email box and click on the link");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password provided is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "Email is already used");
      }  else if (e.code == "invalid-email") {
        toastInfo(msg: "Your email is invalide");
      }
    }
  }
}
