
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../widget/GlobalWidgets.dart';
class OrderDetailsScreen extends StatelessWidget {
  final String? orderType;
   OrderDetailsScreen({super.key,required this.orderType});


  @override
  Widget build(BuildContext context) {
    print('ordertypeee $orderType');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(translation(context).txtOrderDetails)]),
      ),
      body:Container(

        child:  Column(
          children: [
             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AllDimension.eleven),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(child: Text("Order No",style: TextStyle(color: AllColors.textGreyColor,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft),
                              Text("223344444567",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w700,fontSize: 12,fontFamily: AllString.fontLato,),),
                            ],
                          ),
                          SizedBox(height: AllDimension.five,),
                          Align(child: Text("PLACED DATE",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                          Align(child: Text("31 August 2023,11:30pm",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w700,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                          SizedBox(height: AllDimension.eight,),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(AllDimension.four),
                                child: Image.asset(
                                  AllImages.hoddes2,
                                  width: 67,
                                  height: 67,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(child: Text("Cream hoodie",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w700,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                                    Align(child: Text("Denim",style: TextStyle(color: AllColors.textGreyColor,fontWeight: FontWeight.w400,fontSize: 10,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                                    Align(child: Text("Qty:03",style: TextStyle(color: AllColors.textGreyColor,fontWeight: FontWeight.w400,fontSize: 10,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                                    //SizedBox(height: 6,),
                                    Row(
                                      children: [
                                        Text(
                                          '₹ 800',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: AllColors.blackColor,
                                            fontSize: AllDimension.sixteen,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: AllDimension.five,),
                                        Text(
                                          "₹1500",
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AllColors.boderGreyColor, // Customize the color here
                    ),

                    Visibility(
                      visible: orderType=='Order Confirmed' || orderType=='Order Completed' ? true:false,
                        child: MyStepper(orderType: orderType,)
                    ),
                    Visibility(
                      visible: orderType=='Order Cancelled'?true:false,
                        child: cancellation(context)),
                    Visibility(
                      visible: orderType=='Order Completed'?true:false,
                      child: Column(
                        children: [
                          Divider(
                            color: AllColors.boderGreyColor, // Customize the color here
                          ),
                          orderRating(context),
                          Divider(
                            color: AllColors.boderGreyColor, // Customize the color here
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: AllDimension.twelve,vertical: AllDimension.six),
                            child: Column(

                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    AllString.txtShippingAddress,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.fourteen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Yeswanth',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      color: Color(0xff3A3A3A),
                                      fontSize: AllDimension.fourteen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: globalWidth!/1.9,
                                    child: Text(
                                      '1-50/1,Sakurru,Vinayaka Temple , Amalapuram, Konaseema',
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontFamily: AllString.fontLato,
                                        color: AllColors.black2Color,
                                        fontSize: AllDimension.twelve,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Ph no: 6309661763,9010266086',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      color: AllColors.textGreyColor,
                                      fontSize: AllDimension.ten,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AllColors.boderGreyColor, // Customize the color here
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: AllDimension.twelve,vertical: AllDimension.six),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Payment Mode',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.fourteen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Online Mode-GooglePay',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      color: Color(0xff3A3A3A),
                                      fontSize: AllDimension.fourteen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AllColors.boderGreyColor, // Customize the color here
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: AllDimension.twelve,vertical: AllDimension.six),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Price Details',
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontFamily: AllString.fontLato,
                                      color: AllColors.blackColor,
                                      fontSize: AllDimension.fourteen,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: AllDimension.ten,
                                ),
                                customBoxContainerOnlyTop( () =>
                                    Column(

                                      children: [
                                        billDtl(AllString.txtCartTotal,'₹1875' ,AllColors.blackColor),
                                        billDtl(AllString.txtGSTTotal,'₹134', AllColors.blackColor),
                                        billDtl(AllString.txtShipping,'₹129', AllColors.blackColor),
                                        billDtl(AllString.txtGiftWrap,'₹50', AllColors.blackColor),
                                        billDtl(AllString.txtCoupon,'₹125', AllColors.accentColor),

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
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],),
               ),
             ),

          ],
        ),
      ),
    );
  }

}


class MyStepper extends StatefulWidget {
  final String? orderType;
  const MyStepper({super.key,this.orderType});

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {

  String? orderType;
  List<Step> _steps = [];
  int currentStep =1;
  @override
  void initState() {
    super.initState();
    orderType = widget.orderType;
    if(orderType=='Order Confirmed'){
      orderConfirm();
    }else{
      orderComplete();
    }
  }

  @override
  Widget build(BuildContext context) {

    return  Stepper(
        steps: _steps,
        currentStep: currentStep,
        margin: EdgeInsets.all(0),

        controlsBuilder: (BuildContext ctx, ControlsDetails dtl){
          return Container();
        },
        stepIconBuilder: (context, index,) {

          return Container(
            height: AllDimension.twentyFour,
            width: AllDimension.twentyFour,
            decoration: BoxDecoration(
              shape: BoxShape.circle,

              border: Border.all(
                color: AllColors.accentColor,
                width: AllDimension.one, // Adjust the border width as needed
              ),
            ),

          );
        },
        physics: BouncingScrollPhysics(),
        connectorThickness:1
    ) ;

  }

  void orderConfirm(){
    _steps=[
      Step(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Order Placed",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("31 August 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("We Have Received an Order",style: TextStyle(color: AllColors.black3Color,fontWeight: FontWeight.w400,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("10:30AM",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w400,fontSize: 8,fontFamily: AllString.fontLato,),),
              ],
            ),

          ],
        ),
        isActive: true,
        content: Container(),


      ),
      Step(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Confirmed",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("31 August 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Your Order has been confirmed",style: TextStyle(color: AllColors.black3Color,fontWeight: FontWeight.w400,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("10:30AM",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w400,fontSize: 8,fontFamily: AllString.fontLato,),),
              ],
            ),
          ],
        ),
        isActive: true,
        content: Container(),
      ),
      Step(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Order Shipped",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("31 August 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Your Order has been Shipped",style: TextStyle(color: AllColors.black3Color,fontWeight: FontWeight.w400,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("10:30AM",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w400,fontSize: 8,fontFamily: AllString.fontLato,),),
              ],
            ),
          ],
        ),
        isActive: true,
        content: Container(),
      ),
      Step(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Out for Delivery",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("31 August 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Estimated Delivery by 06 Sep 2023",style: TextStyle(color: AllColors.black3Color,fontWeight: FontWeight.w400,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("10:30AM",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w400,fontSize: 8,fontFamily: AllString.fontLato,),),
              ],
            ),
          ],
        ),
        isActive: true,
        content: Container(),
      ),
      Step(
        title: Column(
          children: [
            Align(child: Text("Delivered",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
            Align(child: Text("Estimated Delivery by 06 Sep 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 8,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
          ],
        ),
        isActive: true,
        content: Container(),
      ),
    ];
  }
  void orderComplete(){
    _steps=[
      Step(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("Order Placed",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("31 August 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 10,fontFamily: AllString.fontLato,),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(child: Text("We Have Received an Order",style: TextStyle(color: AllColors.black3Color,fontWeight: FontWeight.w400,fontSize: 12,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
                Text("10:30AM",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w400,fontSize: 8,fontFamily: AllString.fontLato,),),
              ],
            ),

          ],
        ),
        isActive: true,
        content: Container(),


      ),

      Step(
        title: Column(
          children: [
            Align(child: Text("Delivered",style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
            Align(child: Text("Estimated Delivery by 06 Sep 2023",style: TextStyle(color: AllColors.textGreyColor2,fontWeight: FontWeight.w500,fontSize: 8,fontFamily: AllString.fontLato,),),alignment: Alignment.topLeft,),
          ],
        ),
        isActive: true,
        content: Container(),
      ),
    ];
  }
}

Widget orderRating(BuildContext context){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: AllDimension.twelve,vertical: AllDimension.six),
    child: Column(

      children: [

        Row(
          children: [
            Container(
              height: AllDimension.eight,
              width: AllDimension.eight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff002ED0)
              ),
            ),
            SizedBox(width: AllDimension.five,),
            Text(
              "Order Completed",
              maxLines: 1,
              style: TextStyle(
                color: Color(0xff002ED0),
                fontFamily: AllString.fontLato,
                fontSize: AllDimension.fourteen,
                fontWeight: FontWeight.w500,

              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: RatingBarIndicator(
            rating: 0,
            unratedColor: AllColors.dotIndicatorColor,
            itemBuilder: (context, index) => SvgPicture.asset(
              AllImages.activeStar,
              color: AllColors.accentColor,
            ),
            itemCount: 5,
            itemPadding: EdgeInsets.only(right: 6),
            itemSize: AllDimension.twentyTwo,
            direction: Axis.horizontal,
          ),
        ),
      ],
    ),
  );
}
final TextEditingController textController = TextEditingController();
Widget cancellation(BuildContext context){
  return Padding(
    padding:  EdgeInsets.all(AllDimension.twelve),
    child: Column(

      children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
        "Reason for Cancellation",
        maxLines: 1,
        style: TextStyle(
          fontFamily: AllString.fontLato,
          color: AllColors.blackColor,
          fontSize: AllDimension.sixteen,
          fontWeight: FontWeight.w500,

        ),
        ),
      ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Please tell us the valid reason for cancellation so that we can be able to help you to cancel order",
            maxLines: 2,
            style: TextStyle(
              fontFamily: AllString.fontLato,
              color: AllColors.textGreyColor2,
              fontSize: AllDimension.twelve,
              fontWeight: FontWeight.w400,

            ),
          ),
        ),
        SizedBox(height: AllDimension.ten,),
        RadioListTileExample(),
        SizedBox(height: AllDimension.ten,),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Additional Remarks",
            maxLines: 1,
            style: TextStyle(
              fontFamily: AllString.fontLato,
              color: AllColors.blackColor,
              fontSize: AllDimension.fourteen,
              fontWeight: FontWeight.w400,

            ),
          ),
        ),
        SizedBox(height: AllDimension.ten,),
        defaultFormField(hint: '', maxLenght: 60, controller: textController, type: TextInputType.text,
            onValidate: (String? value) {

              return null;
            },
        maxLine: 5),
        SizedBox(height: AllDimension.ten,),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AllColors.accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AllDimension.four),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: globalWidth!/5.5,
                    vertical: AllDimension.fifteen),
              ),
              child: Text(
                'Back',
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  color: Colors.white,
                  fontSize: AllDimension.fourteen,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(width: AllDimension.ten,),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AllColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AllDimension.four),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: globalWidth!/9,
                    vertical: AllDimension.fifteen),
              ),
              child: Text(
                'Cancel Order',
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  color: Colors.white,
                  fontSize: AllDimension.fourteen,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        )

      ],
    ),
  );
}

class RadioListTileExample extends StatefulWidget {
  @override
  _RadioListTileExampleState createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  String selectedValue = '';
  List<String> options = ['Ordered By Mistake', 'Wrong Product', 'Changed my Mind','Others'];

  void handleRadioValueChanged(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   ListView.separated(
      itemCount: options.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder:
          (BuildContext context, int index) => SizedBox(
        height: AllDimension.ten,
      ),
      itemBuilder: (context, index) {
        final option = options[index];
        return InkWell(
          onTap: (){
            handleRadioValueChanged(option);
          },
          child: Row(
            children: [
              Radio(
                value: option,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                groupValue: selectedValue,
                onChanged: (value) {
                  handleRadioValueChanged(value!);
                },
              ),

              SizedBox(width: AllDimension.ten), // Adjust the width as needed to decrease the space
              Text(
                option,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  color: Colors.black,
                  fontSize: AllDimension.sixteen,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );

      },
    );

  }


}
