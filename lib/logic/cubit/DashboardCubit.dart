import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/CustomClass/AllImages.dart';
import 'package:matangi_user_app/data/Model/HomeModel.dart';
import 'package:matangi_user_app/data/Model/ProfileModel.dart';
import 'package:matangi_user_app/data/Model/ShopModel.dart';
import 'package:matangi_user_app/logic/cubit/state/DashboardState.dart';

import '../../data/Model/BagModel.dart';
import '../../data/Model/FavModel.dart';


class DashboardCubit extends Cubit<DashboardStates>{
  int bottomIndex = 0;
  int tabIndex = 0;
  int bannerIndex = 0;
   int sliderIndex = 0;
   List<HomeBannerModel> bannerList = [];
   List<HomeCategoryModel> categoryList = [];
   List<HomeNewModel> newList = [];
  List<HomeBannerModel> sliderList = [];
  List<HomeNewModel> saleList = [];
  List<ShopModel> shopCatList = [];
  List<SimilarModel> similarList = [];
  List<FavModel> favList = [];
  List<ProfileModel> profileList = [];

  static DashboardCubit get(context) => BlocProvider.of(context);

  DashboardCubit() : super(InitialState()){
    emit(ChangeBottomNavState(0));
    bannerData();
    categoryData();
    newData();
    sliderData();
    saleData();
  }


  void changeBottomTab(int newIndex) {
    bottomIndex = newIndex;
    emit(ChangeBottomNavState(newIndex));

    switch (newIndex) {
      case 0:
        emit(HomeSuccessState());
        break;
      case 1:
      shopCatData();
        break;
      case 2:
        similarData();
        break;
      case 3:
        favData();
        break;
      case 4:
        profileData();
        break;
    // ... other cases ...
      default:
      // Code to execute when no cases match
    }



  }


  void changeTab(int newIndex) {
    tabIndex = newIndex;
    emit(ChangeTapState(newIndex));
  }
  void changeBanner(int newIndex) {
    bannerIndex = newIndex;
    emit(ChangeBannerState());
  }
  void changeSlider(int newIndex) {
    sliderIndex = newIndex;
    emit(ChangeSliderState());
  }
  void bannerData() {
    bannerList=[
      HomeBannerModel(
          banner: AllImages.banner1,
          title: 'Fashion\nSale'
      ),
      HomeBannerModel(
          banner: AllImages.banner1,
          title: 'Fashion\nSale'
      ),
      HomeBannerModel(
          banner: AllImages.banner1,
          title: 'Fashion\nSale'
      ),
      HomeBannerModel(
          banner: AllImages.banner1,
          title: 'Fashion\nSale'
      ),
    ];
    emit(HomeSuccessState());

  }

  void categoryData() {
    categoryList=[
      HomeCategoryModel(
          title: 'Shirts',
        img: AllImages.shirt,
        isNew: false,

      ),
      HomeCategoryModel(
        title: 'Hoodies',
        img: AllImages.hoddies,
        isNew: true,

      ),
      HomeCategoryModel(
        title: 'Layers',
        img: AllImages.layers,
        isNew: false,

      ),
      HomeCategoryModel(
        title: 'Oversized',
        img: AllImages.oversized,
        isNew: true,

      ),
      HomeCategoryModel(
        title: 'Shorts',
        img: AllImages.short,
        isNew: false,

      ),
      HomeCategoryModel(
        title: 'Jens',
        img: AllImages.layers,
        isNew: false,

      ),
    ];
    emit(HomeSuccessState());

  }

  void newData() {
    newList=[
      HomeNewModel(
        title: 'Green Shirt',
        des: 'Teamspirit',
        img: AllImages.newImg1,
        isNew: true,
        star: 4,
        review: '(10)',
        price: '₹875',
        cutPrice:'₹1,800'
      ),
        HomeNewModel(
        title: 'White Shirt',
        des: 'Cotton',
        img: AllImages.newImg2,
        isNew: false,
        star: 3.5,
        review: '(19)',
        price: '₹1,200',
        cutPrice:'₹1,900'
       ),
      HomeNewModel(
          title: 'Black Shirt',
          des: 'Denim',
          img: AllImages.newImg1,
          isNew: false,
          star: 5,
          review: '(21)',
          price: '₹2,500',
          cutPrice:'₹5,700'
      ),
      HomeNewModel(
          title: 'Printed Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isNew: true,
          star: 3,
          review: '(15)',
          price: '₹2,500',
          cutPrice:'₹5,200'
      ),
    ];
    emit(HomeSuccessState());

  }

  void sliderData() {
    sliderList=[
      HomeBannerModel(
          banner: AllImages.slider1,
          title: 'Fashion\nSale'
      ),
      HomeBannerModel(
          banner: AllImages.slider1,
          title: 'Fashion\nSale'
      ),
      HomeBannerModel(
          banner: AllImages.slider1,
          title: 'Fashion\nSale'
      ),
      HomeBannerModel(
          banner: AllImages.slider1,
          title: 'Fashion\nSale'
      ),
    ];
    emit(HomeSuccessState());

  }
  void saleData() {
    saleList=[
      HomeNewModel(
          title: 'Yellow Hoodie',
          des: 'Denim',
          img: AllImages.sale1,
          isNew: false,
          star: 4,
          review: '(12)',
          price: '₹2200',
          cutPrice:'₹5,200',
          discount: "-15%"
      ),
      HomeNewModel(
          title: 'Multi Colour',
          des: 'Teamspirit',
          img: AllImages.sale2,
          isNew: false,
          star: 3.5,
          review: '(19)',
          price: '₹2500',
          cutPrice:'₹4,100',
          discount: "-21%"
      ),
      HomeNewModel(
          title: 'Black Shirt',
          des: 'Denim',
          img: AllImages.newImg1,
          isNew: false,
          star: 5,
          review: '(21)',
          price: '₹2,500',
          cutPrice:'₹5,700',
          discount: "-17%"
      ),
      HomeNewModel(
          title: 'Printed Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isNew: true,
          star: 3,
          review: '(15)',
          price: '₹2,500',
          cutPrice:'₹5,200',
          discount: "-15%"
      ),
    ];
    emit(HomeSuccessState());

  }

  void shopCatData() {
    shopCatList=[
      ShopModel(
          img: AllImages.hoddies,
        title: 'Hoodies'
      ),
      ShopModel(
          img: AllImages.shirt,
          title: 'Shirts'
      ),
      ShopModel(
          img: AllImages.shoes,
          title: 'Shoes'
      ),
      ShopModel(
          img: AllImages.accesories,
          title: 'Accessories'
      ),
      ShopModel(
          img: AllImages.jacket,
          title: 'Jackets'
      ),
      ShopModel(
          img: AllImages.oversized,
          title: 'Oversized Tshirts'
      ),
      ShopModel(
          img: AllImages.short,
          title: 'Skirts'
      ),
    ];
    emit(ShopSuccessState());

  }

  void similarData() {
    similarList=[
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
    ];
    emit(BagSuccessState());

  }

  void favData() {
    favList=[
      FavModel(
          title: 'Green Shirt',
          des: 'Teamspirit',
          img: AllImages.newImg1,
          isSlod: false,
          star: 4,
          review: '(10)',
          price: '₹875',
          cutPrice:'₹1,800'
      ),
      FavModel(
          title: 'White Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isSlod: false,
          star: 3.5,
          review: '(19)',
          price: '₹1,200',
          cutPrice:'₹1,900'
      ),
      FavModel(
          title: 'Black Shirt',
          des: 'Denim',
          img: AllImages.newImg1,
          isSlod: false,
          star: 5,
          review: '(21)',
          price: '₹2,500',
          cutPrice:'₹5,700'
      ),
      FavModel(
          title: 'Printed Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isSlod: true,
          star: 3,
          review: '(15)',
          price: '₹2,500',
          cutPrice:'₹5,200',
        soldMsg: 'Sorry, this item is currently sold out'
      ),
      FavModel(
          title: 'Printed Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isSlod: false,
          star: 3,
          review: '(15)',
          price: '₹2,500',
          cutPrice:'₹5,200'
      ),
      FavModel(
          title: 'Printed Shirt',
          des: 'Cotton',
          img: AllImages.newImg2,
          isSlod: false,
          star: 3,
          review: '(15)',
          price: '₹2,500',
          cutPrice:'₹5,200'
      ),
    ];
    emit(FavSuccessState());

  }
  void profileData() {
    profileList=[
      ProfileModel(title:'My Orders',des: 'Already have 12 orders', isNew: false, isNeworder: true),
      ProfileModel(title:'Address Book',des: '3 Saved Address', isNew: false, isNeworder: false),
      ProfileModel(title:'Refer a Friend',des: 'Refer & Get Bonus', isNew: true, isNeworder: false),
      ProfileModel(title:'My Wallet',des: 'All Transactions', isNew: false, isNeworder: false),
      ProfileModel(title:'Support',des: 'Quires', isNew: false, isNeworder: false),
      ProfileModel(title:'About Us',des: 'T&C,Privacy Policy', isNew: false, isNeworder: false),
      ProfileModel(title:'Settings',des: 'Alerts,Logout', isNew: false, isNeworder: false)
    ];
    emit(ProfileSuccessState());
  }
}

