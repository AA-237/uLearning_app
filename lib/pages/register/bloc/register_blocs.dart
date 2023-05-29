import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/register/bloc/register_events.dart';
import 'package:ulearning_app/pages/register/bloc/register_state.dart';

class RegisterBlocs extends Bloc<RegisterEvents, RegisterState> {
  RegisterBlocs() : super(const RegisterState()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    print(event.userName);
    emit(state.copyWith(userName:event.userName));
  }

   void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    print(event.email);
    emit(state.copyWith(email:event.email));
  }

   void _passwordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    print(event.password);
    emit(state.copyWith(password:event.password));
  }

   void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    print(event.rePassword);
    emit(state.copyWith(rePassword:event.rePassword));
  }
}


// deepper understanding in bloc, dart and copyWith method

