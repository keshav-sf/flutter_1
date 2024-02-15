import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
// import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/controllers/auth/auth_controller.dart';
import 'package:flutter_boilerplate/src/models/auth/req_signup_model.dart';
import 'package:flutter_boilerplate/src/ui/user/home_screen.dart';

import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/single_text_widget.dart';
// import 'package:flutter_boilerplate/src/widgets/single_text_widget.dart';
import '../../../base/extensions/scaffold_extension.dart';
import '../../../widgets/primary_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _tradeNameController = TextEditingController();
  final _crController = TextEditingController();
  final _cityController = TextEditingController();
  final _vatController = TextEditingController();

  final _fullNameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();
  final _tradeNameFocus = FocusNode();
  final _crFocus = FocusNode();
  final _cityFocus = FocusNode();
  final _vatFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String _oldpassword = "";

  void _onSubmit() async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      await locator<AuthController>().signupApiCall(
        context: context,
        model: ReqSignupModel(
          name: _fullNameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          tradename: _tradeNameController.text.trim(),
          commercialregistration: int.parse(_crController.text.trim()),
          address: _cityController.text.trim(),
          vatnumber: _vatController.text.trim(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.1),
        leading: _addAppBarIcon(),
        title: _addAppBarTitle(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getFullName(),
                _addSpacing(),
                _getEmailTextField(),
                _addSpacing(),
                _getPasswordTextField(),
                _addSpacing(),
                _getConfirmPasswordTextField(),
                _addSpacing(),
                _getTradeName(),
                _addSpacing(),
                _getCR(),
                _addSpacing(),
                _getCity(),
                _addSpacing(),
                _getVAT(),
                _addSpacing(value: 20.0),
                _getTandC(),
                _addSpacing(),
                _getSignupButton(),
                // _addSpacing(20.0),
              ],
            ),
          ),
        ),
      ).authContainerScaffold(context: context),
    );
  }

  Widget _addAppBarTitle() {
    return const SingleTextWidget(
      text: "Create an account",
      textWeight: fontWeightMedium,
      textSize: fontSize22,
      textColor: primaryColor,
    );
  }

  Widget _addAppBarIcon() {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: primaryColor,
      ),
    );
  }

  Widget _addSpacing({value = 10.0}) {
    return SizedBox(height: value);
  }

  Widget _getFullName() {
    return PrimaryTextField(
      hint: Localization.of().fullname,
      focusNode: _fullNameFocus,
      type: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: _fullNameController,
      leadingIcon: Icons.person_2_outlined,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _fullNameFocus.unfocus();
        _emailFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidFullName();
      },
    );
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
      textInputAction: TextInputAction.next,
      controller: _passwordController,
      isObscureText: true,
      leadingIcon: Icons.lock,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _passwordFocus.unfocus();
        _confirmPasswordFocus.requestFocus();
      },
      validateFunction: (value) {
        setState(() {
          _oldpassword = value!;
        });
        return value!.isValidPassword();
      },
    );
  }

  Widget _getConfirmPasswordTextField() {
    return PrimaryTextField(
      hint: Localization.of().confirmPassword,
      focusNode: _confirmPasswordFocus,
      type: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      controller: _confirmPasswordController,
      isObscureText: true,
      leadingIcon: Icons.lock,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _confirmPasswordFocus.unfocus();
        _tradeNameFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidConfirmPassword(_oldpassword);
      },
    );
  }

  Widget _getTradeName() {
    return PrimaryTextField(
      hint: Localization.of().tradeName,
      focusNode: _tradeNameFocus,
      type: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: _tradeNameController,
      leadingIcon: Icons.playlist_add_check,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _tradeNameFocus.unfocus();
        _crFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidtradeName();
      },
    );
  }

  Widget _getCR() {
    return PrimaryTextField(
      hint: Localization.of().cr,
      focusNode: _crFocus,
      type: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: _crController,
      leadingIcon: Icons.business_center,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _crFocus.unfocus();
        _cityFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidCR();
      },
    );
  }

  Widget _getCity() {
    return PrimaryTextField(
      hint: Localization.of().city,
      focusNode: _cityFocus,
      type: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: _cityController,
      leadingIcon: Icons.location_city,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _cityFocus.unfocus();
        _vatFocus.requestFocus();
      },
      validateFunction: (value) {
        return value!.isValidCity();
      },
    );
  }

  Widget _getVAT() {
    return PrimaryTextField(
      hint: Localization.of().vat,
      focusNode: _vatFocus,
      type: TextInputType.name,
      textInputAction: TextInputAction.done,
      controller: _vatController,
      leadingIcon: Icons.note_add_outlined,
      underlineBorder: false,
      onFieldSubmitted: (value) {
        _vatFocus.unfocus();
      },
      validateFunction: (value) {
        return value!.isValidVAT();
      },
    );
  }

  Widget _getTandC() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: () {},
          child: const SingleTextWidget(
            text:
                "By creating an account you agree to our Terms of Service and Privacy Policy",
            textSize: fontSize15,
            textAlign: TextAlign.center,
          )),
    );
  }

  Widget _getSignupButton() {
    return PrimaryButton(
      buttonColor: primaryColor,
      buttonText: "Sign Up",
      onButtonClick: _onSubmit,
    );
  }
}
