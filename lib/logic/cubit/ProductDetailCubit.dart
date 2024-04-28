import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/ProductDetailState.dart';

import '../../CustomClass/AllImages.dart';
import '../../data/Model/ProductDetailModel.dart';

class ProductDetailCubit extends Cubit<ProductDetailState>{
  List<ProductImg> sliderList = [];
  List<String> colorList = [];
  List<String> sizeList = [];
  String productDes='';
  int sliderIndex = 0;
  ProductDetailCubit() : super(InitialState()){
    sliderData();

  }
  static ProductDetailCubit get(context) => BlocProvider.of(context);


  void selectItem(String type,bool value){
    emit(SelectColorState(type:type,isSelect: value));
  }
  void sliderData() {
    sliderList=[
      ProductImg(
          img: AllImages.productImg,

      ),
      ProductImg(
          img: AllImages.productImg,

      ),
      ProductImg(
          img: AllImages.productImg,

      ),
      ProductImg(
          img: AllImages.productImg,

      ),
    ];
    colorData();
    emit(SelectColorState(type:'color',isSelect: true));
  }
  void colorData(){

    colorList=['Red','Yellow','Green','Black','Blue','Violet',];
    sizeData();
    emit(SelectColorState(type:'size',isSelect: true));
  }
  void sizeData(){
    sizeList=['XS','S','M','L','XL','XXL'];
    productDesData();
  }
  void productDesData(){
    productDes='Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.';
  }

}