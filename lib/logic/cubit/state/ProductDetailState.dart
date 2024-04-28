abstract class ProductDetailState {
  const ProductDetailState();
}

class InitialState extends ProductDetailState {}


class SuccessState extends ProductDetailState{

}
class ChangeSliderState extends ProductDetailState{

}
class SelectColorState extends ProductDetailState{
bool isSelect;
String type;
SelectColorState({required this.isSelect,required this.type});
}