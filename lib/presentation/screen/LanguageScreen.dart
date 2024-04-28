import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/main.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../../data/Model/LanguageModel.dart';
import '../../logic/cubit/LanguageCubit.dart';
import '../../logic/cubit/state/LanguageState.dart';
import '../routes/PageConstants.dart';
import '../widget/GlobalWidgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({Key? key}) : super(key: key);
  String? langCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AllDimension.twenty),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: AllDimension.sixty, left: AllDimension.four),
                alignment: Alignment.topLeft,
                child: Text(
                  translation(context).selectLang,
                  style: TextStyle(
                    fontSize: AllDimension.twentyTwo,
                    fontFamily: AllString.fontLato,
                    fontWeight: FontWeight.w700,
                    color: AllColors.blackColor,
                    shadows: [
                      Shadow(
                        color: Colors.black, // Shadow color
                        offset: Offset(AllDimension.zero, AllDimension.two), // Shadow offset
                        blurRadius: AllDimension.two, // Shadow blur radius
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AllDimension.twenty),
              BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, state) {
                  if (state is LangSuccessState) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return itemLanguage(context, state.languageList[index]);
                      },
                      itemCount: state.languageList.length,
                      padding: EdgeInsets.zero,
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(height: AllDimension.twenty),
              Container(
                margin: EdgeInsets.only(left: AllDimension.four, right: AllDimension.four),
                child: defaultButton(context, translation(context).titContinue, () async {
                  if(langCode!=null){
                    Locale _locale = await setLocale(langCode!);
                    MyApp.setLocale(context, _locale);
                    Navigator.pushNamed(context, PageConstants.boardingScreen);
                  }else{
                    final snackBar= defaultSnackBar(title: translation(context).language, msg:translation(context).langMsg);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }

                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget itemLanguage(BuildContext context, LanguageModel languageModel) {
    return GestureDetector(
      onTap: () {
        context.read<LanguageCubit>().toggleLanguageSelection(languageModel);
        langCode=languageModel.langCode.toString();
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AllDimension.six),
            // Set the desired border radius
          ),
          elevation: AllDimension.four,
          color: Color(languageModel.defaultColor!.toInt()),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(AllDimension.six)),
              border: Border.all(
                color: Color(languageModel.selectedColor!.toInt()),
                width: 0.5,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(AllDimension.sixteen),
              child: Row(
                children: [
                  Container(
                    width: AllDimension.eighteen, // Size of the inner circle
                    height: AllDimension.eighteen,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: languageModel.isSelected as bool
                              ? Color(languageModel.defaultColor!.toInt())
                              : Color(languageModel.selectedColor!.toInt()),
                          width: AllDimension.one),
                      shape: BoxShape.circle,
                      color: languageModel.isSelected as bool
                          ? Color(languageModel.selectedColor!.toInt())
                          : Colors.transparent, // Color for the active state
                    ),
                  ),
                  SizedBox(
                    width: AllDimension.five,
                  ),
                  Text(
                    languageModel.name.toString(),
                    style: TextStyle(
                      fontSize: AllDimension.twentyTwo,
                      fontFamily: AllString.fontLato,
                      fontWeight: FontWeight.w700,
                      color: Color(languageModel.selectedColor!.toInt()),
                    ),
                  ),
                  Spacer(),
                  Image.asset(languageModel.flagImg.toString())
                ],
              ),
            ),
          )),
    );
  }
}


