// packges
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/services/firebase/consts.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/utils/check_user_completed_info.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/pin_text_field.dart';
import 'package:wave_drive/core/shared/widgets/timer_count_down.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/auth/signup/cubit/signup_cubit.dart';

@RoutePage()
class SignupOtpScreen extends StatefulWidget {
  const SignupOtpScreen({super.key});

  @override
  State<SignupOtpScreen> createState() => _SignupOtpScreenState();
}

class _SignupOtpScreenState extends BaseScreen<SignupOtpScreen> {
  final _coutndownCtrl = CountdownController();
  final _otpError = ValueNotifier<String?>(null);
  final _otpController = TextEditingController();
  final SignupCubit _cubit = injector<SignupCubit>();

  final _userCubit = injector<UserCubit>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _coutndownCtrl.restart();
    });
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),

            Text(
              'Please verify your number',
              style: AppTextStyles.text18.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.black33,
              ),
            ),
            const Gap(18),

            Text(
              "We have sent you a verification code to ${_cubit.state.phoneNumber}",
              style: AppTextStyles.text14.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.grayA9,
              ),
            ),
            const Gap(24),

            // otp fields
            ValueListenableBuilder(
              valueListenable: _otpError,
              builder: (context, value, child) {
                return PinTextField(
                  pinController: _otpController,
                  hasError: value != null,
                  errorText: value,
                  onCompleted: _verifyOTP,
                ).center;
              },
            ),
            const Gap(24),

            Countdown(
              seconds: 60,
              controller: _coutndownCtrl,
              build: (_, s) {
                return StyledText(
                  text:
                      "Request a new code? ${s == 0 ? "<link>Resend</link>" : "<disable>Resend in ${s.toInt()}s</disabled>"}",
                  style: AppTextStyles.text14,
                  tags: {
                    "disable": StyledTextTag(
                      style: AppTextStyles.text14.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    "link": StyledTextActionTag(
                      (text, attributes) {
                        // showModalBottomSheet(
                        //   context: context,
                        //   isScrollControlled:
                        //       true, // allows full-height if needed
                        //   backgroundColor: Colors.white,
                        //   shape: const RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.vertical(
                        //       top: Radius.circular(10),
                        //     ),
                        //   ),
                        //   builder: (context) {
                        //     return const Resendcodebottomsheet();
                        //   },
                        // );

                        _resendOTP();
                      },
                      style: AppTextStyles.textMed14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  },
                );
              },
            ).center,
          ],
        ),
      ),
    );
  }

  Future<void> _verifyOTP(String otp) async {
    loading(true);

    final result = await _cubit.varifiyNumberOtp(otp: otp);

    loading(false);

    if (result.status == SocialLoginStatus.failed ||
        result.status == SocialLoginStatus.cancelled) {
      final message = result.errorCode ?? "Invalid OTP";
      _otpError.value = message;
      return;
    }

    

    if (mounted) {
      AppNavigator.replaceAll(context, const PersonelInfoRoute());
     
    }
  }

  Future<void> _resendOTP() async {
    _coutndownCtrl.restart();
    _otpError.value = null;
    _otpController.clear();
    final resulst = await _cubit.sendOtpNumber(_cubit.state.phoneNumber!);
    if (!resulst.$1) {
      toastError(resulst.$2 ?? "Something went wrong. Please try again later!");
      return;
    }

    AppOverlay.showToastSuccess("OTP was sent to your email");
  }

  void _onVerifyPressed() {
    final otp = _otpController.text;
    AppLogger.d("otp is $otp");

    if (otp.isEmpty || otp.length != 6) {
      _otpError.value = "Please enter a valid 6-digit OTP";
      return;
    }

    _verifyOTP(otp);
  }
}
