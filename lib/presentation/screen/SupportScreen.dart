import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/CustomClass/AllString.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../widget/GlobalWidgets.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar:AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(AllString.txtSupport)]),
      ),
      body: Container(
        color: AllColors.whiteColor,
        padding: EdgeInsets.all(AllDimension.twelve),
        child: Column(
          children: [
            SizedBox(height: AllDimension.twenty,),
            Image(
                image: AssetImage(
              AllImages.supportBg,
            ),
              width: globalWidth,
              height: globalHeight!/2.5,
            ),
            Text(
                'Need More Help Get In Touch with Us!',
                maxLines: 1,
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  fontSize: AllDimension.sixteen,
                  color: AllColors.blackColor,
                  fontWeight: FontWeight.w700,
                )
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: AllDimension.twentyFive),
              child:  Text(
                  'Lorem ipsum dolor sit amet consectetur. Ac sit in mi interdum malesuada ante ',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: AllString.fontLato,
                    fontSize: AllDimension.fourteen,
                    color: AllColors.blackColor,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
            SizedBox(height: AllDimension.ten,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: globalWidth!/2.2,
                    padding: EdgeInsets.symmetric(vertical: AllDimension.fifteen),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AllDimension.six),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: AllDimension.twentyFive,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child:Center(
                  child: Column(

                    children: [
                      SvgPicture.asset(AllImages.call),
                      SizedBox(height: AllDimension.five,),
                      Text(
                        'Call Us',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          fontSize: AllDimension.fourteen,
                          color: AllColors.blackColor,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      Text(
                          '91 000 999 9999',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.fourteen,
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    ],
                  ),
                )
                ),
                Container(
                    width: globalWidth!/2.2,
                    padding: EdgeInsets.symmetric(vertical: AllDimension.fifteen),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AllDimension.six),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: AllDimension.twentyFive,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child:Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(AllImages.email),
                      SizedBox(height: AllDimension.five,),
                      Text(
                          'Email Us',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.fourteen,
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                      Text(
                          'support@matangi.com',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.fourteen,
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                    ],
                  ),
                )
                )
              ],
            ),
            SizedBox(height: AllDimension.ten,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, PageConstants.faqScreen);
              },
              child: customBoxContainer(() =>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      AllImages.faq),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                          'FAQ’s',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.fourteen,
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      Text(
                          'Discover app information',
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.ten,
                            color: AllColors.textGreyColor2,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset(AllImages.rightArrow)
                ],
              )
              ),
            )

          ],
        ),
      ),
    );
  }
}
