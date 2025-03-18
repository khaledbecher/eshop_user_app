import 'package:eshop/common/app_widgets/edit_adress_dialog.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/warning_dialog.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressCard extends StatelessWidget {
  final Adress adress;

  const AdressCard({super.key, required this.adress});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    void deleteAdress() {
      final adressNotifier =
          Provider.of<AdressesNotifier>(context, listen: false);
      adressNotifier.removeAdress(adress);
      Navigator.pop(context);
    }

    void handleEdit() {
      showDialog(
          context: context, builder: (_) => EditAdressDialog(adress: adress));
    }

    void handleDeletePressed() {
      showDialog(
        context: context,
        builder: (_) => WarningDialog(
          message: 'Are you sure you want to delete this adress ?',
          onActionPressed: deleteAdress,
          onCancelPressed: () => Navigator.pop(context),
          actionText: 'Delete',
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.onError,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 12),
                      // Payment method title
                      Text(
                        adress.title!,
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: handleEdit,
                  icon: Icon(
                    Icons.edit,
                    color: theme.colorScheme.primary.withOpacity(.6),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    '${adress.houseNumber} ${adress.street},\n${adress.city} ${adress.postalCode},\n${adress.country}',
                  ),
                ),
                IconButton(
                  onPressed: handleDeletePressed,
                  icon: Icon(
                    Icons.delete,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
