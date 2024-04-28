import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/OtpState.dart';



class OtpCubit extends Cubit<OtpState>{
  late Timer _timer;

  OtpCubit() : super(OtpState(30)) {
    _startTimer();

  }

  void _startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
          (timer) {
        if (state.seconds > 0) {
          emit(OtpState(state.seconds - 1)); // Emit the new state
        } else {
          _timer.cancel();
        }
      },
    );
  }

  void restartTimer() {
    _timer.cancel(); // Cancel the current timer
    emit(OtpState(30)); // Reset the state to the initial value
    _startTimer(); // Start a new timer
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}