import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/context_extension.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
// import 'package:flutter_boilerplate/src/base/utils/c+onstants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/controllers/auth/auth_controller.dart';
import 'package:flutter_boilerplate/src/models/auth/req_login_model.dart';
import 'package:flutter_boilerplate/src/ui/auth/forgotpassword/forgot_password.dart';
import 'package:flutter_boilerplate/src/ui/auth/signin/signup_screen.dart';
import 'package:flutter_boilerplate/src/ui/user/home_screen.dart';

import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/single_text_widget.dart';
import '../../../base/extensions/scaffold_extension.dart';
import '../../../base/utils/constants/fontsize_constant.dart';
import '../../../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      await locator<AuthController>().loginApiCall(
        context: context,
        model: ReqLoginModel(
          username: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  void _onCreateAccount() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SignupScreen(),
    ));
  }

  void _onForgotPassword() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ForgotPasswordScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: context.getHeight(0.86),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getLoginTitle(),
                    _addSpacing(50.0),
                    _getEmailTextField(),
                    _addSpacing(20.0),
                    _getPasswordTextField(),
                    _addSpacing(25.0),
                    _getLoginButton(),
                    _addSpacing(20.0),
                    _getForgotPasswordText(),
                  ],
                ),
              ),
              SizedBox(
                child: _getCreateAccountText(),
              ),
            ],
          ),
        ),
      ),
    ).authContainerScaffold(context: context);
  }

  Widget _getLoginTitle() {
    return const SingleTextWidget(
      text: "Login",
      textWeight: fontWeightMedium,
      textSize: fontSize26,
    );
  }

  Widget _addSpacing(value) {
    return SizedBox(height: value);
  }

  Widget _getEmailTextField() {
    return PrimaryTextField(
      hint: Localization.of().email,
      focusNode: _emailFocus,
      type: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _emailController,
      leadingIcon: Icons.email,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _emailFocus.unfocus();
        _passwordFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidEmail();
      },
    );
  }

  Widget _getPasswordTextField() {
    return PrimaryTextField(
      hint: Localization.of().password,
      focusNode: _passwordFocus,
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
      isObscureText: true,
      leadingIcon: Icons.lock,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _passwordFocus.unfocus();
      },
      validateFunction: (value) {
        return value!.isValidPassword();
      },
    );
  }

  Widget _getLoginButton() {
    return PrimaryButton(
      buttonColor: primaryColor,
      buttonText: "Login",
      onButtonClick: _onSubmit,
    );
  }

  Widget _getForgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: _onForgotPassword, child: const Text("Forgot Password?"))
      ],
    );
  }

  Widget _getCreateAccountText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SingleTextWidget(
          text: "Don't have an Account?",
          textWeight: fontWeightLight,
          textColor: Colors.black,
        ),
        TextButton(
          onPressed: _onCreateAccount,
          child: const Text("Create an Account"),
        )
      ],
    );
  }
}
