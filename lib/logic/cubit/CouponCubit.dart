
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/CouponState.dart';

import '../../data/Model/BagModel.dart';

class CouponCubit extends Cubit<CouponState>{
  List<CouponModel> couponList = [];
  CouponCubit() : super(InitialState()){
    couponData();
  }
static CouponCubit get(context) => BlocProvider.of(context);



  void couponData() {
    couponList=[
      CouponModel(
          dicount: '10',
          offertype: 'Personal offer',
          promocode: 'mypromocode2020',
          reamingTime: '6 days remaining',
          colorType: 'green'
      ),
      CouponModel(
          dicount: '15',
          offertype: 'Summer Sale',
          promocode: 'summer2020',
          reamingTime: '23 days remaining',
          colorType: 'black'
      ),
      CouponModel(
          dicount: '10',
          offertype: 'Personal offer',
          promocode: 'mypromocode2020',
          reamingTime: '6 days remaining',
          colorType: 'green'
      ),
      CouponModel(
          dicount: '15',
          offertype: 'Summer Sale',
          promocode: 'summer2020',
          reamingTime: '23 days remaining',
          colorType: 'black'
      ),

    ];
    emit(SuccessState());

  }
}