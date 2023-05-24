import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final String context;

  const SignInController({required this.context});

  Future<void> handleSignIn(BuildContext context, String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        // BlocProvider.of<SignInBloc>(context).state;
        String emailAdress = state.email;
        String password = state.password;
        if (emailAdress.isEmpty) {
          // todo
        }
        if (password.isEmpty) {
          // todo
        }
        try  {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAdress,
            password: password,
          );
          // checks if user exists
          if (credential.user == null) {
            // todo
          }
          // checking if email is verrified
          if(!credential.user!.emailVerified) {
            //
          }

        var user = credential.user;
        if(user!=null) {
          // we got verrified user from firebase

        } else {
          // we got error verifying user from firebase
        }

        } catch (e) {}
      }
    } catch (e) {}
  }
}
