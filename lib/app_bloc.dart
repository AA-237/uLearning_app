import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:ulearning_app/app_events.dart';
import 'package:ulearning_app/app_state.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(IniStates()){
    // increment
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter+1));
    });
    // decrement 
     on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter-1));
    });
  }
}