import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../../data/Model/AboutUsModel.dart';
import '../widget/GlobalWidgets.dart';

class AboutUsScreen extends StatefulWidget {
   AboutUsScreen({Key? key}) : super(key: key);



  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  List<AboutUsModel> listAboutUs=[
    AboutUsModel(title: 'About Us', img: AllImages.about),
    AboutUsModel(title: 'Terms and Conditions', img: AllImages.termCondition),
    AboutUsModel(title: 'Privacy Policy', img: AllImages.privacyPolicy)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(AllString.txtAboutUs)]),
      ),
      body:Container(
        child:  ListView.separated(
          itemBuilder: (context, index) =>
              itemAboutus(context,listAboutUs[index]),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(
                height: AllDimension.twenty,
              ),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: listAboutUs.length,
          shrinkWrap: true,
        ),
      )
    );
  }
  Widget itemAboutus(BuildContext context,AboutUsModel aboutUsModel){
    return   InkWell(
      onTap: (){
        Navigator.pushNamed(context, PageConstants.cmsScreen,arguments: aboutUsModel.title);
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: AllDimension.twelve),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                aboutUsModel.img.toString()),
            SizedBox(width: AllDimension.ten,),
            Text(
                aboutUsModel.title.toString(),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  fontSize: AllDimension.fourteen,
                  color: AllColors.blackColor,
                  fontWeight: FontWeight.w600,
                )
            ),
            Spacer(),
            SvgPicture.asset(AllImages.rightArrow)
          ],
        ),
      ),
    );
  }
}
