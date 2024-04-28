import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/CustomClass/AllString.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../widget/GlobalWidgets.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AllImages.success),
                Text(
                  AllString.txtSuccess,
                  maxLines: 1,
                  style: TextStyle(
                    color: AllColors.accentColor,
                    fontSize: AllDimension.thirtyEight,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text.rich(
                    textAlign:TextAlign.center,
                    TextSpan(
                        children: [
                          TextSpan(
                              text: 'Your order will be Delivered by',
                              style: TextStyle(
                                fontSize: AllDimension.fourteen,
                                color: AllColors.blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: '07 September 2023',
                            style: TextStyle(
                              fontSize: AllDimension.fourteen,
                              color: AllColors.accentColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: 'ORDER ID:',
                            style: TextStyle(
                              fontSize: AllDimension.fourteen,
                              color: AllColors.blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: '#3455222',
                            style: TextStyle(
                              fontSize: AllDimension.fourteen,
                              color: AllColors.blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ]
                    )
                ),
                SizedBox(height: AllDimension.ten,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, PageConstants.ordersScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AllColors.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          AllDimension.eleven),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: globalWidth!/17,
                        vertical: AllDimension.twelve),
                  ),
                  child: Text(
                    'View Order Status',
                    style: TextStyle(
                      fontFamily: AllString.fontLato,
                      color: Colors.white,
                      fontSize: AllDimension.fourteen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],

            ),
          ),
        ),

    );
  }
}
