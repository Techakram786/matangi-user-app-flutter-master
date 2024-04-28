abstract class DashboardStates{}

class InitialState extends DashboardStates{}

class ChangeBottomNavState extends DashboardStates{
  final int selectedIndex;
  ChangeBottomNavState(this.selectedIndex);
}
class ChangeTapState extends DashboardStates{
  final int selectedIndex;
  ChangeTapState(this.selectedIndex);
}
class ChangeBannerState extends DashboardStates{
  ChangeBannerState();
}
class ChangeSliderState extends DashboardStates{

}
class HomeSuccessState extends DashboardStates{
}

class ShopSuccessState extends DashboardStates{
}
class BagSuccessState extends DashboardStates{
}
class CouponSuccessState extends DashboardStates{
}
class FavSuccessState extends DashboardStates{
}
class ProfileSuccessState extends DashboardStates{
}
