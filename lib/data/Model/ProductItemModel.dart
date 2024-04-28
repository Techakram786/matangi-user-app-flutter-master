class ProductItemModel<T>{
  String? title;
  List<dynamic> des;

  ProductItemModel({required this.title,required this.des});
}

class ProductReview{
  String? avgRating;
  String? ratingReview;
  String? proImg;

}