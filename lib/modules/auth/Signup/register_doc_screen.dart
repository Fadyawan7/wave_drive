import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/form_mixin.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/avatar/app_file_picker.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_date_picker.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/auth/signup/document_confirmation_view.dart';
import 'package:wave_drive/modules/auth/signup/payment_details_screen.dart';

import 'package:wave_drive/modules/auth/signup/widgets/custom_horizontal_divider.dart';

@RoutePage()
class RegisterDocScreen extends StatefulWidget {
  const RegisterDocScreen({super.key});

  @override
  State<RegisterDocScreen> createState() => _RegisterDocViewState();
}

class _RegisterDocViewState extends BaseScreen<RegisterDocScreen>
    with FormMixin {
  final _userCubit = injector<UserCubit>();

  File? profilePicture;
  File? driversLicense;
  File? toolDrivingLicense;
  File? companyCertificate;
  File? taxiLicense;
  File? operationLicense;
  File? taxiLight;
  File? vehicleInsurance;
  File? bankStatement;

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

              FormBuilderFillDatePicker(
                name: 'expire',
                borderRadius: 5,
                hintText: "Expires",
                validator: requiredValidators,
                suffix: const Icon(Icons.keyboard_arrow_down_outlined),
              ),

              const Gap(18),

              _buildDocumentSection(
                title: 'Taxi Operating License',
                description:
                    'In order to drive taxi in Norway you (or the fleet owner you are working with) must have a so called taxi operating license. Please upload your taxi operating license in this section so that we can approve your application. Read more about taxi operating lenience. here',
                buttonText: 'Upload A File',
                file: operationLicense,
                onPressed: () {},
                onDelete: () {
                  setState(() => operationLicense = null);
                },
                onFileChanged: (File p1) {
                  setState(() => operationLicense = p1);
                },
                name: "operation_license",
              ),

              const Gap(18),

              _buildDocumentSection(
                title: 'Roof Light',
                description:
                    'Please provide a picture of a roof light as required in Norway after 1/1/2023.',
                buttonText: 'Upload A File',
                file: taxiLight,
                onPressed: () {},
                onDelete: () {
                  setState(() => taxiLight = null);
                },
                onFileChanged: (File p1) {
                  setState(() => taxiLight = p1);
                },
                name: 'roof_light',
              ),

              const Gap(18),

              _buildDocumentSection(
                title: 'Vehicle insurance documentation',
                description: 'Please provide a copy of your vehicle insurance.',
                buttonText: 'Upload A File',
                file: vehicleInsurance,
                onPressed: () {
                  // setState(
                  //   () => vehicleInsurance = File('dummy_insurance.png'),
                  // );
                },
                onDelete: () {
                  setState(() => vehicleInsurance = null);
                },
                onFileChanged: (File p1) {
                  setState(() => vehicleInsurance = p1);
                },
                name: 'insurance_doc',
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
                  // setState(() => profilePicture = File('dummy_profile.png'));
                },
                onDelete: () {
                  setState(() => profilePicture = null);
                },
                onFileChanged: (File p1) {
                  setState(() => profilePicture = p1);
                },
                name: 'profile_pic',
              ),

              const Gap(18),
              // Driver's License Section
              _buildDocumentSection(
                title: "Driver's License*",
                description:
                    "We need a clear copy of your driver's license to identify you.",
                buttonText: 'Upload A File',
                file: driversLicense,
                onPressed: () {
                  // setState(() => driversLicense = File('dummy_license.png'));
                },
                onDelete: () {
                  setState(() => driversLicense = null);
                },
                onFileChanged: (File p1) {
                  setState(() => driversLicense = p1);
                },
                name: 'driver_license',
              ),

              const Gap(18),
              // Tool Driving License Section
              _buildDocumentSection(
                title: 'Taxi Driving License*',
                description:
                    'To drive with us, you must have a total driving license. Please upload it for approval.',
                buttonText: 'Upload A File',
                file: toolDrivingLicense,
                onPressed: () {
                  // setState(
                  //   () => toolDrivingLicense = File('dummy_tool_license.png'),
                  // );
                },
                onDelete: () {
                  setState(() => toolDrivingLicense = null);
                },
                onFileChanged: (File p1) {
                  setState(() => toolDrivingLicense = p1);
                },
                name: 'taxi_license',
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
                  // setState(
                  //   () => companyCertificate = File('dummy_company_cert.png'),
                  // );
                },
                onDelete: () {
                  setState(() => companyCertificate = null);
                },
                onFileChanged: (File p1) {
                  setState(() => companyCertificate = p1);
                },
                name: 'company_registration_certificate',
              ),
              const Gap(18),

              _buildDocumentSection(
                title: 'Bank statement',
                description: 'Please provide a picture of your bank statement',
                buttonText: 'Upload A File',

                onPressed: () {},
                onDelete: () {
                  setState(() {
                    bankStatement = null;
                  });
                },
                onFileChanged: (File p1) {
                  setState(() {
                    bankStatement = p1;
                  });
                },
                name: 'bank_statement',
                file: bankStatement,
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
    final formFields = formKey.currentState!.value;
    final licenceNumber = formFields["licence_number"] as String;
    final expire = formFields["expire"] as String;
    final operationLicensefile = operationLicense;
    final roofLight = taxiLight;
    final insuranceDoc = vehicleInsurance;
    final profilePic = profilePicture;
    final driverLicensefile = driversLicense;
    final taxiLicense = toolDrivingLicense;
    final companyRegistrationCertificate = companyCertificate;
    final bankStatementfile = bankStatement;

    loading(true);

    await _userCubit.uploadDucoments(
      taxiOperatingLicense: operationLicensefile!,
      roofLight: roofLight!,
      vehicleInsuranceDocumentation: insuranceDoc!,
      profilePicture: profilePic!,
      driversLicense: driverLicensefile!,
      driversLicenseNumber: licenceNumber,
      taxiDrivingLicense: taxiLicense!,
      companyRegistrationCertificate: companyRegistrationCertificate!,
      bankStatement: bankStatementfile!,
      documentExpires: expire,
    );

    loading(false);
    final isError = _userCubit.state.updateProfileState.isError;
    if (isError) {
      toastError(_userCubit.state.errorMessageUpdateProfile);
      return;
    }

    if (mounted) {
       AppNavigator.push(context, const PaymentDetailsRoute());
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
