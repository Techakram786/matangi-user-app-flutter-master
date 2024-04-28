
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/FilterState.dart';

class FilterCubit extends Cubit<FilterState>{
  RangeValues sliderRange= RangeValues(500, 1500);
  List<String> colorList = [];
  List<String> sizeList = [];
  List<String> catList = [];
  List<String> ratingList = [];
  List<String> brandList = [];
  FilterCubit() : super(InitialState()){
    colorData();
    sizeData();
    catData();
    ratingData();
    brandData();
  }
static FilterCubit get(context) => BlocProvider.of(context);

  void changeSliderRange(RangeValues newValue){
    sliderRange=newValue;
    emit(ChangerangeState());
  }


  void colorData(){
    colorList=['Red','Yellow','Green','Black','Blue','Violet','Orange','White'];
  }
  void sizeData(){
    sizeList=['XS','S','M','L','XL','XXL','XXXL','4XL'];
  }
  void catData(){
    catList=['All','Men','Women','Girls','Boys','Kids'];
  }
  void ratingData(){
    ratingList=['5','4','3','2',];
  }
  void brandData(){
    brandList=['Teamspirit','DNMX','Roadster','Puma','Champion','Netplay'];
  }
  void buttonSelect(){
    emit(SelectBtnState());
  }

}