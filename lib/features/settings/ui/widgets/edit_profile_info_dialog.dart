import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/details_text_field.dart';
import 'package:eshop/common/app_widgets/phone_text_field.dart';
import 'package:eshop/common/utils/other_utils/on_changed_functions.dart';
import 'package:eshop/common/utils/other_utils/usefull_functions.dart';
import 'package:eshop/common/utils/other_utils/validators.dart';
import 'package:flutter/material.dart';

class EditProfileInfoDialog extends StatefulWidget {
  final String fieldName;
  final String title;
  final void Function(String, String) editProfileInfo;

  const EditProfileInfoDialog(
      {super.key,
      required this.fieldName,
      required this.editProfileInfo,
      required this.title});

  @override
  State<EditProfileInfoDialog> createState() => _EditProfileInfoDialogState();
}

class _EditProfileInfoDialogState extends State<EditProfileInfoDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    ThemeData theme = Theme.of(context);

    void handleEdit() {
      if (_formKey.currentState!.validate()) {
        widget.editProfileInfo(widget.fieldName, textController.text.trim());
        Navigator.pop(context);
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Edit your ${widget.title}',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 16),
                  widget.fieldName == 'phoneNumber'
                      ? PhoneTextField(
                          controller: textController, isProfile: true)
                      : DetailsTextField(
                          keyboardType: widget.fieldName == 'dateOfBirth'
                              ? TextInputType.numberWithOptions()
                              : null,
                          maxLength:
                              widget.fieldName == 'dateOfBirth' ? 10 : null,
                          onChanged: widget.fieldName == 'dateOfBirth'
                              ? (value) =>
                                  onDateOfBirthChanged(value, textController)
                              : null,
                          focus: textFocus,
                          controller: textController,
                          autofocus: true,
                          hintText: 'enter the new ${widget.title} ',
                          textInputAction: TextInputAction.next,
                          validator: widget.fieldName == 'dateOfBirth'
                              ? Validators.validateDateOfBirth
                              : (widget.fieldName == 'userName')
                                  ? Validators.validateUsername
                                  : null,
                          suffixIcon: widget.fieldName == 'dateOfBirth'
                              ? IconButton(
                                  onPressed: () async {
                                    // Open the date picker
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime(1900), // Earliest date
                                      lastDate: DateTime.now(), // Latest date
                                    );
                                    if (pickedDate != null) {
                                      String formattedDate =
                                          dateToString(pickedDate);
                                      textController.text = formattedDate;
                                    }
                                  },
                                  icon: Icon(Icons.calendar_today_rounded),
                                )
                              : null,
                        ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                      SizedBox(
                        width: 10,
                      ),
                      CustomButton(
                        theme: theme,
                        onPressed: handleEdit,
                        child: Text('Edit'),
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
