// packages
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/data/network/dio/payment_info_dto.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/avatar/app_file_picker.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/drop_downs/app_dropdown.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_country_picker.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_border_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/auth/signup/document_confirmation_view.dart';

import 'package:wave_drive/modules/auth/signup/widgets/custom_horizontal_divider.dart';

@RoutePage()
class PaymentDetailsScreen extends StatefulWidget {
  const PaymentDetailsScreen({super.key});

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends BaseScreen<PaymentDetailsScreen>
    with FormMixin {
  bool isCheckedFirst = false;
  final _scrollController = ScrollController();
  final _userCubit = injector<UserCubit>();

  // final PaymentDetailController controller = Get.put(PaymentDetailController());
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
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(24),
            const LanguageField(),
            const Gap(24),
            // custom divider
            const CustomHorizontalDivider(activeSections: 4),
            const Gap(24),
            _buildHeader(),
            const Gap(6),
            _buildDescription('we need your payment details to pay you.'),
            const Gap(12),

            //  _buildSectionTitle('Billing type*'),
            //  _buildCompanyField(),
            AppDropdownField(
              hintStype: AppTextStyles.text14.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.grayA9,
              ),
              name: "billing_type",
              validator: requiredValidators,
              hint: "Billing type",
              items: const ["Company", "Individual"],
            ),

            const Gap(18),

            FormBuilderFillTextField(
              name: 'company_name',
              hintText: "Company name",
              validator: requiredValidators,
            ),

            const Gap(6),

            _buildDescription('Full, leqal company name'),
            const Gap(18),

            FormBuilderFillTextField(
              name: 'address',
              hintText: "Address",
              validator: requiredValidators,
            ),

            const Gap(18),
            FormBuilderFillTextField(
              name: 'reg_code',
              hintText: "Registration code*",
              validator: requiredValidators,
            ),

            const Gap(6),
            _buildDescription('Com parry,s registration code'),
            const Gap(6),
            AppCheckbox(
              label: 'VAT Liability',
              style: AppTextStyles.text16.copyWith(color: AppColors.black33),
              value: isCheckedFirst,
              onChanged: (bool p1) {
                setState(() {
                  isCheckedFirst = !isCheckedFirst;
                });
              },
            ),

            const Gap(18),

            FormBuilderFillTextField(
              name: 'owner_name',
              hintText: "Bank account holder name",
              validator: requiredValidators,
            ),

            const Gap(18),

            FormBuilderFillTextField(
              name: 'acc_number',
              hintText: "Bank account number",
              validator: requiredValidators,
            ),

            const Gap(12),

            _buildDocumentSection(
              title: 'Bank statement',
              description: 'Please provide a picture of your bank statement',
              buttonText: 'Upload A File',

              onPressed: () {},
              onDelete: () {},
              onFileChanged: (File p1) {},
              name: '',
            ),

            const Gap(24),

            FormBuilderFillTextField(
              name: 'swift_no',
              hintText: "Bank name or BIC/SWIFT",
              validator: requiredValidators,
            ),
            const Gap(6),
            _buildDescription('If unknown use bank name '),
            const Gap(6),

            _buildSectionTitle('Tax identification numbers'),
            const Gap(6),

            _buildDescription(
              'Please provide all your Tax Identification Numbers. What are Tax Identification Numbers? ',
            ),
            const Gap(6),

            FormBuilderFillTextField(
              name: 'text_no',
              hintText: "12345678900987mva",
              validator: requiredValidators,
            ),
            const Gap(12),

            FormBuilderCountryPicker(
              name: 'country',
              validator: Platform.isIOS ? null : countryValidators,
              hintText: 'Country',
              onSearching: (searching) {
                if (searching) {
                  _scrollController.animateTo(
                    200,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                }
              },
              //  initialValue: "Pakistan",
              isRequired: !Platform.isIOS,
            ),

            const Gap(6),

            _buildDescription('Add other Tax number '),
            const Gap(24),
            FormBuilderCountryPicker(
              name: 'countryofBirth',
              validator: Platform.isIOS ? null : countryValidators,
              hintText: 'Country of birth',
              onSearching: (searching) {
                if (searching) {
                  _scrollController.animateTo(
                    200,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                  );
                }
              },
              //  initialValue: "Pakistan",
              isRequired: !Platform.isIOS,
            ),

            const Gap(30),
            RoundedButton(title: 'Submit', onpress: _onSubmit),
            const Gap(18),
            RoundedBorderButton(title: 'Back', onpress: () {}),
          ],
        ),
      ),
    );
  }

  Future<void> _onSubmit() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    if (!isCheckedFirst) {
      toast(
        'Please accept the Terms of Service and Privacy Policy to continue',
      );
      return;
    }

    final formFields = formKey.currentState!.value;
    final billingType = formFields["billing_type"] as String;
    final companyName = formFields["company_name"] as String;
    final address = formFields["address"] as String;
    final regCode = formFields["reg_code"] as String;
    final ownerName = formFields["owner_name"] as String;
    final accNumber = formFields["acc_number"] as String;
    final swiftNo = formFields["swift_no"] as String;
    final textNo = formFields["text_no"] as String;
    final country = formFields["country"] as String;
    final countryofBirth = formFields["countryofBirth"] as String;
    // final lName = formFields["lName"] as String;
    // final idCard = formFields["id_card"] as String;
    // final language = formFields["language"] as String;
    // final referalCode = formFields["referal_code"] as String?;

    loading(true);

    final dto = PaymentInfoDto(
      billingType: billingType,
      companyName: companyName,
      fullLegalCompanyName: companyName,
      address: address,
      registrationCode: regCode,
      vatLiability: isCheckedFirst,
      bankAccountHolderName: ownerName,
      bankAccountNumber: accNumber,
      bankNameOrBIC: swiftNo,
      countryOfBirth: countryofBirth,
      taxIdentificationNumbers: [
        TaxIdentificationNumber(country: country, number: textNo),
      ],
    );
    await _userCubit.uploadPaymentInfo(dto);

    loading(false);
    final isError = _userCubit.state.updateProfileState.isError;
    if (isError) {
      toastError(_userCubit.state.errorMessageUpdateProfile);
      return;
    }

    if (mounted) {
      AppNavigator.replaceAllAndPush(context, [
        const SignupOtpRoute(),
        const SignupSuccessRoute(),
      ]);
    }
  }

  // Document Upload Section
  Widget _buildDocumentSection({
    required String title,
    required String name,
    required String description,
    required String buttonText,
    File? file,
    required VoidCallback onPressed,
    required VoidCallback onDelete,
    required final Function(File) onFileChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.text16.copyWith(fontWeight: FontWeight.w500),
        ),
        const Gap(8),
        Text(
          description,
          style: AppTextStyles.text14.copyWith(
            fontWeight: FontWeight.w300,

            color: AppColors.grayA9,
          ),
        ),
        const Gap(16),

        AppFilePicker(
          validator: requiredValidators,
          onFileChanged: onFileChanged,
          name: name,
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Text(
      'Payment Details',
      style: AppTextStyles.textMed18.copyWith(color: AppColors.black33),
    );
  }

  // Widget _buildCompanyField() {
  Widget _buildSectionTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildDescription(String text) {
    return Text(
      text,
      style: AppTextStyles.text14.copyWith(color: AppColors.grayA9),
    );
  }

  Widget _buildTextField({required String hintText, int maxLines = 1}) {
    return Column(
      children: [
        TextFieldCustom(maxLines: maxLines, hintText: hintText),
        const Gap(16),
      ],
    );
  }

  Widget _buildCheckbox(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: value ? AppColors.primarycolor : Colors.grey,
                width: 1.5,
              ),
              color: value ? AppColors.primarycolor : Colors.transparent,
            ),
            child: Theme(
              data: ThemeData(unselectedWidgetColor: Colors.transparent),
              child: Checkbox(
                value: value,
                onChanged: (bool? newValue) {},
                activeColor: Colors.transparent,
                checkColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                side: BorderSide.none,
              ),
            ),
          ),
          const Gap(12),
          Expanded(child: Text(label, style: AppTextStyles.text10)),
        ],
      ),
    );
  }

  // Widget _buildTaxNumberField() {
  Widget _buildDropdown({
    required String? value,
    required String hintText,
    required List<String> items,
    required Function(String?) onChanged,
    required VoidCallback onClear,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(12),
                dropdownColor: AppColors.whitecolor,
                isExpanded: true,
                value: value,
                hint: Text(
                  hintText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
                icon: const SizedBox.shrink(),
              ),
            ),
          ),
          if (value != null)
            GestureDetector(
              onTap: onClear,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.clear, size: 18),
              ),
            ),
          const Icon(Icons.keyboard_arrow_down, size: 22),
        ],
      ),
    );
  }
}
