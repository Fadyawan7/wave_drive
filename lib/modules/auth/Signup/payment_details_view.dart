// packages
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_border_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';

import 'sigup_success_view.dart';
import 'widgets/custom_horizontal_divider.dart';

class PaymentDetailsView extends StatelessWidget {
  PaymentDetailsView({super.key});
  // final PaymentDetailController controller = Get.put(PaymentDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            AppBarField(
              text: 'Sign Up',
              onpress: (){}
            ),
            const Gap(16),
            Expanded(
              child: _buildContent(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.whitecolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
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
              const Gap(16),
              _buildDescription('we need your payment details to pay you.'),
              const Gap(24),
              _buildSectionTitle('Billing type*'),
            //  _buildCompanyField(),
              const Gap(24),
              _buildSectionTitle('Company name*'),
              _buildTextField(hintText: 'X technologies'),
              _buildDescription('Full, leqal company name'),
              _buildSectionTitle('Address'),
              _buildTextField(hintText: 'X colony'),
              _buildSectionTitle('Registration code*'),
              _buildTextField(hintText: '122345'),
              _buildDescription('Com parry,s registration code'),
              const Gap(24),
              _buildCheckbox('VAT Liability', true),
              const Gap(24),
              _buildSectionTitle('Bank account holder name'),
              _buildTextField(hintText: 'John Doe'),
              _buildDescription('Bank accoount holder name,person or company'),
              _buildSectionTitle('Bank account number'),
              _buildTextField(hintText: 'EE 9909 0938 1223 1233'),
              _buildDescription(
                  'Your bank account number,in Ibadan other format'),
              _buildSectionTitle('Bank Name or BIC/SWIFT '),
              _buildTextField(hintText: 'HABALT22 '),
              _buildSectionTitle('Tax Identification Numbers'),
              _buildDescription(
                  'Please provide all your Tax Identification Numbers.'),
           //   _buildTaxNumberField(),
              Gap(16),
            //  _buildCountryBirthField(),
              Gap(24),
              _buildSectionTitle('Contry of Birth'),
             // _buildCountryBirthField(),
              const Gap(24),
              RoundedButton(
                  title: 'Next',
                  onpress: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
                  //   Get.to(
                  //     () => const SuccessScreen(),
                  //     binding: SuccessBinding(),
                  //     transition: Transition.fadeIn,
                  //     duration: const Duration(milliseconds: 500),
                  //   );
                   }
                  
                  
                  ),
              const Gap(24),
              RoundedBorderButton(title: 'Back', onpress: (){}),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text('Payment Details', style: AppTextStyles.text10);
  }

  // Widget _buildCompanyField() {
  //   return  _buildDropdown(
  //       value: controller.selectCompany.value.isEmpty
  //           ? null
  //           : controller.selectCompany.value,
  //       hintText: "Company",
  //       items: controller.company,
  //       onChanged: (String? newValue) =>
  //           newValue != null ? controller.setCompany(newValue) : null,
  //       onClear: controller.clearCompany,
  //     ),
  // }

  Widget _buildSectionTitle(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppTextStyles.text10),
        const Gap(16),
      ],
    );
  }

  Widget _buildDescription(String text) {
    return Column(
      children: [
        Text(text, style: AppTextStyles.text10),
        const Gap(24),
      ],
    );
  }

  Widget _buildTextField({required String hintText, int maxLines = 1}) {
    return Column(
      children: [
        TextFieldCustom(
          maxLines: maxLines,
          hintText: hintText,
        ),
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
          Expanded(
            child: Text(label, style: AppTextStyles.text10),
          ),
        ],
      ),
    );
  }

  // Widget _buildTaxNumberField() {
  //   return Obx(
  //     () => _buildDropdown(
  //       value: controller.selectTexNumber.value.isEmpty
  //           ? null
  //           : controller.selectTexNumber.value,
  //       hintText: "Add other Tax number",
  //       items: controller.taxnumbers,
  //       onChanged: (String? newValue) =>
  //           newValue != null ? controller.settaxNumber(newValue) : null,
  //       onClear: controller.clearSelection,
  //     ),
  //   );
  // }

  // Widget _buildCountryBirthField() {
  //   return Obx(
  //     () => _buildDropdown(
  //       value: controller.selectCountryBirth.value.isEmpty
  //           ? null
  //           : controller.selectCountryBirth.value,
  //       hintText: "Contry of Birth",
  //       items: controller.countryBirth,
  //       onChanged: (String? newValue) =>
  //           newValue != null ? controller.setCountry(newValue) : null,
  //       onClear: controller.clearCountry,
  //     ),
  //   );
  // }

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
                      color: Colors.black, fontWeight: FontWeight.w400),
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
