// packages
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/mixins.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/core/shared/widgets/drop_downs/app_dropdown.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/modules/auth/Signup/price_details_view.dart';

// widgets
import 'widgets/custom_horizontal_divider.dart';

class RegisterCategoryView extends StatefulWidget {
  const RegisterCategoryView({super.key});

  @override
  State<RegisterCategoryView> createState() => _RegisterCategoryViewState();
}

class _RegisterCategoryViewState extends BaseScreen<RegisterCategoryView>
    with FormMixin {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),

        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              Gap(24),
              // language field
              LanguageField(),
              Gap(24),
              // cutom divider
              CustomHorizontalDivider(activeSections: 1),
              Gap(24),
              Text(
                'Legal and pricing details',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ).centerLeft,
              Gap(10),
              Text(
                'Your national ID and license will be kept Private',
                style: AppTextStyles.text12.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.grayA9,
                ),
              ).centerLeft,
              Gap(24),
              Text(
                'I want to join wave as:*',
                style: AppTextStyles.text16.copyWith(color: AppColors.black33),
              ).centerLeft,
              Gap(10),

              AppDropdownField(
                validator: requiredValidators,
                name: "type",
                hint: "Select as",
                items: [
                  "Driver working under a fleet owner",
                  "Self-employed driver with own vehicle",
                ],
              ),
              Gap(30),
              PrimaryButton(text: "Next", onPressed: _onSubmit),
              Gap(18),

              PrimaryOutlinedButton(
                text: "Back",

                onPressed: () {
                  Navigator.pop(context);
                },
              ),
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
    final formFields = formKey.currentState!.value;

    loading(true);

    await Future.delayed(const Duration(seconds: 2));
    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PriceDetailsView()),
      );
    }
  }
}
