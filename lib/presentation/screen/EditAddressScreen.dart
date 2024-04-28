import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matangi_user_app/logic/cubit/EditAddressCubit.dart';
import 'package:matangi_user_app/logic/cubit/state/EditAddressState.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../routes/PageConstants.dart';
import '../widget/GlobalWidgets.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final TextEditingController mobileNoController = TextEditingController();
  List<String> stateItems = [
    'Andhra Pradesh',
    'Karnataka',
    'Maharashtra',
    'Bihar',
    'Goa',
  ];
 String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(AllString.txteditShippAdd)]),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(AllDimension.twelve),
          child: Column(
            children: [
              defaultFormField(
              hint: AllString.hintFullName,
              maxLenght: 15,
              controller: mobileNoController,
              type: TextInputType.text,

              onValidate: (String? value) {
              },
              onChanged: (String? value) {

              }
          ),
              SizedBox(height: AllDimension.ten,),
              defaultFormField(
                  hint: AllString.hintMobileNo,
                  maxLenght: 10,
                  controller: mobileNoController,
                  type: TextInputType.number,

                  onValidate: (String? value) {
                  },
                  onChanged: (String? value) {

                  }
              ),
              SizedBox(height: AllDimension.ten,),
              defaultFormField(
                  hint: AllString.hintAlternateMNumber,
                  maxLenght: 10,
                  controller: mobileNoController,
                  type: TextInputType.number,

                  onValidate: (String? value) {
                  },
                  onChanged: (String? value) {

                  }
              ),
              SizedBox(height: AllDimension.ten,),
              defaultFormField(
                  hint: AllString.hintADoorNo,
                  maxLenght: 20,
                  controller: mobileNoController,
                  type: TextInputType.text,

                  onValidate: (String? value) {
                  },
                  onChanged: (String? value) {

                  }
              ),
              SizedBox(height: AllDimension.ten,),
              defaultFormField(
                  hint: AllString.hintStreet,
                  maxLenght: 20,
                  controller: mobileNoController,
                  type: TextInputType.text,

                  onValidate: (String? value) {
                  },
                  onChanged: (String? value) {

                  }
              ),
              SizedBox(height: AllDimension.ten,),
              defaultFormField(
                  hint: AllString.hintPincode,
                  maxLenght: 6,
                  controller: mobileNoController,
                  type: TextInputType.text,

                  onValidate: (String? value) {
                  },
                  onChanged: (String? value) {

                  }
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
                    child: stateDropDown(context)

                ),
              ),
              SizedBox(height: AllDimension.fifteen,),
              defaultButton(context, AllString.txtSaveAdd,(){
                Navigator.pushReplacementNamed(context, PageConstants.shippingAddressScreen);
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget cityDropDown(BuildContext mContext) {
    return BlocBuilder<EditAddressCubit, EditAddressState>(
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
                AllString.hintCity,
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
                mContext.read<EditAddressCubit>().setSelectedCityData(value!);
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
  Widget stateDropDown(BuildContext mContext) {
    return DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              iconStyleData: IconStyleData(

                icon: SvgPicture.asset(
                  AllImages.dropDownBtn,
                ),
              ),
              hint: Text(
                AllString.hintState,
                style: TextStyle(
                  color: AllColors.black3Color,
                ),
              ),
              items: stateItems
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
              value: selectedValue,
              onChanged: (String? value) {
               setState(() {
                 selectedValue=value;
               });
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
}
