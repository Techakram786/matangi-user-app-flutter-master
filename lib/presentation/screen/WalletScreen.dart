import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../data/Model/WalletModel.dart';
import '../widget/GlobalWidgets.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});
  List<RecentTransactionModel> recentlist=[
    RecentTransactionModel(orderId: 'Order ID: 233444256562', time: '10 mins ago', amout: '-₹500', pType: 'debit'),
    RecentTransactionModel(orderId: 'Order ID: 233444256562', time: '10 mins ago', amout: '-₹2500', pType: 'debit'),
    RecentTransactionModel(orderId: 'Added Money to Wallet', time: '10 mins ago', amout: '+₹8500', pType: 'credit'),
    RecentTransactionModel(orderId: 'Added Money to Wallet', time: '10 mins ago', amout: '+₹5000', pType: 'credit'),
    RecentTransactionModel(orderId: 'Order ID: 233444256562', time: '10 mins ago', amout: '-₹800', pType: 'debit'),
    RecentTransactionModel(orderId: 'Added Money to Wallet', time: '10 mins ago', amout: '+₹5000', pType: 'credit'),
    RecentTransactionModel(orderId: 'Order ID: 233444256562', time: '10 mins ago', amout: '-₹800', pType: 'debit')
  ];
  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Container(
        width: AllDimension.oneThirtyFour,
        height: AllDimension.fourty,
        child: FloatingActionButton(
          onPressed: () {
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: AllColors.accentColor,
          child: Text(
            '+ ADD MONEY',
            maxLines: 1,
            style: TextStyle(
                color: AllColors.whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),),
      ),
      body: Column(
        children: [
          Container(
            width: globalWidth,
            height: globalHeight!/3,
            decoration: BoxDecoration(
              color: AllColors.accentColor,
              image: DecorationImage(
                image: AssetImage(
                  AllImages.banner_with_handrawn,

                ),
                fit: BoxFit.cover,
              ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AllDimension.twelve),
                  bottomRight: Radius.circular(AllDimension.twelve)
                )
            ),
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  titleSpacing: AllDimension.zero,
                  title: Row(children: [
                    backButton(context),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "My Wallet",
                          style: TextStyle(
                              fontSize: AllDimension.sixteen,
                              fontFamily: AllString.fontLato,
                              color: AllColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        )),
                    Spacer(),
                    Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.symmetric(horizontal: AllDimension.twelve),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.support_agent_sharp,
                          color: AllColors.accentColor,
                          size: 18,
                        )
                    ),
                  ]),
                ),
                SizedBox(height: AllDimension.twenty,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹12,000',
                      maxLines: 1,
                      style: TextStyle(
                        color: AllColors.whiteColor,
                        fontSize: AllDimension.thirtyThree,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "TOTAL BALANCE",
                      maxLines: 1,
                      style: TextStyle(
                        color: AllColors.whiteColor,
                        fontSize: AllDimension.twelve,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [

              Container(
                padding: EdgeInsets.only(left: AllDimension.twelve,top: AllDimension.twelve),
                alignment: Alignment.topLeft,
                child: Text(
                  'Recent Transactions',
                  maxLines: 1,
                  style: TextStyle(
                    color: AllColors.black3Color,
                    fontSize: AllDimension.twelve,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
               Container(
                 height: globalHeight!/1.68,
                 child: ListView.separated(
                    itemBuilder: (context, index) => itemOrders(context,index,recentlist[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                          height: AllDimension.ten,
                        ),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: recentlist.length,
                    shrinkWrap: true,
                  ),
               ),

            ],
          )

        ],
      ),
    );
  }

  Widget itemOrders(BuildContext context,int index,RecentTransactionModel recentTransactionModel) {
    return Container(
      padding: EdgeInsets.all(AllDimension.eight),
      margin: EdgeInsets.symmetric(horizontal: AllDimension.twelve),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AllDimension.six),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: AllDimension.four,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color:   recentTransactionModel.pType=='debit'?AllColors.redColor:AllColors.accentColor,
              shape: BoxShape.circle, // Make it circular
            ),
            child: Center(
              child: SvgPicture.asset(
                  recentTransactionModel.pType=='debit'?AllImages.bag2:AllImages.wallet),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recentTransactionModel.orderId.toString(),
                style: TextStyle(
                  color: AllColors.blackColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: AllString.fontLato,
                ),
              ),
              Text(
                recentTransactionModel.time.toString(),
                style: TextStyle(
                  color: AllColors.textGreyColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: AllString.fontLato,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            recentTransactionModel.amout.toString(),
            style: TextStyle(
              color:   recentTransactionModel.pType=='debit'?AllColors.redColor:AllColors.accentColor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontFamily: AllString.fontLato,
            ),
          ),
        ],
      ),
    );
  }
}
