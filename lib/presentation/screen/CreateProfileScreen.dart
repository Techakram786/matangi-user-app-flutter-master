import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/logic/cubit/CreateProfileCubit.dart';
import 'package:matangi_user_app/logic/cubit/state/CreateProfileState.dart';
import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../../CustomClass/Language_constants.dart';
import '../routes/PageConstants.dart';
import '../widget/GlobalWidgets.dart';

class CreateProfileScreen extends StatelessWidget {
  CreateProfileScreen({Key? key}) : super(key: key);

  String? dropdownValue;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: backButton(context),
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimension.fifteen),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabTitles(translation(context).titProfile),
             TabDes(
                 translation(context).desProfile),
              SizedBox(height: AllDimension.fifteen,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AllDimension.six)),
                  border: Border.all(
                    color: AllColors.boderGreyColor,
                    width: AllDimension.one,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AllDimension.ten, right: AllDimension.ten),
                  child: TextField(
                    onChanged: (String newText) {

                    },
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                      // Set the maximum length to 10
                    ],
                    decoration: InputDecoration(
                        hintText: translation(context).hintName,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: AllColors.dotIndicatorColor
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: AllDimension.ten,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AllDimension.six)),
                  border: Border.all(
                    color: AllColors.boderGreyColor,
                    width: AllDimension.one,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AllDimension.ten, right: AllDimension.ten),
                  child: TextField(
                    onChanged: (String newText) {

                    },

                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      // Set the maximum length to 10
                    ],
                    decoration: InputDecoration(
                        hintText: translation(context).hintMobileNo,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: AllColors.dotIndicatorColor
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: AllDimension.ten,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AllDimension.six)),
                  border: Border.all(
                    color: AllColors.boderGreyColor,
                    width: AllDimension.one,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AllDimension.ten, right: AllDimension.ten),
                  child: TextField(
                    onChanged: (String newText) {

                    },

                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(20),
                      // Set the maximum length to 10
                    ],
                    decoration: InputDecoration(
                        hintText: translation(context).hintNEmail,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: AllColors.dotIndicatorColor
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: AllDimension.ten,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AllDimension.six)),
                  border: Border.all(
                    color: AllColors.boderGreyColor,
                    width: AllDimension.one,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AllDimension.ten, right: AllDimension.ten),
                  child: TextField(
                    onChanged: (String newText) {

                    },
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      // Set the maximum length to 10
                    ],
                    decoration: InputDecoration(
                        hintText: translation(context).hintGender,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: AllColors.dotIndicatorColor
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: AllDimension.ten,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AllDimension.six),
                  ),
                  border: Border.all(
                    color: AllColors.boderGreyColor,
                    width: AllDimension.one,
                  ),
                ),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: AllDimension.ten, right: AllDimension.ten),
                    child: cityDropDown(context)

                ),
              ),
              SizedBox(height: AllDimension.ten,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(AllDimension.six)),
                  border: Border.all(
                    color: AllColors.boderGreyColor,
                    width: AllDimension.one,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AllDimension.ten, right: AllDimension.ten),
                  child: TextField(
                    onChanged: (String newText) {},
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                      // Set the maximum length to 10
                    ],
                    decoration: InputDecoration(
                        hintText: translation(context).hintReferral,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                            color: AllColors.dotIndicatorColor
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: AllDimension.fifteen,),
              defaultButton(context, translation(context).registerNow,(){
                Navigator.pushNamed(context, PageConstants.dashboardScreen);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget cityDropDown(BuildContext mContext) {
    return BlocBuilder<CreateProfileCubit, CreateProfileState>(
      builder: (context, state) {
      if (state is CityDataState) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            iconStyleData: IconStyleData(

              icon: SvgPicture.asset(
                AllImages.dropDownBtn,
              ),
            ),
            hint: Text(
              translation(context).hintCity,
              style: TextStyle(
                color: AllColors.dotIndicatorColor,
              ),
            ),
            items: state.data
                .map((String item) =>
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                .toList(),
            value: state.selectedValue,
            onChanged: (String? value) {
              mContext.read<CreateProfileCubit>().setSelectedCityData(value!);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 0),
              height: 50,

            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 30,

            ),
            dropdownStyleData: DropdownStyleData(
                width: 200
            ),
          ),
        );
      }
      return Container();

      },
    );
  }
}
