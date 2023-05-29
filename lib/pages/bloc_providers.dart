import 'package:flutter_bloc/flutter_bloc.dart';

// import '../app_bloc.dart';
import 'register/bloc/register_blocs.dart';
import 'sign_in/bloc/sign_in_bloc.dart';
import 'welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        // BlocProvider(
        //     // lazy: false means the screen/ bloc  should be loaded as soon as possible
        //     // plus it is very memory efficient
        //     create: (context) => AppBlocs()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBlocs())
      ];
}
