import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/data/Model/ProductModel.dart';
import 'package:matangi_user_app/logic/cubit/state/ProductState.dart';

import '../../data/Model/BagModel.dart';

class ProductCubit extends Cubit<ProductState>{
  List<FilterModel> filterList = [];
  List<SimilarModel> productList = [];
  List<String> sortByList = [];
  ProductCubit() : super(InitialState()){
    filterData();
    similarData();
  }
  static ProductCubit get(context) => BlocProvider.of(context);

  
  void filterData(){
    filterList=[
      FilterModel(title: 'Filter',img: AllImages.filter),
      FilterModel(title: 'Sort By',img: AllImages.sortBy),
      FilterModel(title: 'Top Rating'),
      FilterModel(title: 'Cost Type'),
    ];

    emit(SuccessState());
  }
  void sortByData(){
    sortByList=[
      'Popular','Newest','Price: lowest to high','Price: highest to low'
    ];

    emit(BottomSheetSuccessState());
  }
  void similarData() {
    productList=[
      SimilarModel(
          title: 'Green Shirt',
          des: 'Teamspirit',
          img: AllImages.newImg1,
          isNew: true,
          star: 4,
          review: '(10)',
          price: '₹875',
          cutPrice:'₹1,800'
      ),
      SimilarModel(
          title: 'White Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isNew: false,
          star: 3.5,
          review: '(19)',
          price: '₹1,200',
          cutPrice:'₹1,900',
          discount: '-15%'
      ),
      SimilarModel(
        title: 'Black Shirt',
        des: 'Denim',
        img: AllImages.newImg1,
        isNew: true,
        star: 5,
        review: '(21)',
        price: '₹2,500',
        cutPrice:'₹5,700',

      ),
      SimilarModel(
          title: 'Printed Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isNew: false,
          star: 3,
          review: '(15)',
          price: '₹2,500',
          cutPrice:'₹5,200',
          discount: '-18%'
      ),
      SimilarModel(
          title: 'Green Shirt',
          des: 'Teamspirit',
          img: AllImages.newImg1,
          isNew: true,
          star: 4,
          review: '(10)',
          price: '₹875',
          cutPrice:'₹1,800'
      ),
      SimilarModel(
          title: 'White Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isNew: false,
          star: 3.5,
          review: '(19)',
          price: '₹1,200',
          cutPrice:'₹1,900',
          discount: '-15%'
      ),
    ];
    emit(SuccessState());

  }
  void buttonSelect(){
    emit(SelectBtnState());
  }
}