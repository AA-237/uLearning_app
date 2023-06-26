import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/routes.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/pages/application/bloc/app_blocs.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';

import '../../../global.dart';
import 'bloc/setting_states.dart';
import 'bloc/settings_blocs.dart';
import 'widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // function that links both user data and route them to the signIn page
  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0)); // permits the user to land on the home page after he logging in
    Global.storageServices.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingStates>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [setttingButton(context, removeUserData)],
              ),
            );
          },
        ),
      ),
    );
  }
}
