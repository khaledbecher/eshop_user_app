import 'package:eshop/common/shared_notifiers/user_notifier.dart';
import 'package:eshop/features/settings/ui/widgets/profile_row.dart';
import 'package:eshop/models/userr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileDetailsBox extends StatelessWidget {
  final Userr userr;

  final void Function()? onEditPressed;

  ProfileDetailsBox({super.key, required this.userr, this.onEditPressed});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    void editProfileInfo(String fieldName, String fieldValue) async {
      final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      userNotifier.editProfileInfo(fieldName, fieldValue);
    }

    return Container(
      padding: const EdgeInsets.all(12.0),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileRow(
            title: 'User Name',
            value: userr.userName!,
            onEdit: editProfileInfo,
            fieldName: 'userName',
          ),
          Divider(
            color: Colors.grey,
          ),
          ProfileRow(
            title: 'Email',
            value: userr.email!,
            fieldName: 'email',
            editable: false,
          ),
          Divider(
            color: Colors.grey,
          ),
          ProfileRow(
            title: 'Phone Number',
            value: userr.phoneNumber!,
            onEdit: editProfileInfo,
            fieldName: 'phoneNumber',
          ),
          Divider(
            color: Colors.grey,
          ),
          ProfileRow(
            title: 'Date of Birth',
            value: userr.dateOfBirth!,
            onEdit: editProfileInfo,
            fieldName: 'dateOfBirth',
          ),
        ],
      ),
    );
  }
}
