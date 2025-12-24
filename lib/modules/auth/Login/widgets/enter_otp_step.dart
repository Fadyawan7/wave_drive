part of '../login_screen.dart';

class EnterOTPStep extends StatefulWidget {
  const EnterOTPStep({super.key});

  @override
  State<EnterOTPStep> createState() => _EnterOTPStepState();
}

class _EnterOTPStepState extends BaseScreen<EnterOTPStep> {
  final _coutndownCtrl = CountdownController();
  final _otpError = ValueNotifier<String?>(null);
  final _otpController = TextEditingController();
  SigninCubit get _cubit => context.read<SigninCubit>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _coutndownCtrl.restart();
    });
  }

  void restartCountdown() {
    _coutndownCtrl.restart();
  }

  // controller for resent otp
  @override
  Widget buildBody(BuildContext context) {
    return Padding(
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

          BlocBuilder<SigninCubit, SigninState>(
            builder: (context, state) {
              return Text(
                "Enter the 6-digit code we sent via SMS to ${state.phoneNumber}. Didn’t get the code? Make sure your mobile number is correct.",
                style: AppTextStyles.text14.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.grayA9,
                ),
              );
            },
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
          ).center,
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
                    style: AppTextStyles.text14.copyWith(color: AppColors.gray),
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

          const Gap(54),

          PrimaryButton(text: "Continue", onPressed: () => _verifyOTP),
        ],
      ),
    );
  }

  Future<void> _verifyOTP(String otp) async {
    final userCubit = injector<UserCubit>();

    loading(true);

    final result = await _cubit.varifiyNumberOtp(otp: otp);

    loading(false);
    if (!result.success) {
      toastError(result.errorMessage ?? "Internal Server error");
      return;
    }

    if (mounted) {
      isUserCompletedFullInfo(userCubit.currentUser)
          ? AppNavigator.replaceAll(context, const DashboardRoute())
          : isUserCompletedDocumentInfo(userCubit.currentUser)
          ? AppNavigator.replaceAll(context, const PaymentDetailsRoute())
          : isUserCompletedVehicleInfo(userCubit.currentUser)
          ? AppNavigator.replaceAll(context, const LegalPriceRoute())
          : AppNavigator.replaceAll(context, const PersonelInfoRoute());
    }
  }

  Future<void> _resendOTP() async {
    _coutndownCtrl.restart();
    _otpError.value = null;
    _otpController.clear();
    await _cubit.sendOtpNumber(_cubit.state.phoneNumber!);
    AppOverlay.showToastSuccess("OTP was sent to your email");
  }

  void _onVerifyPressed() {
    final otp = _otpController.text;
    AppLogger.d("otp is $otp");

    if (otp.isEmpty || otp.length != 6) {
      _otpError.value = "Please enter a valid 4-digit OTP";
      return;
    }

    //  _verifyOTP(otp);
  }
}
