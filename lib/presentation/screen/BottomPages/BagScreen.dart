import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllColors.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/logic/cubit/CouponCubit.dart';
import 'package:matangi_user_app/logic/cubit/state/CouponState.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../../CustomClass/AllDimension.dart';
import '../../../CustomClass/AllString.dart';
import '../../../CustomClass/Language_constants.dart';
import '../../../logic/cubit/DashboardCubit.dart';
import '../../../logic/cubit/state/DashboardState.dart';
import '../../widget/GlobalWidgets.dart';

class BagScreen extends StatelessWidget {
  BagScreen({Key? key}) : super(key: key);
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
        backgroundColor: AllColors.greyLightColor,
        body: BlocBuilder<DashboardCubit, DashboardStates>(
          builder: (context, state) {
             cubit = DashboardCubit.get(context);
            return Column(
              children: [
                Container(
                    color: AllColors.whiteColor,
                    width: globalWidth!,
                    padding: EdgeInsets.all(AllDimension.twelve),
                    child: headTitles(translation(context).titBag)
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(AllDimension.twelve),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            itemBuilder: (context, index) =>
                                bagItems(context, cubit!, index),
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: AllDimension.ten,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
                            shrinkWrap: true,
                          ),
                          SizedBox(
                            height: AllDimension.ten,
                          ),
                          InkWell(
                            onTap: (){
                              couponBottomSheet(context);
                            },
                            child: Container(
                              width: globalWidth!,
                              decoration: BoxDecoration(
                                  color: AllColors.whiteColor,
                                  borderRadius: BorderRadius.circular(AllDimension.six)),
                              child: Padding(
                                padding: EdgeInsets.all(AllDimension.ten),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      AllImages.coupon,
                                    ),
                                    SizedBox(
                                      width: AllDimension.ten,
                                    ),
                                    Expanded(
                                      child: Text(
                                        AllString.txtApplyCoupon,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: AllString.fontLato,
                                          color: AllColors.black3Color,
                                          fontSize: AllDimension.sixteen,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AllImages.rightArrow,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AllDimension.ten,
                          ),
                          Container(
                            width: globalWidth!,
                            decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                borderRadius: BorderRadius.circular(AllDimension.six)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: AllDimension.ten,
                                  top: AllDimension.eight,
                                  bottom: AllDimension.eight),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AllImages.gift,
                                  ),
                                  SizedBox(
                                    width: AllDimension.ten,
                                  ),
                                  Expanded(
                                    child: Text(
                                      AllString.txtGiftWrap,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.sixteen,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Checkbox(
                                      value: true,
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      onChanged: (value) {})
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AllDimension.ten,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AllString.txtBillDetails,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: AllString.fontLato,
                                color: AllColors.black3Color,
                                fontSize: AllDimension.twelve,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: globalWidth!,
                            padding: EdgeInsets.symmetric(
                                vertical: AllDimension.five, horizontal: AllDimension.seven),
                            decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(AllDimension.six),
                                    topRight: Radius.circular(AllDimension.six))),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AllString.txtCartTotal,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.eleven,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '₹1875',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.blackColor,
                                        fontSize: AllDimension.twelve,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AllString.txtGSTTotal,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.eleven,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '₹134',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.twelve,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AllString.txtShipping,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.eleven,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '₹29',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.twelve,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AllString.txtGiftWrap,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.eleven,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '₹50',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.twelve,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AllString.txtCoupon,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black3Color,
                                        fontSize: AllDimension.eleven,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '₹125',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.accentColor,
                                        fontSize: AllDimension.twelve,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AllDimension.two,
                          ),
                          Container(
                            width: globalWidth!,
                            padding: EdgeInsets.symmetric(
                                vertical: AllDimension.five, horizontal: AllDimension.seven),
                            decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(AllDimension.six),
                                    bottomRight: Radius.circular(AllDimension.six))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AllString.txTotalAmount,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: AllString.fontLato,
                                    color: AllColors.black3Color,
                                    fontSize: AllDimension.thirteen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '₹2200',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: AllString.fontLato,
                                    color: AllColors.blackColor,
                                    fontSize: AllDimension.thirteen,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AllDimension.ten,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AllString.txtSimilarProducts,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: AllString.fontLato,
                                color: AllColors.black3Color,
                                fontSize: AllDimension.thirteen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            height: AllDimension.twoEighty,
                            margin: EdgeInsets.only(top: AllDimension.ten),
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  similarItems(context, cubit!,index),
                              separatorBuilder:
                                  (BuildContext context, int index) => SizedBox(
                                width: AllDimension.ten,
                              ),
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: cubit!.similarList.length,
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AllColors.whiteColor,
                  width: globalWidth!,
                  padding: EdgeInsets.all(AllDimension.twelve),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AllDimension.oneFifty, // Set a consistent width
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Final Amount',
                              maxLines: 1,
                              style: TextStyle(
                                color: AllColors.black3Color,
                                fontSize: AllDimension.ten,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '₹2,200',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: AllString.fontLato,
                                color: AllColors.black3Color,
                                fontSize: AllDimension.twenty,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PageConstants.checkoutScreen);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AllColors.accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AllDimension.four),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: AllDimension.fourty,
                              vertical: AllDimension.fifteen),
                        ),
                        child: Text(
                          translation(context).txtCHECKOUT,
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
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget bagItems(BuildContext context, DashboardCubit cubit, int index) {
    return Container(
      decoration: BoxDecoration(
          color: AllColors.whiteColor, borderRadius: BorderRadius.circular(AllDimension.six)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(AllDimension.six),bottomLeft: Radius.circular(AllDimension.six)),
            child: Image.asset(
              cubit.newList[index].img.toString(),
              width: AllDimension.oneZeroFour,
              height: AllDimension.oneZeroFour,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(AllDimension.eight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hoodie',
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: AllString.fontLato,
                      color: AllColors.black3Color,
                      fontSize: AllDimension.sixteen,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: AllDimension.two,
                  ),
                  Row(
                    children: [
                      Text(
                        AllString.txtColor,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.boderGreyColor,
                          fontSize: AllDimension.eleven,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Yellow',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.black3Color,
                          fontSize: AllDimension.eleven,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: AllDimension.ten,
                      ),
                      Text(
                        AllString.txtSize,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.boderGreyColor,
                          fontSize: AllDimension.eleven,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'XL',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.black3Color,
                          fontSize: AllDimension.eleven,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AllDimension.two,
                  ),
                  Row(
                    children: [
                      Material(
                        elevation: AllDimension.two,
                        shape: CircleBorder(),
                        child: Container(
                          height: AllDimension.twentySix,
                          width: AllDimension.twentySix,
                          child: Center(
                              child: IconButton(
                            icon: SvgPicture.asset(
                              AllImages.sub,
                            ),
                            onPressed: () {},
                          )),
                        ),
                      ),
                      SizedBox(
                        width: AllDimension.five,
                      ),
                      Text(
                        '1',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.black3Color,
                          fontSize: AllDimension.sixteen,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: AllDimension.five,
                      ),
                      Material(
                        elevation: AllDimension.two,
                        shape: CircleBorder(),
                        child: Container(
                          height: AllDimension.twentySix,
                          width: AllDimension.twentySix,
                          child: Center(
                              child: IconButton(
                            icon: SvgPicture.asset(
                              AllImages.add,
                            ),
                            onPressed: () {},
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: AllDimension.oneZeroFour,
            width: AllDimension.seventyFive,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -8,
                  right: -8,
                  child: PopupMenuButton<int>(
                    onSelected: (item) => (item) {},
                    itemBuilder: (context) => [
                      PopupMenuItem<int>(value: 0, child: Text('Remove')),

                    ],
                  ),
                ),
                Positioned(
                  bottom: AllDimension.five,
                  right: AllDimension.five,
                  child: Row(
                    children: [
                      Text(
                        cubit.newList[index].cutPrice.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: AllColors.accentColor,
                          fontSize: AllDimension.ten,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: AllColors.accentColor,
                          decorationThickness: 1.5,
                        ),
                      ),
                      SizedBox(
                        width: AllDimension.two,
                      ),
                      Text(
                        cubit.newList[index].price.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          color: AllColors.blackColor,
                          fontSize: AllDimension.fifteen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget similarItems(BuildContext context, DashboardCubit cubit,int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AllDimension.four),
            child: Image.asset(
              cubit.similarList[index].img.toString(),
              width: AllDimension.oneFourtyEight,
              height: AllDimension.oneEightyFour,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: AllDimension.five,
            top: AllDimension.five,
            child: Container(
              width: AllDimension.fourty,
              padding: EdgeInsets.symmetric(
                  vertical: AllDimension.five, horizontal: AllDimension.two),
              decoration: BoxDecoration(
                color: cubit.similarList[index].isNew as bool?AllColors.blackColor:AllColors.redColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(AllDimension.sixteen),
                ),
              ),
              child: Text(
                cubit.similarList[index].isNew as bool?AllString.btnnew:cubit.similarList[index].discount.toString(),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: AllColors.whiteColor,
                  fontSize: AllDimension.eleven,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            right: AllDimension.five,
            bottom: AllDimension.minFifteen,
            child: Card(
              elevation: AllDimension.four,
              color: AllColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AllDimension.twenty), // Adjust the radius as needed
              ),
              child: Container(
                  width: AllDimension.thirtysix,
                  height: AllDimension.thirtysix,
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {},
                      icon: SvgPicture.asset(AllImages.fav))),
            ),
          ),
        ]),
        Text(
          cubit.similarList[index].title.toString(),
          maxLines: 1,
          style: TextStyle(
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor,
            fontSize: AllDimension.sixteen,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          cubit.similarList[index].des.toString(),
          maxLines: 1,
          style: TextStyle(
            color: AllColors.textGreyColor,
            fontSize: AllDimension.eleven,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: cubit.similarList[index].star as double,
              unratedColor: AllColors.dotIndicatorColor,
              itemBuilder: (context, index) => SvgPicture.asset(
                AllImages.activeStar,
                color: AllColors.accentColor,
              ),
              itemCount: 5,
              itemSize: AllDimension.twelve,
              direction: Axis.horizontal,
            ),
            SizedBox(
              width: AllDimension.five,
            ),
            Text(
              cubit.similarList[index].review.toString(),
              maxLines: 1,
              style: TextStyle(
                color: AllColors.accentColor,
                fontSize: AllDimension.ten,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              cubit.similarList[index].price.toString(),
              maxLines: 1,
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: AllDimension.sixteen,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: AllDimension.five,
            ),
            Text(
              cubit.similarList[index].cutPrice.toString(),
              maxLines: 1,
              style: TextStyle(
                color: AllColors.accentColor,
                fontSize: AllDimension.ten,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.lineThrough,
                decorationColor: AllColors.accentColor,
                decorationThickness: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  couponBottomSheet(BuildContext context){
    return showModalBottomSheet(
      backgroundColor: AllColors.whiteColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return  BlocProvider(
          create: (context) => CouponCubit(),
          child: DraggableScrollableSheet(
            expand: false,
            shouldCloseOnMinExtent: true,
            maxChildSize: 0.60,
            initialChildSize: 0.40,
            minChildSize: 0.20,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.only(top:AllDimension.twelve,bottom:AllDimension.twelve ),
                width: globalWidth,
                child: Padding(
                  padding:  EdgeInsets.all(AllDimension.twelve),
                  child: Column(
                    children: [
                      SvgPicture.asset(AllImages.lineBar),
                      SizedBox(height: AllDimension.ten,),
                      Container(
                        padding:  EdgeInsets.symmetric(horizontal: AllDimension.eight),
                        decoration: BoxDecoration(
                            color: AllColors.whiteColor,
                            borderRadius: BorderRadius.circular(AllDimension.six)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Enter your Promocode',
                                  hintStyle: TextStyle(
                                      color: AllColors.dotIndicatorColor
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                              ),

                            ),
                            Text(
                              'APPLY',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AllDimension.twelve,
                                  color: AllColors.accentColor
                              ),
                            ),
                          ],),
                      ),
                      SizedBox(height: AllDimension.ten,),
                      Expanded(
                        child: BlocBuilder<CouponCubit, CouponState>(
                          builder: (context, state) {
                            var cubit = CouponCubit.get(context);
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: (){
                                    },
                                    child: couponItem(context,cubit,index)
                                );
                              },

                              separatorBuilder: (BuildContext context, int index) =>
                                  SizedBox(height: 10,),
                              scrollDirection: Axis.vertical,
                              itemCount: cubit.couponList.length,
                              controller: scrollController,
                              shrinkWrap: true,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

          ),
        );



      },
    );
  }

  Widget couponItem(BuildContext context,CouponCubit cubit, int index){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Color(0x73ffffff),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.0),
            // Shadow color
            spreadRadius: 0,
            // Spread radius
            blurRadius: 25,
            // Blur radius
            offset: Offset(0, 1), // Offset in the Y direction
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(AllDimension.eight),bottomLeft:Radius.circular(AllDimension.eight) ),
            child: Container(
              width: AllDimension.eighty,
              height: AllDimension.eighty,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors:cubit.couponList[index].colorType=='green' ? [
                    Color(0xFF059669), // Start color
                    Color(0xFF39EFB6), // End color
                  ]:[
                    Color(0xFF000000), // Start color
                    Color(0xFF000000), // End color
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cubit.couponList[index].dicount.toString(),
                    style: TextStyle(
                        fontFamily:AllString.fontLato ,
                        fontWeight: FontWeight.w700,
                        fontSize: AllDimension.thirtyTwo,
                        color: AllColors.whiteColor
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '%',
                        style: TextStyle(
                            fontFamily:AllString.fontLato ,
                            fontWeight: FontWeight.w700,
                            fontSize: AllDimension.fourteen,
                            color: AllColors.whiteColor
                        ),
                      ),
                      Text(
                        'off',
                        style: TextStyle(
                            fontFamily:AllString.fontLato ,
                            fontWeight: FontWeight.w700,
                            fontSize: AllDimension.fourteen,
                            color: AllColors.whiteColor
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: AllDimension.ten,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.couponList[index].offertype.toString(),
                  style: TextStyle(
                      fontFamily:AllString.fontLato ,
                      fontWeight: FontWeight.w500,
                      fontSize: AllDimension.fourteen,
                      color: AllColors.black3Color
                  ),
                ),
                Text(
                  cubit.couponList[index].promocode.toString(),
                  style: TextStyle(
                      fontFamily:AllString.fontLato ,
                      fontWeight: FontWeight.w400,
                      fontSize: AllDimension.eleven,
                      color: AllColors.black3Color
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                cubit.couponList[index].reamingTime.toString(),
                style: TextStyle(
                    fontFamily:AllString.fontLato ,
                    fontWeight: FontWeight.w400,
                    fontSize: AllDimension.eleven,
                    color: AllColors.textGreyColor2
                ),
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AllColors.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        AllDimension.six),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AllDimension.twentyEight,
                      vertical: AllDimension.ten),
                ),
                child: Text(
                  AllString.txtApply,
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
          SizedBox(width: AllDimension.ten,)
        ],
      ),
    );

  }
}
