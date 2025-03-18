import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/details_text_field.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/success_dialog.dart';
import 'package:eshop/common/utils/other_utils/validators.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:eshop/features/authentification/ui/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({
    super.key,
  });

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final FocusNode currentPasswordFocus = FocusNode();
  final FocusNode newPasswordFocus = FocusNode();
  final FocusNode confirmNewPasswordFocus = FocusNode();
  bool visibleCurrentPassword = false;
  bool visibleNewPassword = false;
  bool visibleConfirmNewPassword = false;

  void toggleVisibleCurrentPassword() {
    setState(() {
      visibleCurrentPassword = !visibleCurrentPassword;
    });
  }

  void toggleVisibleNewPassword() {
    setState(() {
      visibleNewPassword = !visibleNewPassword;
    });
  }

  void toggleVisibleConfirmNewPassword() {
    setState(() {
      visibleConfirmNewPassword = !visibleConfirmNewPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    Future<void> handleConfirm() async {
      if (_formKey.currentState!.validate()) {
        final authNotifier = context.read<AuthNotifier>();
        final success = await authNotifier.changePassword(
            currentPassword: currentPasswordController.text,
            newPassword: newPasswordController.text);
        if (success) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (_) => SuccessDialog(
                  message: 'Your password has been changed successfully.'));
        }
      }
    }

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Change your password',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Current password',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  DetailsTextField(
                    controller: currentPasswordController,
                    focus: currentPasswordFocus,
                    textInputAction: TextInputAction.next,
                    obscureText: !visibleCurrentPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(newPasswordFocus);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        toggleVisibleCurrentPassword();
                      },
                      icon: Icon(
                        visibleCurrentPassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'New password',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  DetailsTextField(
                    controller: newPasswordController,
                    focus: newPasswordFocus,
                    textInputAction: TextInputAction.next,
                    obscureText: !visibleNewPassword,
                    validator: Validators.validatePassword,
                    onEditingComplete: () {
                      FocusScope.of(context)
                          .requestFocus(confirmNewPasswordFocus);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        toggleVisibleNewPassword();
                      },
                      icon: Icon(
                        visibleNewPassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Confirm the new password',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  DetailsTextField(
                    controller: confirmNewPasswordController,
                    focus: confirmNewPasswordFocus,
                    textInputAction: TextInputAction.done,
                    obscureText: !visibleConfirmNewPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (confirmNewPasswordController.text !=
                          newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        toggleVisibleConfirmNewPassword();
                      },
                      icon: Icon(
                        visibleConfirmNewPassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  buildProgressIndicator(theme, context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: theme.textTheme.bodyMedium!.copyWith(
                              color: theme.colorScheme.onSecondaryFixed),
                        ),
                      ),
                      CustomButton(
                        theme: theme,
                        onPressed: handleConfirm,
                        child: Text('Confirm'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
