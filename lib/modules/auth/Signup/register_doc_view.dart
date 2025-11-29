import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/avatar/app_file_picker.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/modules/auth/Signup/document_confirmation_view.dart';
import 'package:wave_drive/modules/auth/Signup/personel_info_view.dart';

import 'widgets/custom_horizontal_divider.dart';

class RegisterDocView extends StatefulWidget {
  const RegisterDocView({super.key});

  @override
  State<RegisterDocView> createState() => _RegisterDocViewState();
}

class _RegisterDocViewState extends BaseScreen<RegisterDocView> with FormMixin {
  File? profilePicture;
  File? driversLicense;
  File? toolDrivingLicense;
  File? companyCertificate;

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
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
              const Gap(24),
              const LanguageField(),
              const Gap(24),
              const CustomHorizontalDivider(activeSections: 3),
              const Gap(24),
              Text(
                'Documents',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ).centerLeft,
              const Gap(10),
              Text(
                "We're legally required to ask you for some documents to sign you up as a driver. Document scans and quality photos are accepted.",
                style: AppTextStyles.text14.copyWith(color: AppColors.grayA9),
              ).centerLeft,
              const Gap(24),

              FormBuilderFillTextField(
                name: 'licence_number',
                hintText: "Driver license number",
                validator: requiredValidators,
                inputType: TextInputType.number,
              ),

              const Gap(18),

              // Profile Picture Section
              _buildDocumentSection(
                title: 'Profile Picture*',
                description:
                    'A picture of you where your face is clearly visible without sunglasses or a hat. Take the photo in a well-lit place.',
                buttonText: 'Upload A File',
                file: profilePicture,
                onPressed: () {
                  setState(() => profilePicture = File('dummy_profile.png'));
                },
                onDelete: () {
                  setState(() => profilePicture = null);
                },
                onFileChanged: (File p1) {},
                name: '',
              ),

              const Gap(18),
              // Driver's License Section
              _buildDocumentSection(
                title: "Driver's License*",
                description:
                    'We need a clear copy of your driver\'s license to identify you.',
                buttonText: 'Upload A File',
                file: driversLicense,
                onPressed: () {
                  setState(() => driversLicense = File('dummy_license.png'));
                },
                onDelete: () {
                  setState(() => driversLicense = null);
                },
                onFileChanged: (File p1) {},
                name: '',
              ),

              const Gap(18),
              // Tool Driving License Section
              _buildDocumentSection(
                title: 'Tool Driving License*',
                description:
                    'To drive with us, you must have a total driving license. Please upload it for approval.',
                buttonText: 'Upload A File',
                file: toolDrivingLicense,
                onPressed: () {
                  setState(
                    () => toolDrivingLicense = File('dummy_tool_license.png'),
                  );
                },
                onDelete: () {
                  setState(() => toolDrivingLicense = null);
                },
                onFileChanged: (File p1) {},
                name: '',
              ),

              const Gap(18),
              // Company Certificate Section
              _buildDocumentSection(
                title: 'Company Registration Certificate',
                description:
                    'If you are a fleet owner, please upload your company registration certificate. This is the last required document for approval.',
                buttonText: 'Upload A File',
                file: companyCertificate,
                onPressed: () {
                  setState(
                    () => companyCertificate = File('dummy_company_cert.png'),
                  );
                },
                onDelete: () {
                  setState(() => companyCertificate = null);
                },
                onFileChanged: (File p1) {},
                name: '',
              ),

              const Gap(30),

              PrimaryButton(text: "Next", onPressed: _onSubmit),
              const Gap(18),
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
        //   MaterialPageRoute(builder: (context) => UploadLicenseView()),
        MaterialPageRoute(builder: (context) => DocumentConfirmationView()),
      );
    }
  }

  Widget _buildDocumentSection({
    required String title,
    required String description,
    required String buttonText,
    required File? file,
    required VoidCallback onPressed,
    required VoidCallback onDelete,
    required final Function(File) onFileChanged,
    required String name,
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

  bool _validateDocuments() {
    return profilePicture != null &&
        driversLicense != null &&
        toolDrivingLicense != null;
  }
}
