import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../../data/Model/NotificationModel.dart';
import '../widget/GlobalWidgets.dart';
class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});
   List<NotificationModel> listNotification=[
     NotificationModel(title: '50% Offer on Black Hoodies', des: 'Best Sale happening in this Month ', time: '1hr 20 min ago',nType:'normal' ),
     NotificationModel(title: 'Your Orders is on the way', des: 'Best Sale happening in this Month ', time: '1hr 20 min ago',nType:'order' ),
     NotificationModel(title: "100% Offer on Men's Shirts", des: 'Best Sale happening in this Month ', time: '1hr 20 min ago',nType:'normal' ),
     NotificationModel(title: "Your Order has been Delivered", des: 'Best Sale happening in this Month ', time: '1hr 20 min ago',nType:'order' ),
     NotificationModel(title: "20% Offer on Tshirts", des: 'Best Sale happening in this Month ', time: '1hr 20 min ago',nType:'normal' ),
   ];
  @override
  Widget build(BuildContext context) {
    globalHeight= MediaQuery.of(context).size.height;
    globalWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide("Notifications")]),
      ),
      body:Container(
        padding: EdgeInsets.all(12),
        color: AllColors.whiteColor,
        child: ListView.separated(
          itemBuilder: (context, index) =>
              itemOrders(context,index,listNotification[index]),
          separatorBuilder:
              (BuildContext context, int index) => SizedBox(
            height: AllDimension.ten,
          ),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: listNotification.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
   Widget itemOrders(BuildContext context,int index,NotificationModel notificationModel){
     return Container(
       width: globalWidth,
       padding: EdgeInsets.all(AllDimension.eight), // Use your own padding value if needed
       decoration: BoxDecoration(

         color: Colors.white,
         borderRadius: BorderRadius.circular(AllDimension.six),
         boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.2),
             spreadRadius: 0,
             blurRadius: AllDimension.twentyFive,
             offset: Offset(0, 2),
           ),
         ],
       ),
       child: Row(
         children: [
           Container(
             width: 50,
             height: 50,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               gradient: RadialGradient(
                 colors:notificationModel.nType=='normal' ? [
                   Color(0xFF7D5DD7), // Start color
                   Color(0xFF694FFF),
                 ]:[
                   Color(0xFF12CE94), // Start color
                   Color(0xFF43D9AA), // End color
                 ],
               ),
             ),
             child: Center(
               child: SvgPicture.asset(
                 notificationModel.nType=='normal'?AllImages.notification:AllImages.bag3,
                 color: AllColors.whiteColor,
               )
             ),
           ),
           SizedBox(width: 8,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(notificationModel.title.toString(),style: TextStyle(color: AllColors.blackColor,fontWeight: FontWeight.w600,fontSize: 14,fontFamily: AllString.fontLato,),),
               Text( notificationModel.des.toString(),style: TextStyle(color: AllColors.textGreyColor,fontWeight: FontWeight.w400,fontSize: 10,fontFamily: AllString.fontLato,),),
             ],
           ),
           Spacer(),
           Column(
             crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Container(
                 width: 10.0, // Adjust the size as needed
                 height: 10.0, // Adjust the size as needed
                 decoration: BoxDecoration(
                   color: AllColors.accentColor, // Set the color to green
                   shape: BoxShape.circle,
                 ),
               ),
               SizedBox(height: 4,),
               Text(notificationModel.time.toString(),style: TextStyle(color: AllColors.textGreyColor,fontWeight: FontWeight.w400,fontSize: 8,fontFamily: AllString.fontLato,),),
             ],
           ),
         ],
       ),
     );
   }
}
