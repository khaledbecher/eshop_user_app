import 'package:eshop/common/app_widgets/buttom_nav_bar.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/warning_dialog.dart';
import 'package:eshop/common/utils/services/local/post_logout_service.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:eshop/features/authentification/ui/screens/login_screen.dart';
import 'package:eshop/features/authentification/ui/widgets/auth_widgets.dart';
import 'package:eshop/features/settings/ui/screens/adresses_screen.dart';
import 'package:eshop/features/settings/ui/screens/orders_screen.dart';
import 'package:eshop/features/settings/ui/widgets/change_password_dialog.dart';
import 'package:eshop/features/settings/ui/widgets/dark_theme_item.dart';
import 'package:eshop/features/settings/ui/widgets/profile_details_box.dart';
import 'package:eshop/features/settings/ui/widgets/settings_item.dart';
import 'package:eshop/models/userr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings_screen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Future<void> logout() async {
      final success = await context.read<AuthNotifier>().logOut();
      if (success) {
        PostLogoutService.clearUserData(context);
      }
    }

    void handleLogout() {
      showDialog(
        context: context,
        builder: (_) => WarningDialog(
          message: 'Are you sure you want to logout?',
          actionText: 'Logout',
          onActionPressed: () {
            Navigator.pop(context);
            logout();
            Navigator.pushNamed(context, LoginScreen.routeName);
          },
        ),
      );
    }

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        final navigationNotifier =
            Provider.of<NavigationNotifier>(context, listen: false);
        navigationNotifier.returnBack();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: theme.colorScheme.onError,
        bottomNavigationBar: BottomNavBar(), // Include the BottomNavBar
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Selector<UserNotifier, Userr>(
                    selector: (_, notifier) => notifier.user,
                    builder: (_, user, __) {
                      return ProfileDetailsBox(
                        userr: user,
                      );
                    }),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onError,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.secondary,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SettingsItem(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => OrdersScreen())),
                        icon: Icons.local_shipping,
                        title: 'My orders',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      Divider(),
                      SettingsItem(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AdressesScreen()));
                        },
                        icon: Icons.location_on,
                        title: 'My adresses',
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                      Divider(),
                      DarkThemeItem(),
                      Divider(),
                      SettingsItem(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              ChangePasswordDialog(),
                        ),
                        icon: Icons.lock,
                        title: 'Change password',
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                buildProgressIndicator(theme, context),
                SizedBox(height: 15),
                CustomButton(
                  theme: theme,
                  verticalPadding: 15,
                  onPressed: handleLogout,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Logout ',
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: theme.colorScheme.onError),
                      ),
                      Icon(Icons.logout)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
