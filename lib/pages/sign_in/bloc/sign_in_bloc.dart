import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInStates> {
  SignInBloc() : super(const SignInStates()) {
    // can be done in either ways below
    // on<EmailEvent>((event, emit) {
    //   // here is the event handler
    //   emit(state.copyWith(email: event.email));
    // });

    // on<PasswordEvent>(
    //   (event, emit) {
    //     emit(state.copyWith(password: event.password));
    //   },
    // );

    // or this way after definding a method on it's own as shown below
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  //  handlers seperated from the on methos
  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    print('my email is ${event.email}');
    emit(state.copyWith(email: event.email));
  }

    void _passwordEvent(PasswordEvent event, Emitter<SignInStates> emit) {
      print('my email is ${event.password}');
    emit(state.copyWith(password: event.password));
  }
}
