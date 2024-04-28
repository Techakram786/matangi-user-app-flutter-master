import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../../logic/cubit/OtpCubit.dart';
import '../../logic/cubit/state/OtpState.dart';
import '../routes/PageConstants.dart';
import '../widget/GlobalWidgets.dart';


class OtpScreen extends StatefulWidget {
  final String? myMobileNo;
  const OtpScreen({Key? key,required this.myMobileNo}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
   String? myMobileNo;
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());


  @override
  void initState() {
    myMobileNo=widget.myMobileNo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: backButton(context)
      ),
      body: Padding(
        padding:  EdgeInsets.all(AllDimension.fifteen),
        child: Column(
          children: [
            TabTitles( translation(context).titleOtp),

            Container(
              alignment: Alignment.topLeft,
              child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text:  translation(context).desOtp,
                            style: TextStyle(
                              fontSize: AllDimension.twelve,
                              color: AllColors.textGreyColor,fontWeight: FontWeight.w400,
                            )
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                            text:  translation(context).countryCode,
                            style: TextStyle(
                              fontSize: AllDimension.twelve,
                              color: AllColors.accentColor,fontWeight: FontWeight.w400,
                            )
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                            text: myMobileNo,
                            style: TextStyle(
                              fontSize: AllDimension.twelve,
                              color: AllColors.accentColor,fontWeight: FontWeight.w400,
                            )
                        ),
                      ]
                  )
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                defaultOtpBox(
                    context: context,
                    controller: otpControllers[0],
                    onChanged: (value){
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    }),

                SizedBox(width: AllDimension.ten,),
                defaultOtpBox(
                    context: context,
                    controller: otpControllers[1],
                    onValidate: (String? value){
                      if(value!.length>0){
                        return null;
                      }else{
                        return 'Please enter validate otp';
                      }
                    },
                    onChanged: (value){
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    }),
                SizedBox(width: AllDimension.ten,),
                defaultOtpBox(
                    context: context,
                    controller: otpControllers[2],

                    onChanged: (value){
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      } else {
                        FocusScope.of(context).previousFocus();
                      }
                    }),
                SizedBox(width: AllDimension.ten,),
                defaultOtpBox(
                    context: context,
                    controller: otpControllers[3],
                    onChanged: (value){
                      if (value.length == 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    })
              ],
            ),

            SizedBox(height: 15,),
            defaultButton(context,  translation(context).verify, (){
              final myOtp=  otpControllers.map((controller) => controller.text).join();
              if(myOtp.length>3){

                Navigator.pushNamed(context, PageConstants.profileScreen);
              }else{
                final snackBar= defaultSnackBar(title:  translation(context).otpTitle, msg:  translation(context).otpMsgTitle);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

              }

            }),
            SizedBox(height: AllDimension.fifteen,),
            BlocBuilder<OtpCubit, OtpState>(
              builder: (context, state) {
                var timerValue=  state.seconds;
                return
                  GestureDetector(
                      onTap: (){
                        if(timerValue==0){
                          context.read<OtpCubit>().restartTimer();
                        }
                      },
                      child: Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(
                                    text: timerValue == 0 ? translation(context).resend :  translation(context).otpSendIn,
                                    style: TextStyle(
                                      fontSize: AllDimension.twelve,
                                      color: AllColors.blackColor,fontWeight: FontWeight.w500,
                                    )
                                ),
                                TextSpan(text: ' '),
                                TextSpan(
                                    text:  timerValue == 0 ?'':timerValue.toString(),
                                    style: TextStyle(
                                      fontSize: AllDimension.twelve,
                                      color: AllColors.accentColor,fontWeight: FontWeight.w500,
                                    )
                                ),
                              ]
                          )
                      )

                  );


              },
            ),
          ],
        ),
      ),
    );
  }
}

/*class OtpScreen extends StatelessWidget {
  final String? myMobileNo;
   OtpScreen({Key? key,required this.myMobileNo}) : super(key: key);
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: backButton(context)
      ),
      body: Padding(
    padding:  EdgeInsets.all(AllDimension.fifteen),
        child: Column(
          children: [
          TabTitles( translation(context).titleOtp),

            Container(
              alignment: Alignment.topLeft,
              child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:  translation(context).desOtp,
                        style: TextStyle(
                          fontSize: AllDimension.twelve,
                          color: AllColors.textGreyColor,fontWeight: FontWeight.w400,
                        )
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                          text:  translation(context).countryCode,
                          style: TextStyle(
                            fontSize: AllDimension.twelve,
                            color: AllColors.accentColor,fontWeight: FontWeight.w400,
                          )
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                          text: myMobileNo,
                          style: TextStyle(
                            fontSize: AllDimension.twelve,
                            color: AllColors.accentColor,fontWeight: FontWeight.w400,
                          )
                      ),
                    ]
                  )
              ),
            ),
            SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  defaultOtpBox(
                      context: context,
                      controller: otpControllers[0],
                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      }),

                  SizedBox(width: AllDimension.ten,),
                  defaultOtpBox(
                      context: context,
                      controller: otpControllers[1],
                      onValidate: (String? value){
                        if(value!.length>0){
                          return null;
                        }else{
                          return 'Please enter validate otp';
                        }
                      },
                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      }),
                  SizedBox(width: AllDimension.ten,),
                  defaultOtpBox(
                      context: context,
                      controller: otpControllers[2],

                      onChanged: (value){
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        } else {
                          FocusScope.of(context).previousFocus();
                        }
                      }),
                  SizedBox(width: AllDimension.ten,),
                  defaultOtpBox(
                      context: context,
                      controller: otpControllers[3],
                      onChanged: (value){
                        if (value.length == 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      })
                ],
              ),

            SizedBox(height: 15,),
          defaultButton(context,  translation(context).verify, (){
            final myOtp=  otpControllers.map((controller) => controller.text).join();
            if(myOtp.length>3){

              Navigator.pushNamed(context, PageConstants.profileScreen);
            }else{
             final snackBar= defaultSnackBar(title:  translation(context).otpTitle, msg:  translation(context).otpMsgTitle);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

            }

          }),
            SizedBox(height: AllDimension.fifteen,),
            BlocBuilder<OtpCubit, OtpState>(
              builder: (context, state) {
                var timerValue=  state.seconds;
                return
                  GestureDetector(
                    onTap: (){
                      if(timerValue==0){
                        context.read<OtpCubit>().restartTimer();
                      }
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: timerValue == 0 ? translation(context).resend :  translation(context).otpSendIn,
                              style: TextStyle(
                                fontSize: AllDimension.twelve,
                                color: AllColors.blackColor,fontWeight: FontWeight.w500,
                              )
                          ),
                          TextSpan(text: ' '),
                          TextSpan(
                              text:  timerValue == 0 ?'':timerValue.toString(),
                              style: TextStyle(
                                fontSize: AllDimension.twelve,
                                color: AllColors.accentColor,fontWeight: FontWeight.w500,
                              )
                          ),
                        ]
                      )
                    )

                  );


              },
            ),
          ],
        ),
      ),
    );
  }
}*/
