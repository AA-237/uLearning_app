import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_bloc_event.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_event.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomePageStates>{
  HomePageBlocs():super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }

   void _homePageDots(HomePageDots events, Emitter<HomePageStates> emit) {
    emit(state.copyWith(index: events.index));
   }
}