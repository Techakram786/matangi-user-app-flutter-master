abstract class EditAddressState {
  const EditAddressState();
}

class InitialState extends EditAddressState {}


class SubmitState extends EditAddressState{

}
class CityDataState extends EditAddressState {
  final List<String> data;
  final String selectedValue; // Add this property

  CityDataState(this.data, this.selectedValue);
}

class StateDataState extends EditAddressState {
  final List<String> data;
  final String selectedValue; // Add this property

  StateDataState(this.data, this.selectedValue);
}

