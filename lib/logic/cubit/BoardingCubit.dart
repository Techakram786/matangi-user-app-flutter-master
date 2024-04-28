import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/BoardingState.dart';

import '../../CustomClass/AllImages.dart';
import '../../data/Model/OnBoardingModel.dart';
import 'InternetCubit.dart';


class BoardingCubit extends Cubit<BoardingState> {
  List<OnBoardingModel> boardingList = [];


  BoardingCubit() : super(BoardingInitialState()) {
    boardingList = boardingData(); // Assuming you have a function called boardingData to provide the list.

    if (boardingList.isNotEmpty) {
      onPageChange(0);
    }


  }

  void onPageChange(int index) {
    emit(BoardingSuccessState(boardingList, index));
  }
}


List<OnBoardingModel> boardingData() {
  return [
    OnBoardingModel(
        image: AllImages.boarding1, title: '<p>Welcome to <span style="color: #059669; margin: 0; padding: 0;">Matangi</span></p>',des:'interdum malesuada ante in scelerisque\nLoremipsum dolor sit amet consectetur.'),
    OnBoardingModel(
        image: AllImages.boarding2, title: '<p>Define Yourself <span style="color: #059669; margin: 0; padding: 0;">in a Unique</span></p>',des: 'interdum malesuada ante in scelerisque\nLoremipsum dolor sit amet consectetur.'),
    OnBoardingModel(
        image: AllImages.boarding3, title: '<p>Start your <span style="color: #059669; margin: 0; padding: 0;">Uniqueness</span></p>',des: 'interdum malesuada ante in scelerisque\nLoremipsum dolor sit amet consectetur.'),
  ];


}

