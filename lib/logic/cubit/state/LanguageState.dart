

import '../../../data/Model/LanguageModel.dart';

abstract class LanguageState {
  const LanguageState();
}

class LangInitialState extends LanguageState {}
class LangSuccessState extends LanguageState {
  final List<LanguageModel> languageList;
  LangSuccessState(this.languageList);
}