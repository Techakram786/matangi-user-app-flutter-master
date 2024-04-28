import 'package:flutter/material.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../../data/Model/OrderModel.dart';
import '../widget/GlobalWidgets.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  List<OrderList> orderList = [
    OrderList(
        orderNo: '223344444567',
        date: '31 August 2023,11:30pm',
        item: 'Cream hoodie',
        deliverTime: 'Estimated Delivery By 7 Sep 2023',
        orderType: 'Order Confirmed'),
    OrderList(
        orderNo: '223344444567',
        date: '31 August 2023,11:30pm',
        item: 'Cream hoodie',
        deliverTime: 'Estimated Delivery By 7 Sep 2023',
        orderType: 'Order Cancelled'),
    OrderList(
        orderNo: '223344444567',
        date: '31 August 2023,11:30pm',
        item: 'Cream hoodie',
        deliverTime: 'Estimated Delivery By 7 Sep 2023',
        orderType: 'Order Completed'),
    OrderList(
        orderNo: '223344444567',
        date: '31 August 2023,11:30pm',
        item: 'Cream hoodie',
        deliverTime: 'Estimated Delivery By 7 Sep 2023',
        orderType: 'Order Completed')
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(children: [backButton(context), TabTitlesSide(translation(context).txtMyOrders)]),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => itemOrders(context, orderList,index),
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: AllDimension.five,
        ),
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: orderList.length,
        shrinkWrap: true,
      ),
    );
  }

  Widget itemOrders(BuildContext context, List<OrderList> list,int index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AllDimension.twelve),
      margin: EdgeInsets.only(top: AllDimension.ten),
      child: customBoxContainer(
        () => Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        child: Text(
                          "Order No",
                          style: TextStyle(
                            color: AllColors.textGreyColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: AllString.fontLato,
                          ),
                        ),
                        alignment: Alignment.topLeft),
                    Text(
                     list[index].orderNo.toString(),
                      style: TextStyle(
                        color: AllColors.blackColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        fontFamily: AllString.fontLato,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, PageConstants.ordersDtlScreen,arguments: list[index].orderType.toString());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AllColors.greyLightColor,
                        borderRadius: BorderRadius.circular(4),
                        border:
                            Border.all(width: 0.5, color: AllColors.textGreyColor)),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                      child: Text(
                        "Order Details",
                        style: TextStyle(
                          color: AllColors.textGreyColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: AllString.fontLato,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: AllDimension.five,
            ),
            Align(
              child: Text(
                "PLACED DATE",
                style: TextStyle(
                  color: AllColors.textGreyColor2,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: AllString.fontLato,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            Align(
              child: Text(
                list[index].date.toString(),
                style: TextStyle(
                  color: AllColors.blackColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  fontFamily: AllString.fontLato,
                ),
              ),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: AllDimension.eight,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AllDimension.four),
                  child: Image.asset(
                    AllImages.hoddes2,
                    width: 67,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text(
                          list[index].item.toString(),
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            fontFamily: AllString.fontLato,
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Align(
                        child: Text(
                          list[index].deliverTime.toString(),
                          style: TextStyle(
                            color: AllColors.black3Color,
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            fontFamily: AllString.fontLato,
                          ),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 10.0, // Adjust the size as needed
                            height: 10.0, // Adjust the size as needed
                            decoration: BoxDecoration(
                              color: list[index].orderType == 'Order Confirmed'
                                  ? AllColors.accentColor
                                  : list[index].orderType == 'Order Cancelled'
                                  ? AllColors.redColor
                                  : AllColors.blueDeepColor,
                              // Set the color to green
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            list[index].orderType.toString(),
                            style: TextStyle(
                              color: list[index].orderType == 'Order Confirmed'
                                  ? AllColors.accentColor
                                  : list[index].orderType == 'Order Cancelled'
                                  ? AllColors.redColor
                                  : AllColors.blueDeepColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              fontFamily: AllString.fontLato,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
