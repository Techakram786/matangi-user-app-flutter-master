import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllDimension.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/logic/cubit/ProductCubit.dart';
import 'package:matangi_user_app/logic/cubit/state/ProductState.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllString.dart';
import '../routes/PageConstants.dart';
import '../widget/GlobalWidgets.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({Key? key}) : super(key: key);
   List<String> selectedSortByList = [];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AllColors.whiteColor,
            automaticallyImplyLeading: false,
            titleSpacing: AllDimension.zero,
            title: Row(
                children: [backButton(context), TabTitlesSide('Mens Shirts')]),
          ),
          body: Padding(
            padding: EdgeInsets.all(AllDimension.twelve),
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                var cubit = ProductCubit.get(context);
                return Column(
                  children: [
                  Container(
                  height: 35,
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        filter(context: context,cubit: cubit,index: index,onTap: (){
                          var title= cubit.filterList[index].title.toString();
                          switch(title){
                            case 'Filter':
                              Navigator.pushNamed(context, PageConstants.filterScreen);
                              break;
                            case'Sort By':
                              cubit.sortByData();
                              selectedSortByList.clear();
                              sortBy(context,cubit,selectedSortByList);
                              break;
                            case'Top Rating':
                              break;
                            case'Cost Type':
                              break;
                          }
                        }),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 10,),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.filterList.length,
                    shrinkWrap: true,
                  ),
                ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // number of items in each row
                            mainAxisSpacing: 10.0, // spacing between rows
                            crossAxisSpacing: 10.0,// spacing between columns
                            mainAxisExtent: 270.0
                        ),
                        itemBuilder: (context, index) =>
                            productItems( context, cubit,index),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: cubit.productList.length,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        )
    );
  }
}
Widget productItems(BuildContext context, ProductCubit cubit, int index) {
  return InkWell(
    onTap: (){
      Navigator.pushNamed(context, PageConstants.productDtlScreen);
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(clipBehavior: Clip.none, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AllDimension.four),
            child: Image.asset(
              cubit.productList[index].img.toString(),
              width: globalWidth!/2,
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
                color: cubit.productList[index].isNew as bool?AllColors.blackColor:AllColors.redColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(AllDimension.sixteen),
                ),
              ),
              child: Text(
                cubit.productList[index].isNew as bool?AllString.btnnew:cubit.productList[index].discount.toString(),
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
          cubit.productList[index].title.toString(),
          maxLines: 1,
          style: TextStyle(
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor,
            fontSize: AllDimension.sixteen,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          cubit.productList[index].des.toString(),
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
              rating: cubit.productList[index].star as double,
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
              cubit.productList[index].review.toString(),
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
              cubit.productList[index].price.toString(),
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
              cubit.productList[index].cutPrice.toString(),
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


 sortBy(BuildContext context,ProductCubit cubit,List<String> selectedList) {
  return showModalBottomSheet(
    backgroundColor: AllColors.whiteColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return  DraggableScrollableSheet(
        expand: false,
        shouldCloseOnMinExtent: true,
        maxChildSize: 0.45,
        initialChildSize: 0.40,
        minChildSize: 0.20,
        builder: (BuildContext context, ScrollController scrollController) {
          return  Container(
            padding: EdgeInsets.only(top:AllDimension.twelve,bottom:AllDimension.twelve ),
            width: globalWidth,

            child: Column(
              children: [
                SvgPicture.asset(AllImages.lineBar),
                SizedBox(height: AllDimension.three,),
                Text(
                  'Sort by',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: AllString.fontLato,
                    color: AllColors.black3Color,
                    fontSize: AllDimension.eighteen,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: AllDimension.ten,),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      bool isSelected = selectedList.contains(cubit.sortByList[index].toString());
                      return InkWell(
                        onTap: (){
                          if (isSelected) {
                            selectedList.remove(cubit.sortByList[index].toString());
                          } else {
                            selectedList.add(cubit.sortByList[index].toString());
                          }
                          cubit.buttonSelect();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: AllDimension.two,bottom: AllDimension.two),
                          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                          child: Padding(
                            padding:  EdgeInsets.all(AllDimension.four),
                            child: Text(
                              cubit.sortByList[index].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: AllDimension.sixteen,
                                  color: AllColors.black3Color
                              ),
                            ),
                          ),
                        ),
                      );
                    },

                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 10,),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: cubit.filterList.length,
                    shrinkWrap: true,
                    controller: scrollController,
                  ),
                ),
              ],
            ),
          );
        },

      );



    },
  );
}