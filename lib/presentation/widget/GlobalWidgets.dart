
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/logic/cubit/DashboardCubit.dart';
import 'package:matangi_user_app/logic/cubit/ProductCubit.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';
import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';



double? globalHeight;
double? globalWidth;
   Widget backButton(BuildContext context){
    return Container(
      margin: EdgeInsets.all(AllDimension.ten),
      height: AllDimension.thirty,
      width: AllDimension.thirty,
      decoration: BoxDecoration(
        color: AllColors.greyLightColor,
        borderRadius: BorderRadius.all(Radius.circular(AllDimension.eight),),
      ),
      child: IconButton(
        icon: SvgPicture.asset(
          AllImages.backButton,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

   Widget TabTitles(String title) {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(title,
          style: TextStyle(
              fontSize: AllDimension.twentyTwo,
              fontFamily: AllString.fontLato,
              color: AllColors.blackColor, fontWeight: FontWeight.w800
          ),)
    );
  }
Widget TabTitlesSide(String title) {
  return Container(
      alignment: Alignment.topLeft,
      child: Text(title,
        style: TextStyle(
            fontSize: AllDimension.sixteen,
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor, fontWeight: FontWeight.w600
        ),
      )
  );
}
Widget headTitles(String title) {
  return Container(
      alignment: Alignment.topLeft,
      child: Text(title,
        style: TextStyle(
            fontSize: AllDimension.sixteen,
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor, fontWeight: FontWeight.w600
        ),)
  );
}

   Widget TabDes(String title) {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(title,

          style: TextStyle(
            fontSize: AllDimension.twelve,
            color: AllColors.textGreyColor, fontWeight: FontWeight.w400,

          ),
        )
    );
  }

Widget CatTitles(String title) {
  return Container(
      alignment: Alignment.topLeft,
      child: Text(title,
        style: TextStyle(
            fontSize: AllDimension.twenty,
            fontFamily: AllString.fontLato,
            color: AllColors.blackColor, fontWeight: FontWeight.w700
        ),
      )
  );
}
Widget headingViewAll() {
  return Container(
      alignment: Alignment.topLeft,
      child: Text('View all',
        style: TextStyle(
            fontSize: AllDimension.fifteen,
            color: AllColors.blackColor, fontWeight: FontWeight.w500
        ),)
  );
}


  Widget defaultFormField({
  required String hint,
  required int maxLenght,
  required TextEditingController controller,
  required TextInputType type,
    required FormFieldValidator<String>? onValidate,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  String? suffix,
    int? maxLine
}){
return TextFormField(
  keyboardType: type,
  maxLength: maxLenght,
  maxLines:maxLine ,
  controller: controller,
  onFieldSubmitted: (s) {
    onSubmit;
  },
  onChanged: onChanged,
  onTap: onTap,
  validator: onValidate,
  decoration: InputDecoration(
    hintText: hint,
    counterText: '',
    suffix: suffix != null ? SvgPicture.asset(suffix) : null,
    hintStyle: TextStyle(
        color: AllColors.dotIndicatorColor
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AllDimension.six),
      borderSide: BorderSide(
        color: AllColors.boderGreyColor,
        width: AllDimension.one,

      ),
    ),
    focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(AllDimension.six),
      borderSide: BorderSide(
        color: AllColors.accentColor,
        width: AllDimension.one,
      ),
    ),
    errorStyle: TextStyle(
      color: Colors.red, // Set the color for the error message text
    ),
      errorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(AllDimension.six),
        borderSide: BorderSide(
          color: Colors.red,
          width: AllDimension.one,
        ),
      ),
    focusedErrorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular(AllDimension.six),
      borderSide: BorderSide(
        color: Colors.red,
        width: AllDimension.one,
      ),
    ) ,
    contentPadding: EdgeInsets.symmetric(horizontal:AllDimension.fifteen,vertical:AllDimension.ten),

  ),
);

  }
   Widget defaultButton(
       BuildContext context,
      String buttonText,
      VoidCallback onPressed,) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AllColors.accentColor,
        // Replace with your desired color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              AllDimension.six), // Replace with your desired radius
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AllDimension.sixteen,
          vertical: AllDimension.ten,
        ),
        minimumSize: Size(double.infinity, AllDimension.zero),
      ),
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AllColors.whiteColor,
          fontSize: AllDimension.twenty,
          fontFamily: AllString.fontLato,
        ),
      ),
    );
  }



  Widget defaultOtpBox({
    required BuildContext context,
    required TextEditingController controller,
    FormFieldValidator<String>? onValidate,
    required ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmit,

  }){
     return SizedBox(
         height: AllDimension.fiftySix,
         width: AllDimension.fiftySix,
         child: TextFormField(
             style: Theme.of(context).textTheme.headline6,
             keyboardType: TextInputType.number,
             textAlign: TextAlign.center,
             inputFormatters: [
               LengthLimitingTextInputFormatter(1),
               FilteringTextInputFormatter.digitsOnly
             ],
             controller: controller,
             validator: onValidate,
             onChanged:onChanged,
             decoration: InputDecoration(
               hintText: '0',
               counterText: '',

               hintStyle: TextStyle(
                   color: AllColors.dotIndicatorColor
               ),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(AllDimension.six),
                 borderSide: BorderSide(
                   color: AllColors.boderGreyColor,
                   width: AllDimension.one,

                 ),
               ),
               focusedBorder: OutlineInputBorder(

                 borderRadius: BorderRadius.circular(AllDimension.six),
                 borderSide: BorderSide(
                   color: AllColors.accentColor,
                   width: AllDimension.one,
                 ),
               ),
               errorStyle: TextStyle(
                 color: Colors.red, // Set the color for the error message text
               ),
               errorBorder:OutlineInputBorder(
                 borderRadius: BorderRadius.circular(AllDimension.six),
                 borderSide: BorderSide(
                   color: Colors.red,
                   width: AllDimension.one,
                 ),
               ),
               focusedErrorBorder:OutlineInputBorder(
                 borderRadius: BorderRadius.circular(AllDimension.six),
                 borderSide: BorderSide(
                   color: Colors.red,
                   width: AllDimension.one,
                 ),
               ) ,


             ),

           ),

     );
  }

  SnackBar defaultSnackBar({
  required String title,
    required  String msg,
}){
     return SnackBar(
       backgroundColor: Colors.transparent,
       elevation: AllDimension.zero,
       content: Container(
           padding:  EdgeInsets.all(AllDimension.eight),
           decoration: BoxDecoration(
             color: AllColors.snackBarColor,
             boxShadow:  [
               BoxShadow(
                 color: AllColors.greyLightColor,
                 spreadRadius: AllDimension.two,
                 blurRadius: AllDimension.eight,
                 offset: Offset(AllDimension.two, AllDimension.two),
               )
             ],
             borderRadius: BorderRadius.circular(AllDimension.eight),
           ),
           child: Row(
             children: [
               // Icon(Icons.favorite, color: Colors.green ),
               Padding(
                 padding: EdgeInsets.only(left: AllDimension.eight),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Align(
                       alignment: Alignment.topLeft,
                       child: Text(title,
                           style: TextStyle(
                             fontSize: AllDimension.sixteen,
                             fontFamily: AllString.fontLato,
                             color: AllColors.accentColor,fontWeight: FontWeight.w600,
                           )),
                     ),
                     Text(msg,
                         maxLines: 2,
                         style: TextStyle(
                           fontSize: AllDimension.twelve,
                           color: AllColors.accentColor,fontWeight: FontWeight.w400,
                         )),
                   ],
                 ),
               ),

             ],
           )
       ),
     );

  }

Widget MyTab(BuildContext context, DashboardCubit cubit) {
  return Padding(
    padding:  EdgeInsets.all(AllDimension.twelve),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            context.read<DashboardCubit>().changeTab(0);
          },
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SvgPicture.asset(
                  AllImages.men,
                  color: cubit.tabIndex == 0
                      ? AllColors.accentColor
                      : AllColors.unSelectedItem,
                ),
              ),
              Text(
                AllString.hintMen,
                style: TextStyle(
                  fontSize: AllDimension.sixteen,
                  fontFamily: AllString.fontLato,
                  color: cubit.tabIndex == 0
                      ? AllColors.accentColor
                      : AllColors.unSelectedItem,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        Container(
          height: 30, // Adjust the height as needed
          width: 0.5, // Adjust the width of the vertical line
          color: AllColors.unSelectedItem, // Adjust the color
        ),
        InkWell(
          onTap: () {
            context.read<DashboardCubit>().changeTab(1);
          },
          child: Row(
            children: [
              SizedBox(width: 10),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SvgPicture.asset(
                  AllImages.women,
                  color: cubit.tabIndex == 1
                      ? AllColors.accentColor
                      : AllColors.unSelectedItem,
                ),
              ),
              Text(
                AllString.hintWomen,
                style: TextStyle(
                  fontSize: AllDimension.eighteen,
                  fontFamily: AllString.fontLato,
                  color: cubit.tabIndex == 1
                      ? AllColors.accentColor
                      : AllColors.unSelectedItem,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        Container(
          height: 30, // Adjust the height as needed
          width: 0.5, // Adjust the width of the vertical line
          color: AllColors.unSelectedItem, // Adjust the color
        ),

        InkWell(
          onTap: () {
            context.read<DashboardCubit>().changeTab(2);
          },
          child: Row(

            children: [
              SizedBox(width: 10),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: SvgPicture.asset(
                  AllImages.kid,
                  color: cubit.tabIndex == 2
                      ? AllColors.accentColor
                      : AllColors.unSelectedItem,
                ),
              ),
              Text(
                AllString.hintKid,
                style: TextStyle(
                  fontSize: AllDimension.eighteen,
                  fontFamily: AllString.fontLato,
                  color: cubit.tabIndex == 2
                      ? AllColors.accentColor
                      : AllColors.unSelectedItem,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget filter({required BuildContext context,required ProductCubit cubit,required int index,required VoidCallback onTap}){
     return InkWell(
       onTap: onTap,
       child: Row(
         children: [
           Container(
             padding: EdgeInsets.symmetric(vertical: 8,horizontal: 14),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.all(
                   Radius.circular(AllDimension.sixteen)),
               border: Border.all(
                 color: AllColors.boderGreyColor,
                 width: AllDimension.one,
               ),
             ),
             child: Row(
               children: [
                 SvgPicture.asset(
                     cubit.filterList[index].img.toString()
                 ),
                 SizedBox(width: 5,),
                 Text(cubit.filterList[index].title.toString(),
                   style: TextStyle(
                       fontSize: AllDimension.ten,
                       color: AllColors.black3Color,
                       fontWeight: FontWeight.w400
                   ),
                 )
               ],
             ),
           )
         ],
       ),
     );
}

Widget customBoxContainer( Widget Function() childWidget) {
  return Container(
    width: globalWidth!,
    padding: EdgeInsets.all(AllDimension.eight), // Use your own padding value if needed
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(AllDimension.six),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: AllDimension.twentyFive,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: childWidget(),
  );
}
Widget customBoxContainerOnlyTop( Widget Function() childWidget) {
  return Container(
    width: globalWidth!,
    padding: EdgeInsets.all(AllDimension.eight), // Use your own padding value if needed
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft:Radius.circular(AllDimension.six),topRight: Radius.circular(AllDimension.six)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: AllDimension.twentyFive,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: childWidget(),
  );
}
Widget billDtl(String title,String price,Color txtcolor){
  return  Row(
    mainAxisAlignment:
    MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        maxLines: 1,
        style: TextStyle(
          fontFamily: AllString.fontLato,
          color: AllColors.black3Color,
          fontSize: AllDimension.eleven,
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        price,
        maxLines: 1,
        style: TextStyle(
          fontFamily: AllString.fontLato,
          color:txtcolor,
          fontSize: AllDimension.twelve,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}