import 'package:eshop/common/app_widgets/custom_widgets/custom_button.dart';
import 'package:eshop/common/app_widgets/custom_widgets/custom_text_field.dart';
import 'package:eshop/common/utils/other_utils/validators.dart';
import 'package:eshop/features/authentification/notifiers/auth_notifier.dart';
import 'package:eshop/features/authentification/ui/screens/register_screen.dart';
import 'package:eshop/features/authentification/ui/widgets/auth_widgets.dart';
import 'package:eshop/features/authentification/ui/widgets/forgot_password_dialog.dart';
import 'package:eshop/features/home/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool visiblePassword = false;

  void toggleVisiblePassword() {
    setState(() {
      visiblePassword = !visiblePassword;
    });
  }

  Future<void> submit() async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      final notifier = Provider.of<AuthNotifier>(context, listen: false);
      bool success = await notifier.signInWithEmailAndPassword(
          context, emailController.text.trim(), passwordController.text);
      if (success) {
        Navigator.popAndPushNamed(context, HomePage.routeName);
      }
    }
  }

  @override
  void initState() {
    emailFocus.addListener(() {});
    passwordFocus.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    emailController.dispose();
    passwordController.dispose();
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
          body: Center(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildLoginHeader(theme),
                      SizedBox(height: 30),
                      // Email Field
                      CustomTextField(
                        label: 'Email',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        focus: emailFocus,
                        textInputAction: TextInputAction.next,
                        validator: Validators.validateEmail,
                      ),
                      SizedBox(height: 20),

                      // Password Field
                      CustomTextField(
                        label: 'Password',
                        controller: passwordController,
                        focus: passwordFocus,
                        textInputAction: TextInputAction.done,
                        obscureText: !visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: toggleVisiblePassword,
                          icon: Icon(visiblePassword
                              ? Icons.visibility_off_rounded
                              : Icons.visibility),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      // Login Button
                      CustomButton(
                        theme: theme,
                        onPressed: submit,
                        verticalPadding: 12,
                        child: Text(
                          'Login',
                          style: theme.textTheme.titleLarge!
                              .copyWith(color: theme.colorScheme.onError),
                        ),
                      ),
                      SizedBox(height: 10),
                      buildProgressIndicator(theme, context),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'You don\'t have an account?',
                            style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onSecondaryFixed),
                            textAlign: TextAlign.center,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RegisterScreen.routeName,
                              );
                            },
                            child: Text(
                              'register',
                              style: theme.textTheme.titleLarge,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => ForgotPasswordDialog());
                        },
                        child: Text(
                          'Forgot your password?',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
