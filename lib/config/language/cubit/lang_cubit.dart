import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/prefs.dart';
import 'lang_state.dart';

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
