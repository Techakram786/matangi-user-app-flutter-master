import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matangi_user_app/logic/cubit/CouponCubit.dart';
import 'package:matangi_user_app/logic/cubit/DashboardCubit.dart';
import 'package:matangi_user_app/logic/cubit/EditAddressCubit.dart';
import 'package:matangi_user_app/logic/cubit/FilterCubit.dart';
import 'package:matangi_user_app/logic/cubit/ProductCubit.dart';
import 'package:matangi_user_app/logic/cubit/ProductDetailCubit.dart';
import 'package:matangi_user_app/logic/cubit/state/CouponState.dart';
import 'package:matangi_user_app/presentation/screen/WalletScreen.dart';
import 'package:matangi_user_app/presentation/screen/CmsScreen.dart';
import 'package:matangi_user_app/presentation/screen/NotificationScreen.dart';
import 'package:matangi_user_app/presentation/screen/ReferFriendScreen.dart';
import 'package:matangi_user_app/presentation/routes/animated_page_route.dart';
import 'package:matangi_user_app/presentation/screen/AboutUsScreen.dart';
import 'package:matangi_user_app/presentation/screen/CheckoutScreen.dart';
import 'package:matangi_user_app/presentation/screen/CreateProfileScreen.dart';
import 'package:matangi_user_app/presentation/screen/DashboardScreen.dart';
import 'package:matangi_user_app/presentation/screen/EditAddressScreen.dart';
import 'package:matangi_user_app/presentation/screen/EditProfileScreen.dart';
import 'package:matangi_user_app/presentation/screen/FaqScreen.dart';
import 'package:matangi_user_app/presentation/screen/FilterScreen.dart';
import 'package:matangi_user_app/presentation/screen/OrderDetailsScreen.dart';
import 'package:matangi_user_app/presentation/screen/OrderScreen.dart';
import 'package:matangi_user_app/presentation/screen/ProductDetailScreen.dart';
import 'package:matangi_user_app/presentation/screen/ProductScreen.dart';
import 'package:matangi_user_app/presentation/screen/ShippingAddressScreen.dart';
import 'package:matangi_user_app/presentation/screen/SuccessScreen.dart';
import 'package:matangi_user_app/presentation/screen/SupportScreen.dart';
import '../../logic/cubit/BoardingCubit.dart';
import '../../logic/cubit/CreateProfileCubit.dart';
import '../../logic/cubit/LanguageCubit.dart';
import '../../logic/cubit/OtpCubit.dart';
import '../../logic/cubit/SignInCubit.dart';
import '../screen/BoardingScreen.dart';
import '../screen/LanguageScreen.dart';
import '../screen/OtpScreen.dart';
import '../screen/SignInScreen.dart';
import '../screen/SplashScreen.dart';
import 'PageConstants.dart';


class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    final Object? key = settings.arguments;
    switch (settings.name) {
      case PageConstants.splashScreen:
        {
         return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, __, ___) => SplashScreen(),
           transitionsBuilder: (context, animation, secondaryAnimation, child) {
             return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.top);
           }
          );
        }
      case PageConstants.languageScreen:
        {

         return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, __, ___) {
              // Wrap the destination screen with BlocProvider.value
              return BlocProvider.value(
                value: LanguageCubit(), // Replace with your actual Cubit
                child: LanguageScreen(),
              );
            },
             transitionsBuilder: (context, animation, secondaryAnimation, child) {
               return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
             }
          );
        }
      case PageConstants.boardingScreen:
        {

          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) {
              // Wrap the destination screen with BlocProvider.value
              return BlocProvider.value(
                value: BoardingCubit(), // Replace with your actual Cubit
                child: BoardingScreen(),
              );
            },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.signInScreen:
        {

          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                // Wrap the destination screen with BlocProvider.value
                return BlocProvider.value(
                  value: SignInCubit(), // Replace with your actual Cubit
                  child: SignInScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.otpScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                // Wrap the destination screen with BlocProvider.value
                return BlocProvider.value(
                  value: OtpCubit(), // Replace with your actual Cubit
                  child:OtpScreen(myMobileNo: key.toString(),
                  ),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );

        }
      case PageConstants.profileScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                // Wrap the destination screen with BlocProvider.value
                return BlocProvider.value(
                  value: CreateProfileCubit(), // Replace with your actual Cubit
                  child:CreateProfileScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );

        }
      case PageConstants.dashboardScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                // Wrap the destination screen with BlocProvider.value
                return BlocProvider.value(
                  value: DashboardCubit(), // Replace with your actual Cubit
                  child:DashboardScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );

        }
      case PageConstants.productScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                // Wrap the destination screen with BlocProvider.value
                return BlocProvider.value(
                  value: ProductCubit(), // Replace with your actual Cubit
                  child:ProductScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.filterScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                return BlocProvider.value(
                  value: FilterCubit(),
                  child:FilterScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.productDtlScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                return BlocProvider.value(
                  value: ProductDetailCubit(),
                  child:ProductDetailScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.checkoutScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


               return CheckoutScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.shippingAddressScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return ShippingAddressScreen(type: key.toString());

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.editAddressScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {
                return BlocProvider.value(
                  value: EditAddressCubit(),
                  child:EditAddressScreen(),
                );
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.successScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return SuccessScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.ordersScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return OrderScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.ordersDtlScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return OrderDetailsScreen(orderType: key.toString(),);

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.walletScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return WalletScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.notificationScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return NotificationScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.supportScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return SupportScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.faqScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {


                return FaqScreen();

              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.referFriendScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {

                return ReferFriendScreen();
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.editProfileScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {

                return EditProfileScreen();
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.aboutUsScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {

                return AboutUsScreen();
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      case PageConstants.cmsScreen:
        {
          return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, __, ___) {

                return CmsScreen(type: key.toString());
              },
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return animatedPageRoute(animation: animation, child: child,navigationDirection: NavigationDirection.left);
              }
          );
        }
      default:
        return null;
    }
  }
}





