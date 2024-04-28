import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../widget/GlobalWidgets.dart';

class CheckoutScreen extends StatelessWidget {
   CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(translation(context).txtCheckout)]),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(AllDimension.twelve),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                          child: title(AllString.txtShippingAddress)),
                      SizedBox(height: AllDimension.ten,),
                      customBoxContainer( () =>
                          Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Yeswanth',
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: AllString.fontLato,
                                  color: AllColors.blackColor,
                                  fontSize: AllDimension.fourteen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, PageConstants.shippingAddressScreen,arguments: 'Shipping Address');
                                },
                                child: Text(
                                  AllString.txtChange,
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontFamily: AllString.fontLato,
                                    color: AllColors.accentColor,
                                    fontSize: AllDimension.twelve,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
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
                      SizedBox(height: AllDimension.ten,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: title(AllString.txtBillDetails)),
                      SizedBox(height: AllDimension.ten,),
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
                      SizedBox(height: AllDimension.ten,),
                      Align(
                          alignment: Alignment.topLeft,
                          child: title(AllString.txtPaymentMethod)),
                      SizedBox(height: AllDimension.ten,),
                      RadioListTileExample(),

                    ],
                  ),
                ),

            ),
          ),
          Container(
            width: globalWidth!,
            padding: EdgeInsets.all(AllDimension.twelve),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: AllDimension.twentyFive,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                   // Set a consistent width
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
                    Navigator.pushNamed(context, PageConstants.successScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AllColors.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          AllDimension.four),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: globalWidth!/10,
                        vertical: AllDimension.fifteen),
                  ),
                  child: Text(
                    AllString.txtCONFIRMPAYMENT,
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
      ),
    );
  }
  Widget title(String text){
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        fontFamily: AllString.fontLato,
        color: AllColors.blackColor,
        fontSize: AllDimension.twelve,
        fontWeight: FontWeight.w600,
      ),
    );
  }

}



class RadioListTileExample extends StatefulWidget {
  @override
  _RadioListTileExampleState createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  String selectedValue = '';
  List<String> options = ['Online Payment', 'Pay On Delivery', 'Pay Via Wallet'];

  void handleRadioValueChanged(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return   Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AllDimension.eight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: AllDimension.twentyFive,
                offset: Offset(0, 1),
              ),
            ],
          ),
            child:
            ListView.separated(
                  itemCount: options.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder:
                  (BuildContext context, int index) => Divider(
                  height: AllDimension.ten,
                  ),
                  itemBuilder: (context, index) {
                    final option = options[index];
                    return InkWell(
                      onTap: (){
                        handleRadioValueChanged(option);
                      },
                      child: Container(
                        padding: EdgeInsets.all(AllDimension.ten),
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
                            index == 2 ? paymentTypeMulti() : Text(
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
                      ),
                    );

                  },
                ),


          );

  }

  Widget paymentTypeMulti(){
    return Column(
      children: [

           Text(
            'Pay Via Wallet',
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(
              fontFamily: AllString.fontLato,
              color:Colors.black,
              fontSize: AllDimension.sixteen,
              fontWeight: FontWeight.w500,
            ),
          ),

        Row(
          children: [
            Text(
              'Wallet Balance:',
              maxLines: 1,
              style: TextStyle(
                fontFamily: AllString.fontLato,
                color:Colors.black,
                fontSize: AllDimension.ten,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '₹10,200',
              maxLines: 1,
              style: TextStyle(
                fontFamily: AllString.fontLato,
                color:AllColors.accentColor,
                fontSize: AllDimension.ten,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}






