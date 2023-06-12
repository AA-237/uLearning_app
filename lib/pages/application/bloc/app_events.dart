abstract class AppEvent {
  const AppEvent();
}

class TriggerAppEvent extends AppEvent{
  final int index; // we declear this variable here because we want to be able to grap the value
  const TriggerAppEvent(this.index):super();
}