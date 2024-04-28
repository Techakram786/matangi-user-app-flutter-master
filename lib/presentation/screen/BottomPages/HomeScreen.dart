import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/presentation/widget/GlobalWidgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../CustomClass/AllColors.dart';
import '../../../CustomClass/AllDimension.dart';
import '../../../CustomClass/AllString.dart';
import '../../../logic/cubit/DashboardCubit.dart';
import '../../../logic/cubit/state/DashboardState.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  CarouselController controller = CarouselController();
  CarouselController sliderController = CarouselController();

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
          bool confirmExit = await showExitConfirmationDialog(context);
          return confirmExit;
        },
      child: Scaffold(

        body: Column(
          children: [
            BlocBuilder<DashboardCubit, DashboardStates>(
              builder: (context, state) {
                var cubit = DashboardCubit.get(context);
                return MyTab(context, cubit);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: BlocBuilder<DashboardCubit, DashboardStates>(
                  builder: (context, state) {
                    var cubit = DashboardCubit.get(context);
                    return Column(
                      children: [
                        banner(context,cubit),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: cubit.bannerList.map((e) {
                            int index = cubit.bannerList.indexOf(e);
                            return Container(
                              width:AllDimension.eight,
                              height: AllDimension.eight,
                              margin: EdgeInsets.symmetric(vertical:AllDimension.five,horizontal:AllDimension.four),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: cubit.bannerIndex == index
                                    ? AllColors.accentColor
                                    : Colors.grey[700],
                              ),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(AllDimension.ten),
                          child: Column(children:[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                              CatTitles(AllString.titCategory),
                                  headingViewAll()
                            ],
                           ),
                               Container(
                                 height:80,
                                 margin:EdgeInsets.only(top: 10),
                                 child:
                                   ListView.separated(
                                        itemBuilder: (context,index)=>categoryItems(context,cubit,index),
                                     separatorBuilder: (BuildContext context, int index) => SizedBox(
                                       width: 10,
                                     ),
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: cubit.categoryList.length,
                                      shrinkWrap: true,

                                    ),

                               ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CatTitles(AllString.btnnew),
                                    headingViewAll()
                                  ],
                                ),
                                TabDes(AllString.newlistdec)
                              ],
                            ),
                            Container(
                              height:AllDimension.twoEighty,
                              margin:EdgeInsets.only(top: AllDimension.ten),
                              child:  ListView.separated(
                                itemBuilder: (context,index)=>newItems(context,cubit,index),
                                separatorBuilder: (BuildContext context, int index) => SizedBox(
                                  width: AllDimension.fifteen,
                                ),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.newList.length,
                                shrinkWrap: true,

                              ),
                            ),
                            SizedBox(height: AllDimension.five,),
                            slider(context, cubit),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: cubit.sliderList.map((e) {
                                int index = cubit.sliderList.indexOf(e);
                                return Container(
                                  width:AllDimension.six,
                                  height: AllDimension.six,
                                  margin: EdgeInsets.symmetric(vertical:AllDimension.five,horizontal:AllDimension.four),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: cubit.sliderIndex == index
                                        ? AllColors.accentColor
                                        : Colors.grey[400],
                                  ),
                                );
                              }).toList(),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CatTitles(AllString.titSale),
                                    headingViewAll()
                                  ],
                                ),
                                TabDes(AllString.titSaleDes)
                              ],
                            ),
                            Container(
                              height:AllDimension.twoEighty,
                              margin:EdgeInsets.only(top: AllDimension.ten),
                              child:  ListView.separated(
                                itemBuilder: (context,index)=>saleItems(context,cubit,index),
                                separatorBuilder: (BuildContext context, int index) => SizedBox(
                                  width: AllDimension.fifteen,
                                ),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: cubit.saleList.length,
                                shrinkWrap: true,

                              ),
                            ),
                    ]
                      ),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget banner(BuildContext context, DashboardCubit cubit){
    return Stack(
      children: [
        CarouselSlider(
          carouselController: controller,
          items: cubit.bannerList
              .map(
                (e) => Image(
              image: AssetImage('${e.banner}'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
              .toList(),
          options: CarouselOptions(
              height: globalHeight! / 1.7,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason){
                context.read<DashboardCubit>().changeBanner(index);
              }
          ),
        ),
        Positioned(
          left: AllDimension.ten,
          bottom: AllDimension.twenty,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Text(
                cubit.bannerList[cubit.bannerIndex].title.toString(),
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  color: AllColors.whiteColor,
                  fontSize: AllDimension.thirty,
                  fontWeight: FontWeight.w700,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  AllColors.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        AllDimension.eight),
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: AllDimension.twentyFive,
                      vertical: AllDimension.fifteen),
                ),
                child: Text(
                  AllString.checkNow,
                  style: TextStyle(
                    color: AllColors.whiteColor,
                    fontSize: AllDimension.fourteen,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),)
      ],

    );
  }

  Widget categoryItems(BuildContext context,DashboardCubit cubit,int index){
    return Column(
      children: [
        Container(
          height: AllDimension.sixtyTwo,
          width: AllDimension.sixtyEight,
          child: Stack(
              alignment: Alignment.center,
            children:[
              Image(

                image: AssetImage(cubit.categoryList[index].img.toString(),
              ),
                width: AllDimension.sixty,
                height: AllDimension.sixty,
              ),
    Positioned(
    left: AllDimension.twenty,
    right:AllDimension.twenty ,
    bottom: AllDimension.zero,
      child: Visibility(
        visible: cubit.categoryList[index].isNew as bool,
        child: Container(
            padding: EdgeInsets.only(left: AllDimension.two,right: AllDimension.two,top: AllDimension.one,bottom: AllDimension.one),
            decoration:BoxDecoration(
              color: AllColors.pinkColor,
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
                fontSize: AllDimension.eight,
                fontWeight: FontWeight.w600,
              ),
            ),
        ),
      ),
    )
            ]
          ),
        ),
        Text(
          cubit.categoryList[index].title.toString(),
          style: TextStyle(
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor,
            fontSize: AllDimension.twelve,
            fontWeight: FontWeight.w500,
          ),
        )

      ],
    );
  }

  Widget newItems(BuildContext context,DashboardCubit cubit,int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
          Stack(
             clipBehavior: Clip.none,
             children:[
               ClipRRect(
               borderRadius: BorderRadius.circular(AllDimension.four),
               child: Image.asset(
                 cubit.newList[index].img.toString(),
                 width: AllDimension.oneFourtyEight,
                 height: AllDimension.oneEightyFour,
                 fit: BoxFit.cover,
               ),
             ),
            Visibility(
              visible: cubit.newList[index].isNew as bool,
              child: Positioned(
                 left: AllDimension.five,
                 top: AllDimension.five,
                 child: Container(
                width: AllDimension.fourty,
                padding: EdgeInsets.symmetric(vertical: AllDimension.five,horizontal: AllDimension.two),
                decoration:BoxDecoration(
                color: AllColors.black2Color,
                borderRadius: BorderRadius.all(
               Radius.circular(AllDimension.sixteen),
                 ),
                ) ,
                 child: Text(
               AllString.btnnew,
               textAlign: TextAlign.center,
               maxLines: 1,
               style: TextStyle(
               fontFamily: AllString.fontLato,
               color: AllColors.whiteColor,
               fontSize: AllDimension.eleven,
                 fontWeight: FontWeight.w600,
                ),
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
                       borderRadius: BorderRadius.circular(AllDimension.twenty), // Adjust the radius as needed
                     ),
                     child: Container(
                       width: AllDimension.thirtysix,
                       height: AllDimension.thirtysix,
                       child: IconButton(
                         alignment: Alignment.center,
                         onPressed: () {  },
                         icon: SvgPicture.asset(AllImages.fav)
                       )
                     ),
                   ),
               ),
             ]
           ),
       Text(
         cubit.newList[index].title.toString(),
         maxLines: 1,
         style: TextStyle(
           fontFamily: AllString.fontLato,
           color: AllColors.blackColor,
           fontSize: AllDimension.sixteen,
           fontWeight: FontWeight.w600,
         ),
       ),
       Text(
         cubit.newList[index].des.toString(),
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
             rating: cubit.newList[index].star as double,
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
             cubit.newList[index].review.toString(),
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
             cubit.newList[index].price.toString(),
             maxLines: 1,
             style: TextStyle(
               color: AllColors.blackColor,
               fontSize: AllDimension.sixteen,
               fontWeight: FontWeight.w500,
             ),
           ),
           SizedBox(width: AllDimension.five,),
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
         ],
       ),
     ],
    );
  }

  Widget slider(BuildContext context, DashboardCubit cubit){
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AllDimension.eight),
          child: CarouselSlider(
            carouselController: sliderController,
            items: cubit.sliderList
                .map(
                  (e) => Image(
                image: AssetImage('${e.banner}'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
                .toList(),
            options: CarouselOptions(
                height: globalHeight! / 3.5,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason){
                  context.read<DashboardCubit>().changeSlider(index);
                }
            ),
          ),
        ),
        
      ],

    );
  }

  Widget saleItems(BuildContext context,DashboardCubit cubit,int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
            clipBehavior: Clip.none,
            children:[
              ClipRRect(
                borderRadius: BorderRadius.circular(AllDimension.four),
                child: Image.asset(
                  cubit.saleList[index].img.toString(),
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
                    padding: EdgeInsets.symmetric(vertical: AllDimension.five,horizontal: AllDimension.two),
                    decoration:BoxDecoration(
                      color: AllColors.redColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(AllDimension.sixteen),
                      ),
                    ) ,
                    child: Text(
                      cubit.saleList[index].discount.toString(),
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
                    borderRadius: BorderRadius.circular(AllDimension.twenty), // Adjust the radius as needed
                  ),
                  child: Container(
                      width: AllDimension.thirtysix,
                      height: AllDimension.thirtysix,
                      child: IconButton(
                          alignment: Alignment.center,
                          onPressed: () {  },
                          icon: SvgPicture.asset(AllImages.fav)
                      )
                  ),
                ),
              ),
            ]
        ),
        Text(
          cubit.saleList[index].title.toString(),
          maxLines: 1,
          style: TextStyle(
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor,
            fontSize: AllDimension.sixteen,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          cubit.saleList[index].des.toString(),
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
              rating: cubit.saleList[index].star as double,
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
              cubit.saleList[index].review.toString(),
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
              cubit.saleList[index].price.toString(),
              maxLines: 1,
              style: TextStyle(
                color: AllColors.blackColor,
                fontSize: AllDimension.sixteen,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: AllDimension.five,),
            Text(
              cubit.saleList[index].cutPrice.toString(),
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

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Exit'),
          content: Text('Do you want to exit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User canceled exit
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                SystemNavigator.pop();
                // Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
