// packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_phone_textfield.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/pin_text_field.dart';
import 'package:wave_drive/core/shared/widgets/tab_bar/custom_selection_tab_bar.dart';
import 'package:wave_drive/core/shared/widgets/timer_count_down.dart';
import 'package:wave_drive/modules/auth/Login/cubit/signin_cubit.dart';

part 'widgets/enter_otp_step.dart';
part 'widgets/enter_email_number_step.dart';

final _otpStepKey = GlobalKey<_EnterOTPStepState>();

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _cubit = SigninCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: BlocBuilder<SigninCubit, SigninState>(
        builder: (context, state) {
          final title = state.step.appbarTitle;
          final idx = state.step.index;

          if (idx == 1) {
            _otpStepKey.currentState?.restartCountdown();
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: MainAppBar(
              titleWidget: Text(
                title,

                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),

              leading: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  splashRadius: 20,
                  splashColor: AppColors.stroke.withOpacity(.2),
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    if (idx == 1) {
                      return _cubit.changeStep(SigninStep.login);
                    }
                    if (idx == 2) {
                      return _cubit.changeStep(SigninStep.verify);
                    }
                    AppNavigator.pop(context);
                  },
                ),
              ),
            ),
            body: IndexedStack(
              index: idx,
              children: const [EnterEmailPhoneStep(), EnterOTPStep()],
            ),
          );
        },
      ),
    );
  }
}
