import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_text_field.dart';
import 'package:eshop/common/app_widgets/phone_text_field.dart';
import 'package:eshop/common/utils/other_utils/on_changed_functions.dart';
import 'package:eshop/common/utils/other_utils/validators.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:eshop/features/authentification/ui/screens/login_screen.dart';
import 'package:eshop/features/authentification/ui/widgets/auth_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final phoneFocus = FocusNode();
  final dateOfBirthFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final userNameFocus = FocusNode();
  final passwordConfirmationFocus = FocusNode();

  bool visiblePassword = false;
  bool visiblePasswordConfirmation = false;
  void toggleVisiblePassword() {
    setState(() {
      visiblePassword = !visiblePassword;
    });
  }

  void toggleVisiblePasswordConfirmation() {
    setState(() {
      visiblePasswordConfirmation = !visiblePasswordConfirmation;
    });
  }

  Future<void> submit() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final notifier = Provider.of<AuthNotifier>(context, listen: false);
      notifier.registerWithEmailAndPassword(
          context: context,
          userName: userNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
          phoneNumber: phoneController.text,
          dateOfBirth: dateOfBirthController.text);
    }
  }

  @override
  void initState() {
    emailFocus.addListener(() {});
    passwordFocus.addListener(() {});
    userNameFocus.addListener(() {});
    passwordConfirmationFocus.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    userNameFocus.dispose();
    passwordConfirmationFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Welcome Text
                        Text(
                          'Sign up!',
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Create a new account',
                          style: theme.textTheme.titleSmall!.copyWith(
                              color: theme.colorScheme.onSecondaryFixed),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        // username field
                        CustomTextField(
                          label: 'Username',
                          controller: userNameController,
                          focus: userNameFocus,
                          textInputAction: TextInputAction.next,
                          validator: Validators.validateUsername,
                        ),
                        SizedBox(height: 20),
                        PhoneTextField(
                          controller: phoneController,
                          isProfile: false,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Date of birth',
                          hintText: 'DD.MM.YYYY',
                          maxLength: 10,
                          onChanged:(value)=>onDateOfBirthChanged(value, dateOfBirthController),
                          controller: dateOfBirthController,
                          focus: dateOfBirthFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.datetime,
                          validator: Validators.validateDateOfBirth,
                          suffixIcon: IconButton(
                            onPressed: () async {
                              // Open the date picker
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900), // Earliest date
                                lastDate: DateTime.now(), // Latest date
                              );
                              if (pickedDate != null) {
                                // Format and set the selected date in the TextController
                                String formattedDate =
                                    '${pickedDate.day.toString().padLeft(2, '0')}.${pickedDate.month.toString().padLeft(2, '0')}.${pickedDate.year}';
                                dateOfBirthController.text = formattedDate;
                                FocusScope.of(context).requestFocus(emailFocus);
                              }
                            },
                            icon: Icon(Icons.calendar_today_rounded),
                          ),
                          onEditingComplete: () =>
                              FocusScope.of(context).requestFocus(emailFocus),
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Email',
                          controller: emailController,
                          focus: emailFocus,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.validateEmail,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          label: 'Password',
                          controller: passwordController,
                          focus: passwordFocus,
                          textInputAction: TextInputAction.next,
                          obscureText: !visiblePassword,
                          validator: Validators.validatePassword,
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(passwordConfirmationFocus);
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleVisiblePassword();
                            },
                            icon: Icon(
                              visiblePassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Password Field
                        CustomTextField(
                          label: 'Confirm password',
                          controller: passwordConfirmationController,
                          focus: passwordConfirmationFocus,
                          textInputAction: TextInputAction.done,
                          obscureText: !visiblePasswordConfirmation,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (passwordConfirmationController.text !=
                                passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null; // Validation passed
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              toggleVisiblePasswordConfirmation();
                            },
                            icon: Icon(visiblePasswordConfirmation
                                ? Icons.visibility_off_rounded
                                : Icons.visibility),
                          ),
                        ),
                        SizedBox(height: 30),

                        // Login Button
                        CustomButton(
                          theme: theme,
                          onPressed: submit,
                          verticalPadding: 12,
                          child: Text(
                            'Register',
                            style: theme.textTheme.titleLarge!
                                .copyWith(color: theme.colorScheme.onError),
                          ),
                        ),
                        SizedBox(height: 20),
                        buildProgressIndicator(theme, context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'You have an account?',
                              style: theme.textTheme.titleSmall!.copyWith(
                                  color: theme.colorScheme.onSecondaryFixed),
                              textAlign: TextAlign.center,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  LoginScreen.routeName,
                                );
                              },
                              child: Text(
                                'Login',
                                style: theme.textTheme.titleLarge,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }
}
