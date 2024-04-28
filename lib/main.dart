import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/CustomClass/AllColors.dart';
import 'package:matangi_user_app/logic/cubit/BoardingCubit.dart';
import 'package:matangi_user_app/logic/cubit/EditAddressCubit.dart';
import 'package:matangi_user_app/logic/cubit/FilterCubit.dart';
import 'package:matangi_user_app/logic/cubit/LanguageCubit.dart';
import 'package:matangi_user_app/logic/cubit/ProductCubit.dart';
import 'package:matangi_user_app/logic/cubit/ProductDetailCubit.dart';
import 'package:matangi_user_app/presentation/routes/PageConstants.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/BagScreen.dart';
import 'package:matangi_user_app/presentation/screen/WalletScreen.dart';
import 'package:matangi_user_app/presentation/screen/ReferFriendScreen.dart';
import 'package:matangi_user_app/presentation/routes/AppRoutes.dart';
import 'package:matangi_user_app/presentation/screen/AboutUsScreen.dart';
import 'package:matangi_user_app/presentation/screen/BoardingScreen.dart';
import 'package:matangi_user_app/presentation/screen/BottomPages/ShopScreen.dart';
import 'package:matangi_user_app/presentation/screen/CheckoutScreen.dart';
import 'package:matangi_user_app/presentation/screen/DashboardScreen.dart';
import 'package:matangi_user_app/presentation/screen/EditAddressScreen.dart';
import 'package:matangi_user_app/presentation/screen/EditProfileScreen.dart';
import 'package:matangi_user_app/presentation/screen/FaqScreen.dart';
import 'package:matangi_user_app/presentation/screen/FilterScreen.dart';
import 'package:matangi_user_app/presentation/screen/LanguageScreen.dart';
import 'package:matangi_user_app/presentation/screen/OrderDetailsScreen.dart';
import 'package:matangi_user_app/presentation/screen/OrderScreen.dart';
import 'package:matangi_user_app/presentation/screen/ProductDetailScreen.dart';
import 'package:matangi_user_app/presentation/screen/ProductScreen.dart';
import 'package:matangi_user_app/presentation/screen/ShippingAddressScreen.dart';
import 'package:matangi_user_app/presentation/screen/SplashScreen.dart';
import 'package:matangi_user_app/presentation/screen/SuccessScreen.dart';
import 'package:matangi_user_app/presentation/screen/SupportScreen.dart';
import 'package:matangi_user_app/presentation/widget/GlobalWidgets.dart';

import 'CustomClass/Language_constants.dart';
import 'logic/cubit/DashboardCubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'logic/cubit/InternetCubit.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRouter = AppRoutes();
  Locale? _locale;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ConnectivityCubit(Connectivity()),
      child: MaterialApp(
        title: 'Mantangi',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AllColors.accentColor,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: AllColors.accentColor),
          useMaterial3: true,
        ),
        // navigatorKey: navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
      /*child: BlocBuilder<ConnectivityCubit, ConnectivityStatus>(
        builder: (context, state) {
          if (state == ConnectivityStatus.connected) {
            var currentRootName = ModalRoute.of(context)?.settings.name;
            print('currentRootName $currentRootName');
            *//*Future.microtask(() {
              // Navigator.of(context).pop();
              // Navigator.of(context).popUntil((route) => route.isFirst);
            });*//*
           return MaterialApp(
              title: 'Mantangi',
              theme: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: AllColors.accentColor,
                ),
                colorScheme: ColorScheme.fromSeed(seedColor: AllColors.accentColor),
                useMaterial3: true,
              ),
              // navigatorKey: navigatorKey,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: _locale,
              onGenerateRoute: _appRouter.onGenerateRoute,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )*/


    );
  }
}














