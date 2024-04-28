
class HomeBannerModel{
  String? banner;
  String? title;
  HomeBannerModel({required this.banner,this.title});
}

class HomeCategoryModel{
String? title;
String? img;
bool? isNew;
HomeCategoryModel({required this.title,required this.img,this.isNew});
}

class HomeNewModel{
  String? title;
  String? des;
  String? img;
  bool? isNew;
  double? star;
  String? review;
  String? price;
  String? cutPrice;
  String? discount;
  HomeNewModel({required this.title,required this.des,required this.img,this.isNew,required this.star,required this.review,required this.price,required this.cutPrice,this.discount});
}
