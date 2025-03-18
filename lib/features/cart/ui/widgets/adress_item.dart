import 'package:eshop/common/app_widgets/custom_widgets/bounce.dart';
import 'package:eshop/common/app_widgets/edit_adress_dialog.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/warning_dialog.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressItem extends StatefulWidget {
  final Adress adress;
  final bool isSelected;
  final void Function()? onPressed;

  const AdressItem(
      {super.key,
      required this.isSelected,
      required this.adress,
      this.onPressed});

  @override
  State<AdressItem> createState() => _AdressItemState();
}

class _AdressItemState extends State<AdressItem> {
  bool showDetails = false;

  void toggleShowDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    void deleteAdress() {
      final adressNotifier =
          Provider.of<AdressesNotifier>(context, listen: false);
      adressNotifier.removeAdress(widget.adress);
      Navigator.pop(context);
    }

    void handleEdit() {
      showDialog(
          context: context,
          builder: (_) => EditAdressDialog(adress: widget.adress));
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

    return AnimatedContainer(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      margin: EdgeInsets.only(bottom: 8),
      height: showDetails ? 130 : 60,
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
      duration: Duration(milliseconds: 200),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bounce(
              onPressed: widget.onPressed ?? () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 12),
                        // Payment method title
                        Text(
                          widget.adress.title!,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: toggleShowDetails,
                      icon: Icon(showDetails
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down)),
                  // Radio Button
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: widget.isSelected
                        ? Center(
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ),
            showDetails
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                            '${widget.adress.houseNumber} ${widget.adress.street},\n${widget.adress.city} ${widget.adress.postalCode},\n${widget.adress.country}'),
                      ),
                      IconButton(
                        onPressed: handleEdit,
                        icon: Icon(
                          Icons.edit,
                          color: theme.colorScheme.primary.withOpacity(.6),
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
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
