import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../../data/Model/ShippingAddressModel.dart';
import '../widget/GlobalWidgets.dart';

class ShippingAddressScreen extends StatelessWidget {
  final String? type;
   ShippingAddressScreen({Key? key, this.type}) : super(key: key);
  List<ShippingAddressModel> address = [
    ShippingAddressModel(
      name:'Yeswanth',
      address:'1-50/1,Sakurru,Vinayaka Temple , Amalapuram, Konaseema',
        pNo:'Ph no: 6309661763,9010266086',
        defaultAdd:true
    ),
    ShippingAddressModel(
        name:'Somaraju',
        address:'1-50/1,Sakurru,Vinayaka Temple , Amalapuram, Konaseema',
        pNo:'Ph no: 6309661763,9010266086',
        defaultAdd:false
    ),
    ShippingAddressModel(
        name:'Venkatesh',
        address:'1-50/1,Sakurru,Vinayaka Temple , Amalapuram, Vizag',
        pNo:'Ph no: 6309661763,9010266086',
        defaultAdd:false
    ),
    ShippingAddressModel(
        name:'Raghava',
        address:'1-50/1,Sakurru,Vinayaka Temple , Amalapuram, Vizag',
        pNo:'Ph no: 6309661763,9010266086',
        defaultAdd:false
    )
   ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: AllColors.whiteColor,
      automaticallyImplyLeading: false,
      titleSpacing: AllDimension.zero,
      title: Row(
          children: [backButton(context), TabTitlesSide(type!)]),
    ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, PageConstants.editAddressScreen);
      },
        child: Icon(Icons.add,
          color: AllColors.whiteColor,
          size: 24,),
        shape: CircleBorder(),
        backgroundColor: AllColors.accentColor,
        mini: true,
      ),

      body: Padding(
        padding: EdgeInsets.only(top: AllDimension.twelve,),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: AllDimension.twelve),
                child: title(AllString.txtShippingAddress)),
            SizedBox(height: AllDimension.ten,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    itemAddress(context,index),
                separatorBuilder:
                    (BuildContext context, int index) => SizedBox(
                  height: AllDimension.five,
                ),
                physics: PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: address.length,
                shrinkWrap: true,
              ),
            ),

          ],
        ),
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

  Widget itemAddress(BuildContext context,int index){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AllDimension.twelve,vertical: AllDimension.five),
      child: customBoxContainer(() =>
          Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address[index].name.toString(),
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
                      Navigator.pushNamed(context, PageConstants.editAddressScreen);
                    },
                    child: Text(
                      AllString.txtEdit,
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
                  address[index].address.toString(),
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
                  address[index].pNo.toString(),
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: AllString.fontLato,
                    color: AllColors.textGreyColor,
                    fontSize: AllDimension.ten,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Checkbox(
                      value: address[index].defaultAdd as bool,
                      visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity,vertical: VisualDensity.minimumDensity),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {}),
                  Text(
                    AllString.txtdefaultAdd,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: AllString.fontLato,
                      color: address[index].defaultAdd as bool?AllColors.black3Color:AllColors.textGreyColor,
                      fontSize: AllDimension.twelve,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                ],
              )
            ],
          )
      ),
    );
  }
}
