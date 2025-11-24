// packges
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:styled_text/tags/styled_text_tag_action.dart';

import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/extensions/padding_extension.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/pin_text_field.dart';
import 'package:wave_drive/core/shared/widgets/timer_count_down.dart';
import 'package:wave_drive/modules/auth/Login/widgets/otp_input_field_widget.dart';
import 'package:wave_drive/modules/auth/Login/widgets/resendcodeBottomSheet.dart';
import 'package:wave_drive/modules/dashboad/dashboard_view.dart';

class OtpView extends StatefulWidget {
  OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends BaseScreen<OtpView> {
  final _coutndownCtrl = CountdownController();
  final _otpError = ValueNotifier<String?>(null);
  final _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _coutndownCtrl.restart();
    });
  }

  // controller for resent otp
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      appBar: MainAppBar(
        titleWidget: Text(
          "Login",
          style: AppTextStyles.text22.copyWith(
            fontWeight: FontWeight.w700,

            color: AppColors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Gap(48),

            Text(
              'Enter the code',
              style: AppTextStyles.text20.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ).paddingLeft(16).centerLeft,
            Gap(20),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(30),
                      Text(
                        "We have sent you a verification code to +46 713 7185 8191",
                        style: AppTextStyles.text16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),
                      Gap(24),

                      // otp fields
                      ValueListenableBuilder(
                        valueListenable: _otpError,
                        builder: (context, value, child) {
                          return PinTextField(
                            pinController: _otpController,
                            length: 4,
                            hasError: value != null,
                            errorText: value,
                            onCompleted: _verifyOTP,
                          ).center;
                        },
                      ).centerLeft,
                      Gap(24),

                      // TextButton(
                      //   onPressed: () {
                      //     showModalBottomSheet(
                      //       context: context,
                      //       isScrollControlled:
                      //           true, // allows full-height if needed
                      //       backgroundColor: Colors.white,
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.vertical(
                      //           top: Radius.circular(10),
                      //         ),
                      //       ),
                      //       builder: (context) {
                      //         return const Resendcodebottomsheet();
                      //       },
                      //     );
                      //   },
                      //   child: Text(
                      //     "Resend Code",
                      //     style: GoogleFonts.poppins(
                      //       fontSize: 14.0,
                      //       color: AppColors.primarycolor,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyOTP(String otp) async {
    loading(true);

    await Future.delayed(const Duration(seconds: 5));

    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardView()),
      );
      // AppNavigator.push(context, NameInputRoute());
    }
  }

  Future<void> _resendOTP() async {
    _coutndownCtrl.restart();
    _otpError.value = null;
    _otpController.clear();
    // await _cubit.sendEmail(_cubit.state.email!);
    AppOverlay.showToastSuccess("OTP was sent to your email");
  }

  void _onVerifyPressed() {
    final otp = _otpController.text;
    AppLogger.d("otp is $otp");

    if (otp.isEmpty || otp.length != 4) {
      _otpError.value = "Please enter a valid 4-digit OTP";
      return;
    }

    //  _verifyOTP(otp);
  }
}
