import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/common/widgtes/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

import '../../global.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        // BlocProvider.of<SignInBloc>(context).state;
        String emailAdress = state.email;
        String password = state.password;
        if (emailAdress.isEmpty) {
          // todo
          toastInfo(msg: "You need to fill in email address");
          return;
        }
        if (password.isEmpty) {
          // todo
          toastInfo(msg: "You need to fill in password");
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAdress,
            password: password,
          );
          // checks if user exists
          if (credential.user == null) {
            // todo
            toastInfo(msg: "User don't exists");
            return;
          }
          // checking if email is verrified
          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: "You need to verify email account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            // we got verrified user from firebase
            print("user exist");
            Global.storageServices.setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
            Navigator.of(context).pushNamedAndRemoveUntil('/application', (route) => false);
          } else {
            // we got error verifying user from firebase
            toastInfo(msg: "Currently not a user of this app");
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            //
            print('no user found for that email');
            toastInfo(msg: "User not found with that email");
          } else if (e.code == 'wrong-password') {
            //
            print('wrong password provided for that user');
            toastInfo(msg: "wrong password provided for that user");
          } else if (e.code == "invalide-email") {
            //
            print('your email format is wrong');
            toastInfo(msg: "email address format is wrong");
          }
        }
      }
    } catch (e) {}
  }
}
