
import 'package:eshop/common/app_widgets/buttom_nav_bar.dart';
import 'package:eshop/common/shared_notifiers/navigation_notifier.dart';
import 'package:eshop/features/favorites/notifiers/favorites_notifier.dart';
import 'package:eshop/features/favorites/ui/widgets/favorite_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites_screen';

  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) context.read<NavigationNotifier>().returnBack();
      },
      child: Scaffold(
        appBar: AppBar(leading: IconButton(
          onPressed: () {
            Provider.of<NavigationNotifier>(context, listen: false)
                .returnBack();
            Navigator.pop(context);
          },
          icon:
          Icon(Icons.arrow_back_outlined),
        ),
          title: Text(
             'Favorites',
            style: theme.textTheme.headlineLarge,
          ),
          centerTitle: true,
        ),
        body: Selector<FavoritesNotifier, List>(
            selector: (_, notifier) => notifier.favorites,
            builder: (_, favorites, __) {
              return favorites.isNotEmpty
                  ? ListView.builder(
                      itemCount: favorites.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FavoriteProductCard(
                          product: favorites[index],
                        );
                      },
                    )
                  : Center(
                      child: Text('No favorites available!',
                        style: theme.textTheme.titleLarge,
                      ),

                    );
            }),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
