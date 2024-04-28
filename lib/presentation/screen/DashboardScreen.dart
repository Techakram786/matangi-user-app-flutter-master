import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/state/DashboardState.dart';
import 'package:matangi_user_app/presentation/widget/GlobalWidgets.dart';
import '../../CustomClass/AllColors.dart';
import '../../CustomClass/BottomTabItems.dart';
import '../../logic/cubit/DashboardCubit.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final _bottomTabItems = BottomTabItems();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: AllColors.whiteColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
        child: BlocBuilder<DashboardCubit, DashboardStates>(
          builder: (context, state) {
            var cubit = DashboardCubit.get(context);
              return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: cubit.bottomIndex,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AllColors.accentColor,
                  items: _bottomTabItems.allTabs(
                      cubit.bottomIndex),
                  onTap: (index) {
                    context.read<DashboardCubit>().changeBottomTab(
                        index); // Update the selected tab index
                  },
                ),
                body: _bottomTabItems.allBottomPages[cubit.bottomIndex] ,
              );

          },
        )
    );
  }
}
