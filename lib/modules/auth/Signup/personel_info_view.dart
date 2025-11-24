// packages
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/mixins/mixins.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/modules/auth/Signup/register_category_view.dart';

import 'widgets/custom_horizontal_divider.dart';

class PersonelInfoView extends StatefulWidget {
  const PersonelInfoView({super.key});

  @override
  State<PersonelInfoView> createState() => _PersonelInfoViewState();
}

class _PersonelInfoViewState extends BaseScreen<PersonelInfoView>
    with FormMixin {
  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      appBar: MainAppBar(
        titleWidget: Text(
          "Sign Up",
          style: AppTextStyles.text22.copyWith(
            fontWeight: FontWeight.w700,

            color: AppColors.white,
          ),
        ),
      ),
      body: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            Gap(48),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(24),
                        // language field
                        LanguageField(),
                        Gap(24),
                        // cutom divider
                        CustomHorizontalDivider(activeSections: 0),
                        Gap(24),
                        Text(
                          'Personel Information',
                          style: AppTextStyles.text18.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gap(10),
                        Text(
                          'Only your first name and vehicle to clients during the booking.',
                          style: AppTextStyles.text12.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.grayA9,
                          ),
                        ),

                        Gap(24),
                        CustomTextField(
                          requiredValidators: requiredValidators,
                          upperHint: 'First name',
                          hint: 'First name',
                          name: 'fName',
                        ),

                        Gap(24),
                        CustomTextField(
                          requiredValidators: requiredValidators,
                          upperHint: 'Last name',
                          hint: 'Last name',
                          name: 'lName',
                        ),

                        Gap(24),
                        CustomTextField(
                          requiredValidators: requiredValidators,
                          upperHint: 'National ID',
                          hint: '3880938888',
                          name: 'id_card',
                        ),
                        Gap(8),

                        Text(
                          "Your social security number or country,s alternative (e,g BVN)",
                          style: AppTextStyles.text10.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.grayA9,
                          ),
                        ),

                        Gap(24),
                        CustomTextField(
                          requiredValidators: requiredValidators,
                          upperHint: 'Language',
                          hint: 'Norwegian',
                          name: 'language',
                        ),

                        Gap(24),
                        CustomTextField(
                          upperHint: 'Referral code',
                          hint: 'Referral code',
                          name: 'referal_code',
                        ),

                        Gap(8),

                        Text(
                          "If someone referred you, biter their code ",
                          style: AppTextStyles.text10.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.grayA9,
                          ),
                        ),
                        Gap(24),
                        PrimaryButton(text: "Next", onPressed: _onSubmit),
                        Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    final formFields = formKey.currentState!.value;
    final fName = formFields["fName"] as String;
    final lName = formFields["lName"] as String;
    final idCard = formFields["id_card"] as String;
    final language = formFields["language"] as String;
    final referalCode = formFields["referal_code"] as String?;

    loading(true);

    await Future.delayed(const Duration(seconds: 2));
    loading(false);

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegisterCategoryView()),
      );
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.requiredValidators,
    required this.upperHint,
    required this.hint,
    required this.name,
  });

  final FormFieldValidator? requiredValidators;
  final String upperHint;
  final String hint;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          upperHint,
          style: AppTextStyles.text18.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.black33,
          ),
        ),
        Gap(12),
        FormBuilderFillTextField(
          name: name,
          hintText: hint,
          validator: requiredValidators,
          obscureText: true,
        ),
      ],
    );
  }
}
