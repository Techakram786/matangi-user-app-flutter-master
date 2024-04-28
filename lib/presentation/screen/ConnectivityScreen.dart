import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/InternetCubit.dart';

/*class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityCubit, ConnectivityStatus>(
        builder: (context, state) {
          if(state == ConnectivityStatus.connected){
            Navigator.of(context).pop();
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}*/
