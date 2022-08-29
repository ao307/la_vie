import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/layout/home_layout/home_layout.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/auth_button.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/auth_text_form_field.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/social_auth_button.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../../shared/cubit/auth_cubit/auth_cubit.dart';
import '../../../shared/cubit/auth_cubit/auth_states.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: authCubit.signUpForm,
            child: Column(
              children: [
                const SizedBox(height: paddingSmall),
                // name
                Row(
                  children: [
                    Expanded(
                      child: AuthTextFormField(
                        labelText: 'first name',
                        hintText: 'enter your first name',
                        textEditingController: authCubit.firstNameController,
                        validator: (value) {
                          return validateName(value, 'first');
                        },
                      ),
                    ),
                    const SizedBox(
                      width: paddingLarge,
                    ),
                    Expanded(
                      child: AuthTextFormField(
                        labelText: 'last name',
                        hintText: 'enter your last name',
                        textEditingController: authCubit.lastNameController,
                        validator: (value) {
                          return validateName(value, 'last');
                        },
                      ),
                    ),
                  ],
                ),
                // email text field
                AuthTextFormField(
                  labelText: 'email',
                  hintText: 'enter your email',
                  textEditingController: authCubit.signUpEmailController,
                  validator: (value) {
                    return validateEmail(value);
                  },
                ),
                // password text field
                AuthTextFormField(
                  labelText: 'password',
                  hintText: 'enter your password',
                  textEditingController: authCubit.signUpPasswordController,
                  validator: (value) {
                    return validatePassword(value);
                  },
                  obscure: authCubit.isPassword,
                  suffixIcon: IconButton(
                    icon: FaIcon(
                      authCubit.isPassword
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                    ),
                    onPressed: () {
                      authCubit.changePasswordVisibility();
                    },
                  ),
                ),
                AuthTextFormField(
                  labelText: 'confirm password',
                  hintText: 'enter your password',
                  textEditingController:
                      authCubit.signUpConfirmPasswordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'enter confirm password'.tr().toCapitalized();
                    } else if (authCubit.signUpConfirmPasswordController.text !=
                        authCubit.signUpPasswordController.text) {
                      return 'password not match'.tr().toCapitalized();
                    }
                    return null;
                  },
                  obscure: authCubit.isPassword,
                ),
                // login button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: paddingSmall,
                  ),
                  child: AuthButton(
                    onPressed: () {
                      if (authCubit.signUpForm.currentState!.validate()) {
                        authCubit.signUpFun();
                      }
                    },
                    text: 'sign up'.tr().toUpperCase(),
                  ),
                ),
                // or
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: MyColors.cTextSubtitleLight,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: paddingSmall),
                      child: Text(
                        'or continue with'.tr(),
                        style: const TextStyle(
                          color: MyColors.cTextSubtitleLight,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: MyColors.cTextSubtitleLight,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                // social button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        ImagesInAssets.googleImage,
                        width: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        authCubit.changeIndexOfTap(0);
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.facebookF,
                        color: MyColors.cFacebookColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ]
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: paddingSmall - 2,
                      ),
                      child: e,
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
