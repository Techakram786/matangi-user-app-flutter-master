import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllColors.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/presentation/widget/GlobalWidgets.dart';

import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';

class ReferFriendScreen extends StatefulWidget {
  const ReferFriendScreen({Key? key}) : super(key: key);

  @override
  State<ReferFriendScreen> createState() => _ReferFriendScreenState();
}

class _ReferFriendScreenState extends State<ReferFriendScreen> {
  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:  AllColors.accentColor,
      appBar:AppBar(
        backgroundColor:Colors.transparent,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), Container(
                alignment: Alignment.topLeft,
                child: Text(AllString.txtRefer,
                  style: TextStyle(
                      fontSize: AllDimension.sixteen,
                      fontFamily: AllString.fontLato,
                      color: AllColors.whiteColor, fontWeight: FontWeight.w600
                  ),
                )
            )]),
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimension.twelve),
        child: Container(
          width: globalWidth,
          height: globalHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  AllImages.referBg,

              ),
              fit: BoxFit.cover, // You can choose the BoxFit that fits your needs
            ),
          ),
          child: Column(
            children: [
              Text(
                  'We Value your Friendship',
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: AllString.fontLato,
                    fontSize: AllDimension.twentyFour,
                    color: AllColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  )
              ),
              Text(
                  'At Exactly ₹ 400',
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: AllString.fontLato,
                    fontSize: AllDimension.twentyFour,
                    color: AllColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  )
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: AllDimension.thirty),
                child: Text(
                    'Lorem ipsum dolor sit amet consectetur. Ac sit in mi interdum malesuada ante in scelerisque. Odio mauris amet in sedmi interdum malesuada ante in scelerisque. ',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AllString.fontLato,
                      fontSize: AllDimension.ten,
                      color: AllColors.whiteColor,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ),
              SizedBox(height: AllDimension.twenty,),
              SvgPicture.asset(
                AllImages.refer,
                width: globalWidth,
                height: globalHeight!/2.8,
              ),
              SizedBox(height: AllDimension.ten,),
              Container(
                width: AllDimension.oneSeventyEight,
                height: AllDimension.sixtyFour,
                padding: EdgeInsets.all(AllDimension.one),
                decoration: BoxDecoration(
                  color: Color(0xff68BEA4),
                  borderRadius: BorderRadius.circular(AllDimension.ten),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: AllDimension.four,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: DottedBorder(
                  color: AllColors.accentColor,
                  strokeWidth: 2, //thickness of dash/dots
                  dashPattern: [8,6],
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'ABLCDF',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: AllString.fontLato,
                              fontSize: AllDimension.twentyFour,
                              color: AllColors.whiteColor,
                              fontWeight: FontWeight.w500,
                            )
                        ),
                        SizedBox(width: AllDimension.ten,),
                        SvgPicture.asset(
                          AllImages.copy,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: AllDimension.twenty,),
              Text(
                  'Share Referral Code Via',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AllString.fontLato,
                    fontSize: AllDimension.sixteen,
                    color: AllColors.whiteColor,
                    fontWeight: FontWeight.w500,
                  )
              ),
              SizedBox(height: AllDimension.ten,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AllImages.fb,
                  ),
                  SizedBox(width: AllDimension.twenty,),
                  SvgPicture.asset(
                    AllImages.whatsapp,
                  ),
                  SizedBox(width: AllDimension.twenty,),
                  SvgPicture.asset(
                    AllImages.instagram,
                  ),
                  SizedBox(width: AllDimension.twenty,),
                  SvgPicture.asset(
                    AllImages.twitter,
                  ),
              ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
