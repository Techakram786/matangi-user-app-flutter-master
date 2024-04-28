import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/CustomClass/AllString.dart';
import 'package:matangi_user_app/logic/cubit/state/FilterState.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/Language_constants.dart';
import '../../logic/cubit/FilterCubit.dart';
import '../widget/GlobalWidgets.dart';

class FilterScreen extends StatelessWidget {
   FilterScreen({Key? key}) : super(key: key);
   List<String> selectedColorList = [];
   List<String> selectedSizeList = [];
   List<String> selectedCatList = [];
   List<String> selectedRatingList = [];
   List<String> selectedBrandList = [];
   FilterCubit? cubit;
  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: Scaffold(
        backgroundColor: AllColors.bgColor,
        appBar: AppBar(
          backgroundColor: AllColors.whiteColor,
          automaticallyImplyLeading: false,
          titleSpacing: AllDimension.zero,
          title: Row(
              children: [backButton(context), TabTitlesSide(translation(context).titFilters)]),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AllDimension.twelve),
                child: BlocBuilder<FilterCubit, FilterState>(
  builder: (context, state) {
   cubit = FilterCubit.get(context);
    return
           SingleChildScrollView(
                  child: Column(

                          children: [
                            title(AllString.titPriceRange),
                            SizedBox(height: AllDimension.five,),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 4),
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.rectangle,

                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                Text(
                                '₹500',
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: AllString.fontLato,
                                  color: AllColors.blackColor,
                                  fontSize: AllDimension.fourteen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                                      Text(
                                        '₹1500',
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: AllString.fontLato,
                                          color: AllColors.blackColor,
                                          fontSize: AllDimension.fourteen,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SliderTheme(
                                    data: SliderThemeData(
                                      thumbColor:AllColors.accentColor, // Change the color of the thumbs
                                      activeTrackColor: AllColors.accentColor, // Change the color of the active track (filled part)
                                      inactiveTrackColor: AllColors.textGreyColor, // Change the color of the inactive track (unfilled part)
                                      trackHeight: 3, // Change the thickness of the track

                                    ),
                                    child: RangeSlider(
                                      min: 500,
                                      max: 1500,
                                      onChanged: (RangeValues value) {
                                        if (value.end - value.start <= 10) return;
                                       cubit!.changeSliderRange(value);
                                      },
                                      values: cubit!.sliderRange
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: AllDimension.five,),
                            title(AllString.titColors),
                            Container(
                              margin: EdgeInsets.only(top: AllDimension.five),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.rectangle,
                              ),
                              child:GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, // number of items in each row
                                    mainAxisSpacing: 10.0, // spacing between rows
                                    crossAxisSpacing: 10.0,// spacing between columns
                                    mainAxisExtent: 32.0
                                ),
                                itemBuilder: (context, index) =>
                                    itemFilters( context, cubit!,index,cubit!.colorList,selectedColorList),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: cubit?.colorList.length,
                                shrinkWrap: true,
                              ),
                            ),
                            SizedBox(height: AllDimension.five,),
                            title(AllString.titSizes),
                            Container(
                              margin: EdgeInsets.only(top: AllDimension.five),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.rectangle,
                              ),
                              child:GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, // number of items in each row
                                    mainAxisSpacing: 10.0, // spacing between rows
                                    crossAxisSpacing: 10.0,// spacing between columns
                                    mainAxisExtent: 32.0
                                ),
                                itemBuilder: (context, index) =>
                                    itemFilters( context, cubit!,index,cubit!.sizeList,selectedSizeList),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: cubit!.sizeList.length,
                                shrinkWrap: true,
                              ),
                            ),
                            SizedBox(height: AllDimension.five,),
                            title(AllString.titCategory),
                            Container(
                              margin: EdgeInsets.only(top: AllDimension.five),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.rectangle,
                              ),
                              child:GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, // number of items in each row
                                    mainAxisSpacing: 10.0, // spacing between rows
                                    crossAxisSpacing: 10.0,// spacing between columns
                                    mainAxisExtent: 32.0
                                ),
                                itemBuilder: (context, index) =>
                                    itemFilters( context, cubit!,index,cubit!.catList,selectedCatList),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: cubit!.catList.length,
                                shrinkWrap: true,
                              ),
                            ),
                            SizedBox(height: AllDimension.five,),
                            title(AllString.titRatings),
                            Container(
                              margin: EdgeInsets.only(top: AllDimension.five),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.rectangle,
                              ),
                              child:GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, // number of items in each row
                                    mainAxisSpacing: 10.0, // spacing between rows
                                    crossAxisSpacing: 10.0,// spacing between columns
                                    mainAxisExtent: 32.0
                                ),
                                itemBuilder: (context, index) =>
                                    itemRating( context, cubit!,index,cubit!.ratingList,selectedRatingList),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: cubit!.ratingList.length,
                                shrinkWrap: true,
                              ),
                            ),
                            SizedBox(height: AllDimension.five,),
                            title(AllString.titBrand),
                            Container(
                              margin: EdgeInsets.only(top: AllDimension.five),
                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                              decoration: BoxDecoration(
                                color: AllColors.whiteColor,
                                shape: BoxShape.rectangle,
                              ),
                              child:GridView.builder(
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, // number of items in each row
                                    mainAxisSpacing: 10.0, // spacing between rows
                                    crossAxisSpacing: 10.0,// spacing between columns
                                    mainAxisExtent: 32.0
                                ),
                                itemBuilder: (context, index) =>
                                    itemFilters( context, cubit!,index,cubit!.brandList,selectedBrandList),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: cubit!.brandList.length,
                                shrinkWrap: true,
                              ),
                            ),
                          ],
                        ),
                );



  },
),
              ),
            ),
            Container(

            padding: EdgeInsets.all(AllDimension.ten),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      selectedColorList.clear();
                      selectedSizeList.clear();
                      selectedCatList.clear();
                      selectedRatingList.clear();
                      selectedBrandList.clear();
                      cubit!.buttonSelect();

                    },
                    child: Container(
                      width: globalWidth! / 2.2,

                      padding: EdgeInsets.symmetric( vertical: AllDimension.fifteen),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AllColors.whiteColor,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AllColors.boderGreyColor,
                          width: AllDimension.one,
                        ),
                      ),

                      child: Text(
                        AllString.titClearFilter,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.black3Color,
                          fontSize: AllDimension.twelve,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: globalWidth! / 2.2,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllColors.accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AllDimension.four),
                        ),

                        padding: EdgeInsets.symmetric(

                            vertical: AllDimension.fifteen),
                      ),
                      child: Text(
                        AllString.titApplyFilter,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: Colors.white,
                          fontSize: AllDimension.fourteen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget title(String title){
    return  Align(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        maxLines: 1,
        style: TextStyle(
          fontFamily: AllString.fontLato,
          color: AllColors.black3Color,
          fontSize: AllDimension.fourteen,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget itemFilters(BuildContext context,FilterCubit cubit,int index,List<String> itemList,List<String> selectedList){
    bool isSelected = selectedList.contains(itemList[index].toString());
    return GestureDetector(
      onTap: (){
        if (isSelected) {
          selectedList.remove(itemList[index].toString());
        } else {
          selectedList.add(itemList[index].toString());
        }
        cubit.buttonSelect();
      },
      child: Container(
        alignment: Alignment.center,
        width: AllDimension.seventyTwo,
        height: AllDimension.twentyNine,
        decoration: BoxDecoration(
          color: isSelected ? AllColors.accentColor : AllColors.whiteColor,
          borderRadius: BorderRadius.all(
              Radius.circular(AllDimension.eight)),
          border: Border.all(
            color: isSelected ?AllColors.accentColor:AllColors.boderGreyColor,
            width: AllDimension.one,
          ),
        ),
        child: Text(
          itemList[index].toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AllDimension.ten,
              color: isSelected ?AllColors.whiteColor:AllColors.black3Color,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }

   Widget itemRating(BuildContext context,FilterCubit cubit,int index,List<String> itemList,List<String> selectedList){
     bool isSelected = selectedList.contains(itemList[index].toString());
     return GestureDetector(
       onTap: (){
         if (isSelected) {
           selectedList.remove(itemList[index].toString());
         } else {
           selectedList.add(itemList[index].toString());
         }
         cubit.buttonSelect();
       },
       child: Container(
         alignment: Alignment.center,
         width: AllDimension.seventyTwo,
         height: AllDimension.twentyNine,
         decoration: BoxDecoration(
           color: isSelected ? AllColors.accentColor : AllColors.whiteColor,
           borderRadius: BorderRadius.all(
               Radius.circular(AllDimension.eight)),
           border: Border.all(
             color: isSelected ?AllColors.accentColor:AllColors.boderGreyColor,
             width: AllDimension.one,
           ),
         ),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SvgPicture.asset(
                 AllImages.activeStar,
               color: isSelected?AllColors.whiteColor:AllColors.accentColor,
             ),
             Text(
               itemList[index].toString(),
               textAlign: TextAlign.center,
               style: TextStyle(
                   fontSize: AllDimension.ten,
                   color: isSelected ?AllColors.whiteColor:AllColors.black3Color,
                   fontWeight: FontWeight.w400
               ),
             ),
           ],
         ),
       ),
     );
   }
}
