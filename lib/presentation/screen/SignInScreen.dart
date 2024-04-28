import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../../logic/cubit/SignInCubit.dart';
import '../../logic/cubit/state/SignInState.dart';
import '../routes/PageConstants.dart';
import '../widget/GlobalWidgets.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController mobileNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimension.fifteen),
        child: Form(
          key: formKey,
          child: Column(

            children: [
              TabTitles(translation(context).titleSignIn),
              TabDes(
                  translation(context).desSignIn),
              SizedBox(height: AllDimension.fifteen,),
              Row(
                children: [

                  Expanded(
                    child: BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        var cubit = SignInCubit.get(context);
                        return GestureDetector(
                          onTap: () {
                            // Dismiss the keyboard when tapping outside the TextFormField
                            FocusScope.of(context).unfocus();
                          },
                          child: BlocBuilder<SignInCubit, SignInState>(
                            builder: (context, state) {
                              var cubit = SignInCubit.get(context);
                              return defaultFormField(
                                  hint: translation(context).hintMobileNo,
                                  maxLenght: 10,
                                  controller: mobileNoController,
                                  type: TextInputType.number,
                                  suffix: cubit.verifyNo ? AllImages.tick : null,
                                  onValidate: (String? value) {
                                    if (value!.length < 10) {
                                      return translation(context).validNo;
                                    }
                                    return null;
                                  },
                                  onChanged: (String? value) {
                                    if (value!.length < 10) {
                                      context.read<SignInCubit>().verifyNumber(false);
                                    } else {
                                      context.read<SignInCubit>().verifyNumber(true);
                                    }
                                  }
                              );
                            },
                          ),
                        );


                      },
                    ),
                  ),

                ],
              ),


              SizedBox(height: AllDimension.ten,),

              defaultButton(context, translation(context).login, () {

                if (formKey.currentState!.validate()) {
                  final mobileNo = mobileNoController.text;
                  Navigator.pushNamed(context, PageConstants.otpScreen,arguments: mobileNo);
                }
              })

            ],
          ),
        ),
      ),
    );
  }
}

/*class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final TextEditingController mobileNoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimension.fifteen),
        child: Form(
          key: formKey,
          child: Column(

            children: [
              TabTitles(translation(context).titleSignIn),
              TabDes(
                  translation(context).desSignIn),
              SizedBox(height: AllDimension.fifteen,),
              Row(
                children: [

                  Expanded(
                    child: BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        var cubit = SignInCubit.get(context);
                        return GestureDetector(
                          onTap: () {
                            // Dismiss the keyboard when tapping outside the TextFormField
                            FocusScope.of(context).unfocus();
                          },
                          child: BlocBuilder<SignInCubit, SignInState>(
                            builder: (context, state) {
                              var cubit = SignInCubit.get(context);
                              return TextFormField(
                                maxLength: 10,
                                controller: mobileNoController,
                                keyboardType: TextInputType.number,
                                validator: (String? value) {
                                  if (value!.length < 10) {
                                    return 'Please check number';
                                  }
                                  return null;
                                },
                                onChanged: (String? value) {
                                  if (value!.length < 10) {
                                    context.read<SignInCubit>().verifyNumber(false);
                                  } else {
                                    context.read<SignInCubit>().verifyNumber(true);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: AllString.hintMobileNo,
                                  counterText: '',
                                  // suffix: cubit.verifyNo ? SvgPicture.asset(AllImages.tick) : null,
                                  hintStyle: TextStyle(
                                    color: AllColors.dotIndicatorColor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AllDimension.six),
                                    borderSide: BorderSide(
                                      color: AllColors.boderGreyColor,
                                      width: AllDimension.one,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AllDimension.six),
                                    borderSide: BorderSide(
                                      color: AllColors.accentColor,
                                      width: AllDimension.one,
                                    ),
                                  ),
                                  errorStyle: TextStyle(
                                    color: Colors.red, // Set the color for the error message text
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AllDimension.six),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: AllDimension.one,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(AllDimension.six),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                      width: AllDimension.one,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AllDimension.fifteen,
                                    vertical: AllDimension.ten,
                                  ),
                                ),
                              );
                            },
                          ),
                        );


                      },
                    ),
                  ),

                ],
              ),


              SizedBox(height: AllDimension.ten,),

              defaultButton(context, translation(context).login, () {
                final mobileNo = mobileNoController.text;
                Navigator.pushNamed(context, PageConstants.otpScreen,arguments: mobileNo);
                *//*if (formKey.currentState!.validate()) {
                  final mobileNo = mobileNoController.text;
                  Navigator.pushNamed(context, PageConstants.otpScreen,arguments: mobileNo);
                }*//*
              })

            ],
          ),
        ),
      ),
    );
  }
}*/
