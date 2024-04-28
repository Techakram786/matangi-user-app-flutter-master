

class OtpState{
  final int seconds;
  OtpState(this.seconds);
}
class OtpLoadingState extends OtpState {
  OtpLoadingState():super(0);
}


class OtpErrorState extends OtpState {
  final String errorMessage;

  OtpErrorState(this.errorMessage) : super(0);
}