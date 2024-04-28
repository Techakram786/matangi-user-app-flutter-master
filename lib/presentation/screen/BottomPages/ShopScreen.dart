import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/CustomClass/AllString.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../../CustomClass/AllColors.dart';
import '../../../CustomClass/AllDimension.dart';
import '../../../CustomClass/Language_constants.dart';
import '../../../logic/cubit/DashboardCubit.dart';
import '../../../logic/cubit/state/DashboardState.dart';
import '../../widget/GlobalWidgets.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AllColors.whiteColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    DashboardCubit? cubit;
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
              headTitles(translation(context).titCategory),
              MyTab(context, cubit!),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      shopItems(context, cubit!, index),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                        color: AllColors.greyLightColor,
                    height: AllDimension.twenty,
                  ),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: cubit!.shopCatList.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          );
        },
      ),
        ),
      ),
    );
  }

  Widget shopItems(BuildContext context, DashboardCubit cubit, int index) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, PageConstants.productScreen);
      },
      child: Row(
        children: [
          Image(
            image: AssetImage(
              cubit.shopCatList[index].img.toString(),
            ),
            width: AllDimension.sixty,
            height: AllDimension.sixty,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
                   cubit.shopCatList[index].title.toString(),
                style: TextStyle(
                  fontSize: AllDimension.eighteen,
                  color: AllColors.black3Color,
                  fontWeight: FontWeight.w400,
                )),
          ),
          SvgPicture.asset(AllImages.rightArrow)
        ],
      ),
    );
  }
}
