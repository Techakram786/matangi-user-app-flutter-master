import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../../CustomClass/AllColors.dart';
import '../../../CustomClass/AllDimension.dart';
import '../../../CustomClass/AllImages.dart';
import '../../../CustomClass/AllString.dart';
import '../../../CustomClass/Language_constants.dart';
import '../../../logic/cubit/DashboardCubit.dart';
import '../../../logic/cubit/state/DashboardState.dart';
import '../../widget/GlobalWidgets.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
   DashboardCubit? cubit;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AllColors.whiteColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return WillPopScope(
      onWillPop: () async {
        cubit?.changeBottomTab(0);
        return Future.value(false);
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(AllDimension.twelve),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headTitles(translation(context).txtMyProfile),
                  Container(
                      width: AllDimension.thirty,
                      height: AllDimension.thirty,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AllColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            // Shadow color
                            spreadRadius: 2,
                            // Spread radius
                            blurRadius: 2,
                            // Blur radius
                            offset: Offset(0, 2), // Offset in the Y direction
                          ),
                        ],
                      ),
                      child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {
                            Navigator.pushNamed(context, PageConstants.notificationScreen);
                          },
                          icon: SvgPicture.asset(AllImages.notification)
                      )
                  ),

                ],
              ),
              SizedBox(height: AllDimension.fifteen,),
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      AllImages.hoddies,
                    ),
                    width: AllDimension.sixty,
                    height: AllDimension.sixty,
                  ),
                  SizedBox(width: AllDimension.ten,),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Tadikonda Yeswanth',
                              style: TextStyle(
                                fontFamily: AllString.fontLato,
                                fontSize: AllDimension.sixteen,
                                color: AllColors.accentColor,
                                fontWeight: FontWeight.w500,
                              )
                          ),
                          Text(
                              '6309661763',
                              style: TextStyle(
                                fontSize: AllDimension.twelve,
                                color: AllColors.blackColor,
                                fontWeight: FontWeight.w400,
                              )
                          ),
                        ],
                      )
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, PageConstants.editProfileScreen);
                    },
                      child: Container(
                        padding: EdgeInsets.all(AllDimension.five),
                          child: SvgPicture.asset(AllImages.edit)))
                ],
              ),
              SizedBox(height: AllDimension.twenty,),
              BlocBuilder<DashboardCubit, DashboardStates>(
                builder: (context, state) {
                   cubit = DashboardCubit.get(context);
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          profileItems(context, cubit!, index),
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                            color: AllColors.greyLightColor,
                            height: AllDimension.twenty,
                          ),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: cubit!.profileList.length,
                      shrinkWrap: true,
                    ),
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }

  Widget profileItems(BuildContext context, DashboardCubit cubit, int index) {
    return InkWell(
      onTap: (){
        switch(index){
          case 0:
            Navigator.pushNamed(context, PageConstants.ordersScreen);
            break;
          case 1:
            Navigator.pushNamed(context, PageConstants.shippingAddressScreen,arguments: 'My Address Book');
            break;
          case 2:
            Navigator.pushNamed(context, PageConstants.referFriendScreen);
            break;
          case 3:
            Navigator.pushNamed(context, PageConstants.walletScreen);
            break;
          case 4:
            Navigator.pushNamed(context, PageConstants.supportScreen);
            break;
          case 5:
            Navigator.pushNamed(context, PageConstants.aboutUsScreen);
            break;
          default:
        }
      },
      child: Row(
        children: [
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                          cubit.profileList[index].title.toString(),
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.sixteen,
                            color: AllColors.black3Color,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                      SizedBox(width: AllDimension.four,),
                      Visibility(
                        visible:cubit.profileList[index].isNeworder as bool ,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              AllImages.stripe
                            ),
                            Positioned(
                              left: AllDimension.zero,
                                right: AllDimension.zero,
                                bottom: AllDimension.zero,
                                top: AllDimension.zero,
                                child: Text(
                                    'New Order',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      fontSize: AllDimension.seven,
                                      color: AllColors.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),)

                          ],
                        ),
                      )



                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          cubit.profileList[index].des.toString(),
                          style: TextStyle(
                            fontFamily:AllString.fontLato ,
                            fontSize: AllDimension.eleven,
                            color: AllColors.textGreyColor,
                            fontWeight: FontWeight.w400,
                          )
                      ),
                      SizedBox(width: AllDimension.four,),
                      Visibility(
                        visible: cubit.profileList[index].isNew as bool,
                        child: Container(
                          padding: EdgeInsets.only(left: AllDimension.three,right: AllDimension.three,top: AllDimension.one,bottom: AllDimension.one),
                          decoration:BoxDecoration(
                            color: AllColors.blueColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AllDimension.two),
                            ),
                          ) ,
                          child: Text(
                            AllString.btnnew,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: AllString.fontLato,
                              color: AllColors.whiteColor,
                              fontSize: AllDimension.six,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
          ),
          SvgPicture.asset(AllImages.rightArrow)
        ],
      ),
    );
  }
}
