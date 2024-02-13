import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/extensions/string_extension.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';

import 'package:flutter_boilerplate/src/widgets/primary_text_field.dart';
import 'package:flutter_boilerplate/src/widgets/single_text_widget.dart';
import '../../../base/extensions/scaffold_extension.dart';
import '../../../widgets/primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();
      // locator<AuthController>().loginApiCall(context: context);
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _getEmailTextField(),
              _addSpacing(25.0),
              _getContinueButton(),
            ],
          ),
        ),
      ).authContainerScaffold(context: context),
    );
  }

  Widget _addAppBarTitle() {
    return const SingleTextWidget(
      text: "Reset Your Password",
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

  Widget _getContinueButton() {
    return PrimaryButton(
      buttonColor: primaryColor,
      buttonText: "CONTINUE",
      onButtonClick: _onSubmit,
    );
  }
}
