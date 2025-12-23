import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/data/network/dio/update_vehicle_info_dto.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/extensions/alignment_extension.dart';
import 'package:wave_drive/core/shared/mixins/mixins.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/avatar/app_file_picker.dart';
import 'package:wave_drive/core/shared/widgets/base/base_screen.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/core/shared/widgets/drop_downs/app_dropdown.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_fill_text_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/injector_setup.dart';
import "package:wave_drive/modules/auth/signup/register_doc_screen.dart";

import 'package:wave_drive/modules/auth/signup/widgets/custom_horizontal_divider.dart';

@RoutePage()
class LegalPriceScreen extends StatefulWidget {
  const LegalPriceScreen({super.key});

  @override
  State<LegalPriceScreen> createState() => _PriceDetailsViewState();
}

class _PriceDetailsViewState extends BaseScreen<LegalPriceScreen>
    with FormMixin {
  final _userCubit = injector<UserCubit>();

  String? selectedManufacturer;
  String? selectedModel;
  String? selectedYear;
  String? selectedColor;

  File? taxiLicense;
  File? taxiMeter;
  File? taxiLight;
  File? vehicleInsurance;

  final List<String> manufacturers = [
    "Acura",
    "Toyota",
    "Honda",
    "BMW",
    "Mercedes",
  ];

  final Map<String, List<String>> models = {
    "Acura": ["Integra", "TLX", "RDX"],
    "Toyota": ["Corolla", "Camry", "Yaris"],
    "Honda": ["Civic", "Accord", "CR-V"],
    "BMW": ["X3", "X5", "M3"],
    "Mercedes": ["C-Class", "E-Class", "GLA"],
  };

  final List<String> years = List.generate(
    25,
    (index) => (2000 + index).toString(),
  );

  final Map<String, Color> colorMap = {
    "Black": Colors.black,
    "White": Colors.white,
    "Red": Colors.red,
    "Blue": Colors.blue,
    "Silver": Colors.grey,
  };

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
              const CustomHorizontalDivider(activeSections: 2),
              const Gap(24),

              Text(
                'Legal and pricing details',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ).centerLeft,
              const Gap(10),
              Text(
                'Your national ID and license will be kept private',
                style: AppTextStyles.text14.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.grayA9,
                ),
              ).centerLeft,
              const Gap(24),

              Text(
                'I want to join wave as:*',
                style: AppTextStyles.text16.copyWith(color: AppColors.black33),
              ).centerLeft,
              const Gap(10),

              AppDropdownField(
                validator: requiredValidators,
                name: "type",
                hint: "Select as",
                items: const [
                  "Driver working under a fleet owner",
                  "Self-employed driver with own vehicle",
                ],
              ),

              const Gap(18),

              FormBuilderFillTextField(
                name: 'plate',
                hintText: "License plate",
                validator: requiredValidators,
              ),

              const Gap(18),
              FormBuilderFillTextField(
                name: 'licence_number',
                hintText: "Vehicle transport license number",
                validator: requiredValidators,
              ),

              const Gap(18),

              AppDropdownField(
                validator: requiredValidators,
                hint: 'Vehicle manufacturer',

                items: manufacturers,
                onChanged: (String? value) {},
                name: 'manufacturer',
              ),

              const Gap(18),

              AppDropdownField(
                validator: requiredValidators,
                hint: 'Vehicle model',

                items: const ["C-Class", "E-Class", "GLA"],
                onChanged: (String? value) {},
                name: 'model',
              ),

              const Gap(6),

              Text(
                'If you don’t find your vehicle model from the list then let us know at info@wave.as.',
                style: AppTextStyles.text12.copyWith(color: AppColors.grayA9),
              ),
              const Gap(18),

              AppDropdownField(
                validator: requiredValidators,
                hint: 'Vehicle year',

                items: const ["2024", "2025"],
                onChanged: (String? value) {},
                name: 'vehicle_year',
              ),

              const Gap(18),

              AppDropdownField(
                validator: requiredValidators,
                hint: 'Vehicle color',

                items: colorMap.keys.toList(),
                onChanged: (String? value) {},
                name: 'color',
                itemBuilder: (item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: colorMap[item],
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(item),
                      ],
                    ),
                  );
                },
              ),

              // _buildColorDropdown(),
              // const Gap(18),

              // _buildDocumentSection(
              //   title: 'Taxi Operating License',
              //   description:
              //       'In order to drive taxi in Norway you (or the fleet owner you are working with) must have a so called taxi operating license. Please upload your taxi operating license in this section so that we can approve your application. Read more about taxi operating lenience. here',
              //   buttonText: 'Upload A File',
              //   file: taxiLicense,
              //   onPressed: () {
              //     setState(() => taxiLicense = File('dummy_license.png'));
              //   },
              //   onDelete: () {
              //     setState(() => taxiLicense = null);
              //   },
              //   onFileChanged: (File p1) {},
              //   name: "file1",
              // ),
              // const Gap(18),

              // _buildDocumentSection(
              //   title: 'Taximeter',
              //   description: 'Add a picture of your taximeter.',
              //   buttonText: 'Upload A File',
              //   file: taxiMeter,
              //   onPressed: () {
              //     setState(() => taxiMeter = File('dummy_meter.png'));
              //   },
              //   onDelete: () {
              //     setState(() => taxiMeter = null);
              //   },
              //   onFileChanged: (File p1) {},
              //   name: '',
              // ).centerLeft,
              // const Gap(18),

              // _buildDocumentSection(
              //   title: 'Roof Light',
              //   description:
              //       'Please provide a picture of a roof light as required in Norway after 1/1/2023.',
              //   buttonText: 'Upload A File',
              //   file: taxiLight,
              //   onPressed: () {
              //     setState(() => taxiLight = File('dummy_light.png'));
              //   },
              //   onDelete: () {
              //     setState(() => taxiLight = null);
              //   },
              //   onFileChanged: (File p1) {},
              //   name: '',
              // ),
              // const Gap(18),

              // _buildDocumentSection(
              //   title: 'Vehicle insurance documentation',
              //   description: 'Please provide a copy of your vehicle insurance.',
              //   buttonText: 'Upload A File',
              //   file: vehicleInsurance,
              //   onPressed: () {
              //     setState(
              //       () => vehicleInsurance = File('dummy_insurance.png'),
              //     );
              //   },
              //   onDelete: () {
              //     setState(() => vehicleInsurance = null);
              //   },
              //   onFileChanged: (File p1) {},
              //   name: '',
              // ),
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
    final type = formFields["type"] as String;
    final plate = formFields["plate"] as String;
    final licenceNumber = formFields["licence_number"] as String;
    final manufacturer = formFields["manufacturer"] as String;
    final model = formFields["model"] as String;
    final vehicleYear = formFields["vehicle_year"] as String;
    final color = formFields["color"] as String;

    loading(true);

    final dto = UpdateVehicleDTO(
      joinAs: type,
      licensePlate: plate,
      vehicleTransportNumber: licenceNumber,
      vehicleModel: model,
      vehicleManufacturer: manufacturer,
      vehicleYear: vehicleYear,
      vehicleColor: color,
    );
    await _userCubit.updateVehicleInfo(dto);

    loading(false);
    final isError = _userCubit.state.updateProfileState.isError;
    if (isError) {
      toastError(_userCubit.state.errorMessageUpdateProfile);
      return;
    }

    if (mounted) {
      AppNavigator.push(context, const RegisterDocRoute());
    }
  }

  // Document Upload Section
  Widget _buildDocumentSection({
    required String title,
    required String name,
    required String description,
    required String buttonText,
    required File? file,
    required VoidCallback onPressed,
    required VoidCallback onDelete,
    required final Function(File) onFileChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.text18.copyWith(fontWeight: FontWeight.w500),
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




}
