import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/LanguageState.dart';


import '../../CustomClass/AllImages.dart';
import '../../data/Model/LanguageModel.dart';

class LanguageCubit extends Cubit<LanguageState> {
  List<LanguageModel> languageList = [];
  LanguageModel? selectedLanguage;

  LanguageCubit() : super(LangInitialState()) {
    languageList = languageData();

    if (languageList.isNotEmpty) {
      emit(LangSuccessState(languageList));
    }
  }

  void toggleLanguageSelection(LanguageModel languageModel) {
    if (selectedLanguage != null) {
      selectedLanguage!.isSelected =
          false; // Reset the previously selected item
    }
    languageModel.isSelected = true; // Set the new item as selected
    selectedLanguage = languageModel; // Update the selectedLanguage reference
    emit(LangSuccessState(languageList)); // Emit updated state
  }
}

List<LanguageModel> languageData() {
  return [
    LanguageModel(
        name: 'English',
        flagImg: AllImages.flagEnglish,
        defaultColor: 0xffFFEBEE,
        selectedColor: 0xffE57373,
        isSelected: false,
        langCode: 'en'),
    LanguageModel(
        name: 'Hindi',
        flagImg: AllImages.flagHindi,
        defaultColor: 0xffEDE7F6,
        selectedColor: 0xff9575CD,
        isSelected: false,
        langCode: 'hi'),
    LanguageModel(
        name: 'Telugu',
        flagImg: AllImages.flagTelugu,
        defaultColor: 0xffE1F5FE,
        selectedColor: 0xff4FC3F7,
        isSelected: false,
        langCode: 'te'),
    LanguageModel(
        name: 'Tamil',
        flagImg: AllImages.flagTamil,
        defaultColor: 0xffE8F5E9,
        selectedColor: 0xff81C784,
        isSelected: false,
        langCode: 'ta')
  ];
}
