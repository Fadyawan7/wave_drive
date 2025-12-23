// packages
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/mixins.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/drop_downs/app_dropdown.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/injector_setup.dart';

import 'package:wave_drive/modules/auth/signup/widgets/custom_horizontal_divider.dart';

@RoutePage()
class PersonelInfoScreen extends StatefulWidget {
  const PersonelInfoScreen({super.key});

  @override
  State<PersonelInfoScreen> createState() => _PersonelInfoViewState();
}

class _PersonelInfoViewState extends BaseScreen<PersonelInfoScreen>
    with FormMixin {
  final _userCubit = injector<UserCubit>();

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        leadingColor: AppColors.black,

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
              const Gap(24),

              // language field
              const LanguageField(),
              const Gap(24),
              // cutom divider
              const CustomHorizontalDivider(activeSections: 0),
              const Gap(24),
              Text(
                'Personel Information',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ).centerLeft,
              const Gap(10),
              Text(
                'Only your first name and vehicle to clients during the booking.',
                style: AppTextStyles.text12.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.grayA9,
                ),
              ).centerLeft,

              const Gap(24),
              FormBuilderFillTextField(
                name: 'fName',
                hintText: "First name",
                validator: requiredValidators,
              ),

              const Gap(18),
              FormBuilderFillTextField(
                name: 'lName',
                hintText: "Last name",
                validator: requiredValidators,
              ),

              const Gap(18),
              FormBuilderFillTextField(
                name: 'cnic',
                hintText: "National ID",
                validator: requiredValidators,
                inputType: TextInputType.number,
              ),

              const Gap(8),

              Text(
                "Your social security number or country,s alternative (e,g BVN)",
                style: AppTextStyles.text10.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.grayA9,
                ),
              ),

              const Gap(18),

              // CustomTextField(
              //   requiredValidators: requiredValidators,
              //   upperHint: 'Language',
              //   hint: 'Norwegian',
              //   name: 'language',
              //   obscureText: false,
              // ),
              AppDropdownField(
                name: "language",
                validator: requiredValidators,
                hint: "Language",
                items: const ["English", "Urdu", "Arabic"],
              ),

              const Gap(18),

              FormBuilderFillTextField(
                name: 'referal_code',
                hintText: "Referral code",
                validator: requiredValidators,
                inputType: TextInputType.number,
              ),

              const Gap(8),

              Text(
                "If someone referred you, biter their code ",
                style: AppTextStyles.text10.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.grayA9,
                ),
              ).centerLeft,
              const Gap(30),
              PrimaryButton(text: "Next", onPressed: _onSubmit),
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
    final fName = formFields["fName"] as String;
    final lName = formFields["lName"] as String;
    final idCard = formFields["cnic"] as String;
    final language = formFields["language"] as String;
    final referalCode = formFields["referal_code"] as String?;

    loading(true);
    await _userCubit.updateUserInfo(
      firstName: fName,
      lastName: lName,
      idCard: idCard,
      language: language,
      referance: referalCode,
    );

    loading(false);
    final isError = _userCubit.state.updateProfileState.isError;
    if (isError) {
      toastError(_userCubit.state.errorMessageUpdateProfile);
      return;
    }

    if (mounted) {
      AppNavigator.push(context, const LegalPriceRoute());
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
    this.inputFormatters,
    this.inputType,
    this.obscureText = false,
  });

  final FormFieldValidator? requiredValidators;
  final String upperHint;
  final String hint;
  final String name;
  final bool obscureText;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;

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
        const Gap(12),
        FormBuilderFillTextField(
          inputFormatters: inputFormatters,
          name: name,
          hintText: hint,
          validator: requiredValidators,
          obscureText: obscureText,
          inputType: inputType,
        ),
      ],
    );
  }
}
