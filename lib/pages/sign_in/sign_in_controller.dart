import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

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
          print('email is empty');
}
        if (password.isEmpty) {
          // todo
          print("password is empty");
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
            print('user does not exist');
          }
          // checking if email is verrified
          if (!credential.user!.emailVerified) {
            //
            print('user not verified');
          }

          var user = credential.user;
          if (user != null) {
            // we got verrified user from firebase
            print("user exist");
          } else {
            // we got error verifying user from firebase
            print('no user');
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user not found") {
            //
            print('no user found for that email');
          } else if (e.code == 'wrong password') {
            //
            print('wrong password provided for that user');
          } else if (e.code == "invalide-email") {
            //
            print('your email format is wrong');
          }
        }
      }
    } catch (e) {}
  }
}
