import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../../data/Model/Faqmodel.dart';
import '../widget/GlobalWidgets.dart';

class FaqScreen extends StatelessWidget {
   FaqScreen({Key? key}) : super(key: key);
   List<FaqModel> faqList=[
     FaqModel(title: 'What are Customer Care Number?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
     FaqModel(title: 'What is Cancellation Policy?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
     FaqModel(title: 'What is Return Policy?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
     FaqModel(title: 'How Delivery Time Is Calculated ?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
     FaqModel(title: 'Delivery Partner Related ?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
     FaqModel(title: 'Can we contact directly to Delivery Partner ?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"),
     FaqModel(title: 'How many days to delivery ?', des: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
   ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(AllString.txtfaq)]),
      ),
      body: Column(
        children: [
          SizedBox(height: AllDimension.ten,),
          SvgPicture.asset(
              AllImages.FAQbg,
            width: globalWidth,
            height: globalHeight!/2.8,
          ),
          Text(
              'We are here to Clarify the Doubts',
              maxLines: 1,
              style: TextStyle(
                fontFamily: AllString.fontLato,
                fontSize: AllDimension.fourteen,
                color: AllColors.blackColor,
                fontWeight: FontWeight.w700,
              )
          ),
          Text(
              'Here are some Main Quires.',
              maxLines: 1,
              style: TextStyle(
                fontFamily: AllString.fontLato,
                fontSize: AllDimension.fourteen,
                color: AllColors.blackColor,
                fontWeight: FontWeight.w700,
              )
          ),
          Divider(
            color: AllColors.greyLightColor,
            height: AllDimension.twenty,
          ),
          FaqList(faqList: faqList,),
          SizedBox(height: AllDimension.ten,)
        ],
      ),
    );
  }


}

class FaqList extends StatefulWidget {
 final List<FaqModel> faqList;
  const FaqList({Key? key, required this.faqList}) : super(key: key);

  @override
  State<FaqList> createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  List<bool> isExpandedList =[];
  List<FaqModel> faqList=[];
  @override
  void initState() {
    super.initState();
   faqList=  widget.faqList;
   isExpandedList= List.generate(faqList.length, (index) => false);
  }
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Padding(
          padding: EdgeInsets.all(AllDimension.twelve),
          child: ListView.separated(
            itemBuilder: (context, index) =>
                itemQueries(context,  index,isExpandedList[index],faqList[index]),
            separatorBuilder: (BuildContext context, int index) =>
                Divider(
                  color: AllColors.greyLightColor,
                  height: AllDimension.twenty,
                ),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: faqList.length,
            shrinkWrap: true,
          ),
        ),
      );

  }



  Widget itemQueries(BuildContext context,int index, bool isExpanded,FaqModel faqModel){
    return
      Column(
      children: [
        Row(
          children: [
            Text(
                faqModel.title.toString(),
                maxLines: 1,
                style: TextStyle(
                  fontFamily: AllString.fontLato,
                  fontSize: AllDimension.twelve,
                  color: AllColors.blackColor,
                  fontWeight: FontWeight.w600,
                )
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpandedList[index] = !isExpandedList[index];
                });
              },
              child: SvgPicture.asset(
                  isExpanded?AllImages.circleUp:AllImages.circleDown
              ),
            )
          ],
        ),
        if (isExpanded)
        Container(
          margin: EdgeInsets.only(right: AllDimension.twenty),
          child: Text(
              faqModel.des.toString(),
              maxLines: 5,
              style: TextStyle(
                fontSize: AllDimension.twelve,
                color: AllColors.blackColor,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
      ],
    );
  }
}

