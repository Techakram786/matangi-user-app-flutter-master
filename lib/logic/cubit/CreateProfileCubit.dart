import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/CreateProfileState.dart';
import 'package:matangi_user_app/logic/cubit/state/SignInState.dart';


class CreateProfileCubit extends Cubit<CreateProfileState>{
  CreateProfileCubit() : super(InitialState()){
    cityData();
  }


  void cityData() {
    List<String> cityItems = [
      'City',
      'Delhi',
      'Mumbai',
      'Kolkata',
      'Bangalore',
    ];
    emit(CityDataState(cityItems, cityItems[0]));
  }
  void setSelectedCityData(String value) {
    // You should emit a new state with the selected value here
    emit(CityDataState((state as CityDataState).data, value));
  }
}