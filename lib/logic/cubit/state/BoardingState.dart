

import '../../../data/Model/OnBoardingModel.dart';

abstract class BoardingState {
  const BoardingState();
}

class BoardingInitialState extends BoardingState {}
class BoardingInternetState extends BoardingState {}
class BoardingSuccessState extends BoardingState {
  final List<OnBoardingModel> boardingList;
  final int index;
  BoardingSuccessState(this.boardingList,this.index);
}
class BoardingonPageState extends BoardingState {
  final List<OnBoardingModel> boardingList;
  final int index;
  BoardingonPageState(this.boardingList,this.index);
}