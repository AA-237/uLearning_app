class AppStates {
  int counter;

   AppStates({
    required this.counter
  });
}

class IniStates extends AppStates{
  IniStates() : super(counter: -2);
}

// in bloc everything happens through states and events so here is the event class