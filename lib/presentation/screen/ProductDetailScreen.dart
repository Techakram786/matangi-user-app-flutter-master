import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/CustomClass/AllString.dart';
import 'package:matangi_user_app/data/Model/ProductItemModel.dart';
import 'package:matangi_user_app/logic/cubit/state/ProductDetailState.dart';
import 'package:matangi_user_app/presentation/widget/GlobalWidgets.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../logic/cubit/DashboardCubit.dart';
import '../../logic/cubit/ProductDetailCubit.dart';
import '../widget/media_carousels_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);
  List<String> colorList =['Red','Yellow','Green','Black','Blue','Violet',];
  List<String> sizeList =['XS','S','M','L','XL','XXL'];
  List<String> productDes =["Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim."];
  List<ProductItemModel> productItems = [];

  CarouselController sliderController = CarouselController();
  bool isColorTap = false;
  bool isSizeTap = false;
  bool isProductDesTap = false;
  bool isItemDtlTap = true;
  bool isShopInfoTap = true;
  bool isSuportTap = true;
  bool isRatingTap = true;


  @override
  Widget build(BuildContext context) {
    var cubit = ProductDetailCubit.get(context);
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
productItems=[
  ProductItemModel(
      title: 'Available Colors',
      des: colorList),
  ProductItemModel(
      title: 'Available Sizes',
      des: sizeList),
  ProductItemModel(
      title: 'Product Description',
      des: productDes),
  ProductItemModel(
      title: 'Item details',
      des:[]
  ),
  ProductItemModel(
      title: 'Shipping info',
      des:[]
  ),
  ProductItemModel(
      title: 'Support',
      des:[]
  ),
  ProductItemModel(
      title: 'Ratings and Reviews',
      des:[]
  )
];
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Stack(children: [
          MediaCarouselWidget(
            media: cubit.sliderList,
          ),
          Positioned(
              left: AllDimension.five,
              top: AllDimension.five,
              child: backButton(context)),
          Positioned(
            right: AllDimension.fourtyFive,
            top: AllDimension.five,
            child: Card(
              elevation: AllDimension.four,
              color: AllColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AllDimension.twenty), // Adjust the radius as needed
              ),
              child: Container(
                  width: AllDimension.thirty,
                  height: AllDimension.thirty,
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AllImages.fav,
                        color: AllColors.blackColor,
                      ))),
            ),
          ),
          Positioned(
            right: AllDimension.five,
            top: AllDimension.five,
            child: Card(
              elevation: AllDimension.four,
              color: AllColors.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AllDimension.twenty), // Adjust the radius as needed
              ),
              child: Container(
                  width: AllDimension.thirty,
                  height: AllDimension.thirty,
                  child: IconButton(
                      alignment: Alignment.center,
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AllImages.share,
                        color: AllColors.blackColor,
                      ))),
            ),
          ),
        ]),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:AllDimension.twelve,left:AllDimension.twelve,right: AllDimension.twelve,bottom: AllDimension.zero ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Red Hoodie',
                          style: TextStyle(
                            fontFamily: AllString.fontLato,
                            fontSize: AllDimension.twenty,
                            color: AllColors.black3Color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Teamspirit',
                            style: TextStyle(
                              fontSize: AllDimension.fourteen,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '₹1800',
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
                                width: AllDimension.five,
                              ),
                              Text(
                                '₹1875',
                                maxLines: 1,
                                style: TextStyle(
                                  color: AllColors.blackColor,
                                  fontSize: AllDimension.sixteen,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 4,
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
                            '(18)',
                            maxLines: 1,
                            style: TextStyle(
                              color: AllColors.accentColor,
                              fontSize: AllDimension.ten,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Divider(
                  color: AllColors.greyLightColor,
                  thickness: 1,

                ),
                ProductDes(
                  productItems: productItems,
                ),
              ],
            ),
          ),
        ),
        Container(
          color: AllColors.whiteColor,
          width: globalWidth!,
          padding: EdgeInsets.all(AllDimension.fifteen),
          child: defaultButton(context, 'ADD TO CART', () {}),
        )
      ],
    )));
  }

  Widget title(String title) {
    return Align(
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




}

class ProductDes extends StatefulWidget {
  final List<ProductItemModel> productItems;

  const ProductDes({Key? key, required this.productItems}) : super(key: key);

  @override
  State<ProductDes> createState() => _ProductDesState();
}

class _ProductDesState extends State<ProductDes> {
  List<bool> isExpandedList = [];
  List<ProductItemModel> productItemList = [];
  List<String> reviewImgList=[];
  @override
  void initState() {
    super.initState();
    productItemList = widget.productItems;
    isExpandedList = List.generate(productItemList.length, (index) => false);
    reviewImgList = [AllImages.review1, AllImages.review2];
    isExpandedList[0]=true;
    isExpandedList[1]=true;
    isExpandedList[2]=true;
    isExpandedList[6]=true;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => itemList(
            context, index, isExpandedList[index], productItemList[index]),
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: AllColors.greyLightColor,

        ),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: productItemList.length,
        shrinkWrap: true,
      );

  }

  Widget itemList(BuildContext context, int parentIndex, bool isExpanded,
      ProductItemModel productItemModel) {
    return Padding(
      padding:  EdgeInsets.only(left:AllDimension.twelve,right:AllDimension.twelve ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpandedList[parentIndex] = !isExpandedList[parentIndex];
              });
            },
            child: Padding(
              padding:  EdgeInsets.only(top:AllDimension.twelve,bottom:AllDimension.twelve ),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      productItemModel.title.toString(),
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: AllString.fontLato,
                        color: AllColors.black3Color,
                        fontSize: AllDimension.fourteen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  isExpanded ? Container() : SvgPicture.asset(AllImages.rightArrow)
                ],
              ),
            ),
          ),
          if (isExpanded && (productItemModel.title=="Available Colors" || productItemModel.title=="Available Sizes"))
          GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 4, // number of items in each row
    mainAxisSpacing: 10.0, // spacing between rows
    crossAxisSpacing: 10.0,// spacing between columns
    mainAxisExtent: 32.0
    ),
            itemBuilder: (context, index) {
              for(int i=0;i<productItemList[parentIndex].des.length;i++){

                return itemFilters(context, productItemList[parentIndex].des[i]);
              }
              return SizedBox.shrink(); // Return an empty SizedBox for out-of-range indices
            },

    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemCount:productItemList[parentIndex].des.length,
    shrinkWrap: true,
    ),
          if (isExpanded && productItemModel.title=="Product Description")
            Text(
              productItemList[parentIndex].des[0],
              maxLines: 7,
              style: TextStyle(
                fontFamily: AllString.fontLato,
                color: AllColors.black3Color,
                fontSize: AllDimension.fourteen,
                fontWeight: FontWeight.w400,
              ),
            ),
          if (isExpanded && productItemModel.title=="Ratings and Reviews")
            userReview(context)
        ],
      ),
    );
  }

  Widget itemFilters(
      BuildContext context,
            String itemList,
      ) {
    return Container(
      margin: EdgeInsets.only(top: AllDimension.five),
      child: Container(
        alignment: Alignment.center,
        width: AllDimension.seventyTwo,
        height: AllDimension.twentyNine,
        decoration: BoxDecoration(
          color: AllColors.whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(AllDimension.eight)),
          border: Border.all(
            color: AllColors.boderGreyColor,
            width: AllDimension.one,
          ),
        ),
        child: Text(
          itemList.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AllDimension.ten,
              color: AllColors.black3Color,
              fontWeight: FontWeight.w400),
        ),
      ),
    );

  }
  Widget userReview(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RatingBarIndicator(
              rating: 4,
              unratedColor: AllColors.dotIndicatorColor,
              itemBuilder: (context, index) => SvgPicture.asset(
                AllImages.activeStar,
                color: AllColors.accentColor,
              ),
              itemCount: 5,
              itemSize: AllDimension.eighteen,
              direction: Axis.horizontal,
            ),
            SizedBox(
              width: AllDimension.three,
            ),
            Text(
              '1832 Ratings and 1234 Reviews',
              maxLines: 1,
              style: TextStyle(
                fontFamily: AllString.fontLato,
                color: AllColors.black3Color,
                fontSize: AllDimension.ten,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          height: AllDimension.twenty,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.only(left: AllDimension.fourteen),
              padding: EdgeInsets.all(AllDimension.ten),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: AllColors.whiteColor,
                borderRadius:
                BorderRadius.all(Radius.circular(AllDimension.eight)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    // Shadow color
                    spreadRadius: 1,
                    // Spread radius
                    blurRadius: 1,
                    // Blur radius
                    offset: Offset(0, 1), // Offset in the Y direction
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Yeswanth',
                          maxLines: 1,
                          style: TextStyle(
                            color: AllColors.black3Color,
                            fontSize: AllDimension.fourteen,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'August 31, 2023-11:55 AM',
                          maxLines: 1,
                          style: TextStyle(
                            color: AllColors.textGreyColor2,
                            fontSize: AllDimension.ten,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AllDimension.five,
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: 4,
                        unratedColor: AllColors.dotIndicatorColor,
                        itemBuilder: (context, index) => SvgPicture.asset(
                          AllImages.activeStar,
                          color: AllColors.accentColor,
                        ),
                        itemCount: 5,
                        itemSize: AllDimension.fourteen,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(
                        width: AllDimension.three,
                      ),
                      Text(
                        'Very Good',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: AllString.fontLato,
                          color: AllColors.black3Color,
                          fontSize: AllDimension.ten,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AllDimension.five,
                  ),
                  Text(
                    "I loved this dress so much as soon as I tried it on I knew I had to buy it in another color. I am 5'3 about 155lbs and I carry all my weight in my upper body. When I put it on I felt like it thinned me put and I got so many compliments.",
                    maxLines: 7,
                    style: TextStyle(
                      color: AllColors.black3Color,
                      fontSize: AllDimension.twelve,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: AllDimension.ten,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: AllDimension.oneTen,
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          reviewImgs(reviewImgList, index),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                            width: AllDimension.ten,
                          ),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: reviewImgList.length,
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -15,
              left: 0,
              child: Image(
                image: AssetImage(
                  AllImages.hoddies,
                ),
                width: AllDimension.thirtyTwo,
                height: AllDimension.thirtyTwo,
              ),
            )
          ],
        ),
        SizedBox(
          height: AllDimension.five,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Helpful',
              maxLines: 1,
              style: TextStyle(
                color: AllColors.accentColor,
                fontSize: AllDimension.eleven,
                fontWeight: FontWeight.w400,
              ),
            ),
            SvgPicture.asset(
              AllImages.thumb,
            )
          ],
        )
      ],
    );
  }

  Widget reviewImgs(List<String> img, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AllDimension.four),
      child: Image.asset(
        img[index].toString(),
        width: AllDimension.oneZeroFour,
        height: AllDimension.oneZeroFour,
        fit: BoxFit.cover,
      ),
    );
  }
}
