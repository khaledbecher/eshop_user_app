import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/details_text_field.dart';
import 'package:eshop/common/utils/interaction_utils/dialogs/info_dialog.dart';
import 'package:eshop/common/utils/other_utils/validators.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({
    super.key,
  });

  @override
  State<ForgotPasswordDialog> createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);
    Future<void> handleConfirm() async {
      if (_formKey.currentState!.validate()) {
        final authNotifier = context.read<AuthNotifier>();
        final success = await authNotifier.forgotPassword(
            email: emailController.text.trim());
        if (success) {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (_) => InfoDialog(
                    message:
                        'An email has been sent to\n${emailController.text}\nto reset your password.',
                    buttonText: 'Ok',
                  ));
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
                      'Reset your password',
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Enter your email',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 5),
                  DetailsTextField(
                    controller: emailController,
                    focus: emailFocus,
                    textInputAction: TextInputAction.done,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 16),
                  Selector<AuthNotifier, bool>(
                      selector: (BuildContext ctx, notifier) =>
                          notifier.forgotPasswordLoading,
                      builder: (_, isLoading, __) {
                        return AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          child: isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : SizedBox(),
                        );
                      }),
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
                        child: Text('Send email'),
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
