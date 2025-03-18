import 'package:eshop/features/settings/ui/widgets/edit_profile_info_dialog.dart';
import 'package:flutter/material.dart';

class ProfileRow extends StatelessWidget {
  final String title;
  final String value;
  final String fieldName;
  final bool? editable;

  final void Function(String, String)? onEdit;

  const ProfileRow(
      {super.key,
      required this.title,
      required this.value,
      this.onEdit,
      required this.fieldName,
      this.editable = true});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    void handleEdit() {
      showDialog(
        context: context,
        builder: (_) => EditProfileInfoDialog(
          fieldName: fieldName,
          editProfileInfo: onEdit ?? (String a, String b) {},
          title: title,
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: editable! ? 0.0 : 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.primary.withOpacity(0.7),
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.primary.withOpacity(0.6),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
          if (editable!)
            IconButton(
              onPressed: handleEdit,
              icon: Icon(
                Icons.edit,
              ),
            )
        ],
      ),
    );
  }
}
