
import 'package:eshop/common/app_widgets/buttom_nav_bar.dart';
import 'package:eshop/common/app_widgets/custom_search_bar.dart';
import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/features/home/notifiers/home_notifier.dart';
import 'package:eshop/features/home/ui/screens/search_screen_with_filter.dart';
import 'package:eshop/features/home/ui/widgets/discounts_section.dart';
import 'package:eshop/features/home/ui/widgets/popular_section.dart';
import 'package:eshop/models/userr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ',
                        style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                      ),
                      Selector<UserNotifier, Userr>(
                          selector: (_, notifier) => notifier. user,
                          builder: (_, user, __) {
                          return Text(
                             '${user.userName} !',
                            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20),
                          );
                        }
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, SearchScreenWithFilter.routeName),
                    child: CustomSearchBar(
                      hintText: 'Search for products',
                      active: false,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Selector<HomeNotifier, bool>(
                    selector: (_, notifier) => notifier.visibleFilter,
                    builder: (_, visibleFilter, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DiscountsSection(),
                          PopularSection(),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
