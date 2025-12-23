// packages
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/avatar/app_file_picker.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/modules/auth/signup/license_expires_view.dart';

class DocumentConfirmationView extends StatefulWidget {
  const DocumentConfirmationView({super.key});

  @override
  State<DocumentConfirmationView> createState() =>
      _DocumentConfirmationViewState();
}

class _DocumentConfirmationViewState
    extends BaseScreen<DocumentConfirmationView>
    with FormMixin {
  bool isCheckedFirst = false;
  bool isCheckedSecond = false;
  bool isCheckedThird = false;

  @override
  Widget buildBody(BuildContext context) {
    // final File? imageFile = Get.arguments;
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
                'Documents Confirmation ',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ).centerLeft,
              const Gap(12),

              AppFilePicker(
                validator: requiredValidators,
                buildSelected: (file) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.boxbgcolor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppColors.primarycolor),
                  ),
                  height: 188,
                  width: double.infinity,

                  child: Image.file(file),
                ),
                buildUnSelected: () => Container(
                  height: 188,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.boxbgcolor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: AppColors.primarycolor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, color: AppColors.graycolor, size: 50),
                      Text(
                        'Select file',
                        style: TextStyle(color: AppColors.graycolor),
                      ),
                    ],
                  ),
                ),

                name: "",
                onFileChanged: (File p1) {},
              ),
              const Gap(16),
              Text(
                'Confirm The Following:',
                style: AppTextStyles.textMed18,
              ).centerLeft,
              Gap(24),
              AppCheckbox(
                label:
                    'The document is fully visible and nothing is covering the information',
                value: isCheckedFirst,
                onChanged: (bool p1) {
                  setState(() {
                    isCheckedFirst = !isCheckedFirst;
                  });
                },
              ),
              Divider(thickness: 1, color: AppColors.inputboxcolor),
              Gap(10),
              AppCheckbox(
                label:
                    'All information is clearly readable and evenly lit, with no blur or glare',
                value: isCheckedSecond,
                onChanged: (bool p1) {
                  setState(() {
                    isCheckedSecond = !isCheckedSecond;
                  });
                },
              ),

              Divider(thickness: 1, color: AppColors.inputboxcolor),
              Gap(10),

              AppCheckbox(
                label: 'This is a real document, not a photo of a screen',
                value: isCheckedThird,
                onChanged: (bool p1) {
                  setState(() {
                    isCheckedThird = !isCheckedThird;
                  });
                },
              ),

              Divider(thickness: 1, color: AppColors.inputboxcolor),
              const Gap(30),

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
    if (!(isCheckedThird && isCheckedSecond && isCheckedFirst)) {
      toastError("please select all checks");
      return;
    }
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
        MaterialPageRoute(builder: (context) => LicenseExpiresView()),
      );
    }
  }

  Widget _buildCheckboxItem(String label, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
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
                onChanged: (bool? newValue) {
                  // Handle checkbox state change
                },
                activeColor: Colors.transparent,
                checkColor: Colors.white,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                side: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.text14.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

class AppCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool) onChanged;
  final TextStyle? style;

  const AppCheckbox({
    super.key,
    required this.label,
    required this.value,
    this.style,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tap box
          GestureDetector(
            onTap: () => onChanged(!value),
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: value ? AppColors.primarycolor : Colors.grey,
                  width: 1.5,
                ),
                color: value ? AppColors.primarycolor : Colors.transparent,
              ),
              child: Center(
                child: value
                    ? const Icon(Icons.check, size: 18, color: Colors.white)
                    : null,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Tap on label
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(!value),
              child: Text(
                label,
                style:
                    style ??
                    AppTextStyles.text14.copyWith(fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
