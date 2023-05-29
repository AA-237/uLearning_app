import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';
import 'bloc/register_blocs.dart';
import 'bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppBar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                      child: reusableText(
                          "Enter your details below && free sing up")),
                  Container(
                    margin: EdgeInsets.only(top: 50.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("User name"),
                        buildTextField("Enter your user name", 'name', 'user',
                            // method to get value and pass to required field (callback function )
                            (value) {
                          context.read<RegisterBlocs>().add(UserNameEvent(value));
                        }),
                        reusableText("Email"),
                        buildTextField(
                            "Enter your email address", 'email', 'user',
                            // method to get value and pass to required field (callback function )
                            (value) {
                           context.read<RegisterBlocs>().add(EmailEvent(value));
                        }),
                        reusableText("Password"),
                        buildTextField(
                            "Enter your password", 'password', 'lock', (value) {
                           context.read<RegisterBlocs>().add(PasswordEvent(value));
                        }),
                        reusableText("Confirm password"),
                        buildTextField(
                            "Confirm your password", 'password', 'lock',
                            (value) {
                           context.read<RegisterBlocs>().add(RePasswordEvent(value));
                        }),
                        Container(
                            margin: EdgeInsets.only(left: 25.w),
                            child: reusableText(
                                "By creating an account you have to agree to our terms and conditions")),
                        buildLogInAndRegBtn("Sign Up", "login", () {
                          // Navigator.of(context).pushNamed("register");
                          RegisterController(context:context).handleEmailRegister();
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
