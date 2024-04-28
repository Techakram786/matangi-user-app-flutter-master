class SimilarModel{
  String? title;
  String? des;
  String? img;
  bool? isNew;
  double? star;
  String? review;
  String? price;
  String? cutPrice;
  String? discount;
  SimilarModel({required this.title,required this.des,required this.img,this.isNew,required this.star,required this.review,required this.price,required this.cutPrice,this.discount});
}

class CouponModel{
  String? dicount;
  String? offertype;
  String? promocode;
  String? reamingTime;
  String? colorType;

  CouponModel({required this.dicount,required this.offertype,required this.promocode,required this.reamingTime,required this.colorType});
}