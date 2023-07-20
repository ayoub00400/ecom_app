import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/prefs.dart';
import 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  String appLang = 'en';
  LangCubit() : super(LangInitial());
  initLanguage() {
    appLang = Prefs.getString(SPKeys.language) ?? appLang;
  }

  changeLang(String langCode) async {
    appLang = langCode;
    await Prefs.setString(SPKeys.language, langCode);
    emit(LangChanged());
  }
}
