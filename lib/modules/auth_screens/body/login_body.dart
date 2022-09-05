import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/auth_button.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/auth_text_form_field.dart';
import 'package:la_vie/modules/auth_screens/auth_widgets/ritch_text_button_.dart';
import 'package:la_vie/shared/api/google_auth.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/image_assets.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

import '../../../shared/cubit/auth_cubit/auth_cubit.dart';
import '../../../shared/cubit/auth_cubit/auth_states.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

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
            key: authCubit.loginForm,
            child: Column(
              children: [
                const SizedBox(height: paddingSmall),
                // email text field
                AuthTextFormField(
                  labelText: 'email',
                  hintText: 'enter your email',
                  textEditingController: authCubit.loginEmailController,
                  validator: (value) {
                    return validateEmail(value);
                  },
                ),
                // password text field
                AuthTextFormField(
                  labelText: 'password',
                  hintText: 'enter your password',
                  obscure: authCubit.isPassword,
                  textEditingController: authCubit.loginPasswordController,
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'enter your password'.tr().toCapitalized();
                    }
                    return null;
                  },
                  // forgot password button
                  underWidget: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: ReuseTextButton(
                      text: 'forgot password?'.tr(),
                      onPressed: () {},
                    ),
                  ),
                ),
                // login button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: paddingMedium,
                  ),
                  child: AuthButton(
                    onPressed: () {
                      if (authCubit.loginForm.currentState!.validate()) {
                        authCubit.loginFun();
                      }
                    },
                    text: 'login'.tr().toUpperCase(),
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
                      onPressed: () {
                        authCubit.googleLoginFun();
                      },
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
                      padding: const EdgeInsets.only(bottom: paddingSmall),
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
