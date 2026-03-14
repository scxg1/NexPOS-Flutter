import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/data/hive_database.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static const String _langKey = 'app_language';

  LanguageBloc() : super(const LanguageState(locale: Locale('en'))) {
    on<LoadLanguageEvent>(_onLoad);
    on<ChangeLanguageEvent>(_onChange);
  }

  void _onLoad(LoadLanguageEvent event, Emitter<LanguageState> emit) {
    final saved = HiveDatabase.settingsBox.get(_langKey, defaultValue: 'en') as String;
    emit(LanguageState(locale: Locale(saved)));
  }

  Future<void> _onChange(ChangeLanguageEvent event, Emitter<LanguageState> emit) async {
    await HiveDatabase.settingsBox.put(_langKey, event.languageCode);
    emit(LanguageState(locale: Locale(event.languageCode)));
  }
}
