import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../CustomClass/AllColors.dart';
import '../../../CustomClass/AllDimension.dart';
import '../../../CustomClass/AllImages.dart';
import '../../../CustomClass/AllString.dart';
import '../../../CustomClass/Language_constants.dart';
import '../../../logic/cubit/DashboardCubit.dart';
import '../../../logic/cubit/state/DashboardState.dart';
import '../../widget/GlobalWidgets.dart';

class FavScreen extends StatelessWidget {
   FavScreen({Key? key}) : super(key: key);
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
            child: BlocBuilder<DashboardCubit, DashboardStates>(
              builder: (context, state) {
               cubit = DashboardCubit.get(context);
                return Column(
                  children: [
                    headTitles(translation(context).txtFavorites),
                    SizedBox(height: AllDimension.ten,),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 10.0, // spacing between rows
                          crossAxisSpacing: 10.0,// spacing between columns
                          mainAxisExtent: 270.0
                        ),
                        itemBuilder: (context, index) =>
                            favItems(context, cubit!, index),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: cubit!.favList.length,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
      ),
    );
  }

  Widget favItems(BuildContext context,DashboardCubit cubit,int index){
    return Opacity(
      opacity: cubit.favList[index].isSlod as bool?0.8:1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
                clipBehavior: Clip.none,
                children:[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AllDimension.four),
                    child: Image.asset(
                      cubit.favList[index].img.toString(),
                      width: globalWidth!/2,
                      height: AllDimension.oneEightyFour,
                      fit: BoxFit.cover,
                    ),
                  ),

                     Positioned(
                      right: AllDimension.seven,
                      top: AllDimension.five,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                         width: AllDimension.fifteen,
                          height: AllDimension.fifteen,
                          padding: EdgeInsets.all(AllDimension.three),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AllColors.whiteColor,
                          ),
                          child: SvgPicture.asset(
                              AllImages.cross,
                          height: AllDimension.eight,
                          width: AllDimension.eight,)
                        ),
                      ),
                    ),
                  Visibility(
                    visible: cubit.favList[index].isSlod as bool,
                    child: Positioned(
                        bottom: AllDimension.zero,
                        child: Container(
                            width:   globalWidth!/2.1,

                          padding: EdgeInsets.symmetric(vertical:AllDimension.two,horizontal: AllDimension.four),
                            decoration: BoxDecoration(
                              color: AllColors.greyLightColor,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AllDimension.three),bottomRight: Radius.circular(AllDimension.three))
                            ),
                      child:  Text(
                          cubit.favList[index].soldMsg.toString(),
                            maxLines: 2,
                            style: TextStyle(
                              color: AllColors.blackColor,
                              fontSize: AllDimension.twelve,
                              fontWeight: FontWeight.w400,
                            ),
                        ),

                    ),

                    ),
                  ),
                  Visibility(
                    visible: cubit.favList[index].isSlod as bool?false:true,
                    child: Positioned(
                      right: AllDimension.five,
                      bottom: AllDimension.minFifteen,
                      child: Card(
                        elevation: AllDimension.four,
                        color: AllColors.accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AllDimension.twenty), // Adjust the radius as needed
                        ),
                        child: Container(
                            width: AllDimension.thirtysix,
                            height: AllDimension.thirtysix,
                            child: IconButton(
                                alignment: Alignment.center,
                                onPressed: () {  },
                                icon: SvgPicture.asset(AllImages.bag2)
                            )
                        ),
                      ),
                    ),
                  ),
                ]
            ),

          Text(
            cubit.favList[index].title.toString(),
            maxLines: 1,
            style: TextStyle(
              fontFamily: AllString.fontLato,
              color: AllColors.blackColor,
              fontSize: AllDimension.sixteen,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            cubit.favList[index].des.toString(),
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
                rating: cubit.favList[index].star as double,
                unratedColor: AllColors.dotIndicatorColor,
                itemBuilder: (context, index) => SvgPicture.asset(
                  AllImages.activeStar,
                  color: AllColors.accentColor,

                ),
                itemCount: 5,
                itemSize: AllDimension.twelve,
                direction: Axis.horizontal,
              ),
              SizedBox(width: AllDimension.five,),
              Text(
                cubit.favList[index].review.toString(),
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
                cubit.favList[index].price.toString(),
                maxLines: 1,
                style: TextStyle(
                  color: AllColors.blackColor,
                  fontSize: AllDimension.sixteen,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: AllDimension.five,),
              Text(
                cubit.favList[index].cutPrice.toString(),
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
      ),
    );
  }
}
