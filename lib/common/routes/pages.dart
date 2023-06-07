import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

import '../../pages/register/bloc/register_blocs.dart';
import '../../pages/register/register.dart';
import '../../pages/sign_in/bloc/sign_in_bloc.dart';
import '../../pages/sign_in/sign_in.dart';

// class that binds
class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBlocs()),
      ),
      // PageEntity(
      //   route: AppRoutes.INITIAL,
      //   page: const Welcome(),
      //   // bloc: BlocProvider(create: (_) => WelcomeBloc()),
      // )
    ];
  }

  // function used in seperating the bloc from the rest
  // and return all blocProviders
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    // looping to get the blocs from te routes method
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // adds a modal that covers the whole screen as we click on the navigator object
  static MaterialPageRoute GenerateRoutesSettings(RouteSettings settings) {
    if (settings.name != null) {
      // checking for routes name matching when the navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print("valide route name ${settings.name}");
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    print("Invalide route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => const SignIn(), settings: settings);
  }
}

/// BINDING THE NAMES TO THE BLOC PROVIDER
/// UNIFY BLOCPROIDERS, ROUTES AND PAGES
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
