import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/SignInState.dart';


class SignInCubit extends Cubit<SignInState>{
  bool verifyNo = false;
  SignInCubit() : super(SignInInitialState());
  static SignInCubit get(context) => BlocProvider.of(context);
  void verifyNumber(bool veriyStatus){
    verifyNo=veriyStatus;
    emit(SignInNumberVerifyState(veriyStatus));
  }
}