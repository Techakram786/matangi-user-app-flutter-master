abstract class CreateProfileState {
  const CreateProfileState();
}

class InitialState extends CreateProfileState {}


class SubmitState extends CreateProfileState{

}
class CityDataState extends CreateProfileState {
  final List<String> data;
  final String selectedValue; // Add this property

  CityDataState(this.data, this.selectedValue);
}

