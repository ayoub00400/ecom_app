import 'package:bloc/bloc.dart';
import 'package:ecom_app/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  String appLocal = 'en';
  LangCubit() : super(LangInitial());
  initLanguage() {
    appLocal = Prefs.getString(SPKeys.language) ?? appLocal;
  }

  changeLang(String langCode) async {
    appLocal = langCode;
    await Prefs.setString(SPKeys.language, langCode);
    emit(LangChanged());
  }
}
