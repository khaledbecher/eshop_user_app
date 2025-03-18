import 'package:eshop/common/app_widgets/addAdressButton.dart';
import 'package:eshop/common/app_widgets/adress_dialog.dart';
import 'package:eshop/common/shared_notifiers/adresses_notifier.dart';
import 'package:eshop/features/settings/ui/widgets/adress_card.dart';
import 'package:eshop/models/adress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdressesScreen extends StatelessWidget {
  const AdressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adresses',
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
       child: Selector<AdressesNotifier, List<Adress>>(
            selector: (_, notifier) => notifier.adresses,
            builder: (_, adresses, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                child: Column(
                  children: List.generate(
                      adresses.length + 1, (index) {
                    return index != adresses.length
                        ? AdressCard(
                        adress: adresses[index])
                        : Center(
                      child: Addadressbutton(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AddressDialog(),
                        ),
                      ),
                    );
                  }),
                ),
              );
            }),
      ),
    );
  }
}
