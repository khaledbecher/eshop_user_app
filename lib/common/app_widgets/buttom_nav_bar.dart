import 'package:eshop/common/app_widgets/cart_icon_with_budge.dart';
import 'package:eshop/common/constants/app_constants.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    void handleItemPressed(int newIndex) {
      final notifier = Provider.of<NavigationNotifier>(context, listen: false);
      if (notifier.navItemIndex != newIndex) {
        final homeNotifier = Provider.of<HomeNotifier>(context, listen: false);
        homeNotifier.clearFilter();
        homeNotifier.setVisibleFilter(false);
        notifier.changeNavItemIndex(newIndex);
        Navigator.pushNamed(context, AppConstants.routes[newIndex]);
      }
    }

    return Selector<NavigationNotifier, int>(
        selector: (_, notifier) => notifier.navItemIndex,
        builder: (_, navItemIndex, __) {
          return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: CartIconWithBudge(),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: navItemIndex,
            onTap: handleItemPressed,
          );
        });
  }
}
