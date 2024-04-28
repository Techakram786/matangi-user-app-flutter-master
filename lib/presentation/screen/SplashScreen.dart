import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllImages.dart';
import '../../logic/cubit/InternetCubit.dart';
import '../routes/AppRoutes.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4), () {
      // Navigate to the next screen using Navigator
      Navigator.pushReplacementNamed(context,PageConstants.languageScreen);
    });
    return  Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(AllImages.logo),
      ),
    );
  }
}


