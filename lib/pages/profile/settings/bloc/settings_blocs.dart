import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/setting_states.dart';
import 'package:ulearning_app/pages/profile/settings/bloc/settings_events.dart';

class SettingsBloc extends Bloc<SettingEvents, SettingStates>{
  SettingsBloc():super(const SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  _triggerSettings(SettingEvents events, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}