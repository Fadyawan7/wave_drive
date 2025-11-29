// packages
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_date_picker.dart';
import 'package:wave_drive/modules/auth/Signup/payment_details_view.dart';

class LicenseExpiresView extends StatefulWidget {
  LicenseExpiresView({super.key});

  @override
  State<LicenseExpiresView> createState() => _LicenseExpiresViewState();
}

class _LicenseExpiresViewState extends BaseScreen<LicenseExpiresView>
    with FormMixin {
  // final LicenseExpireController controller = Get.put(LicenseExpireController());
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppBar(
        titleWidget: Text(
          "Sign Up",
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),

          child: Column(
            children: [
              Gap(24),

              Text(
                'Documents Details ',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ).centerLeft,
              const Gap(12),

              Text(
                'Please Provide The Following Information About These Documents',
                style: AppTextStyles.text14.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.grayA9,
                ),
              ).centerLeft,

              Gap(18),

              FormBuilderFillDatePicker(
                name: 'expire',
                borderRadius: 5,
                hintText: "02/01/2000",
                validator: requiredValidators,
                suffix: Icon(Icons.keyboard_arrow_down_outlined),
              ),

              Gap(30),

              PrimaryButton(text: "Confirm", onPressed: _onSubmit),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;

    // final formFields = formKey.currentState!.value;
    // final fName = formFields["fName"] as String;
    // final lName = formFields["lName"] as String;
    // final idCard = formFields["id_card"] as String;
    // final language = formFields["language"] as String;
    // final referalCode = formFields["referal_code"] as String?;

    loading(true);

    await Future.delayed(const Duration(seconds: 2));
    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentDetailsView()),
      );
    }
  }
}
