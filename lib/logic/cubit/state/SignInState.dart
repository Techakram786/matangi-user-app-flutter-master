abstract class SignInState {
  const SignInState();
}

class SignInInitialState extends SignInState {}

class SignInNumberVerifyState extends SignInState{
  final bool verify;
  SignInNumberVerifyState(this.verify);

}
