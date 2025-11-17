import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_border_button.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/module/auth/Signup/register_doc_view.dart';

import 'widgets/custom_horizontal_divider.dart';

class PriceDetailsView extends StatefulWidget {
  const PriceDetailsView({super.key});

  @override
  State<PriceDetailsView> createState() => _PriceDetailsViewState();
}

class _PriceDetailsViewState extends State<PriceDetailsView> {
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
              onpress: () {
                Navigator.pop(context);
              },
            ),
            const Gap(16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: const BorderRadius.only(
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
                        const CustomHorizontalDivider(activeSections: 2),
                        const Gap(24),

                        Text(
                          'Legal and pricing details',
                          style: AppTextStyles.bodytext,
                        ),
                        const Gap(10),
                        Text(
                          'Your national ID and license will be kept private',
                          style: AppTextStyles.litetext,
                        ),
                        const Gap(24),

                        Text('License plate', style: AppTextStyles.bodytext1),
                        const Gap(16),
                        const TextFieldCustom(maxLines: 1, hintText: '717 TTP'),
                        const Gap(24),

                        Text(
                          'Vehicle transport licence number',
                          style: AppTextStyles.bodytext1,
                        ),
                        const Gap(16),
                        const TextFieldCustom(
                          maxLines: 1,
                          hintText: 'Vehicle transport licence number',
                        ),
                        const Gap(24),

                        Text(
                          'Vehicle manufacturer and model',
                          style: AppTextStyles.bodytext1,
                        ),
                        const Gap(16),
                        _buildManufacturerDropdown(),
                        const Gap(16),
                        _buildModelDropdown(),
                        const Gap(24),

                        Text(
                          'If you don’t find your vehicle model from the list then let us know at info@wave.as.',
                          style: AppTextStyles.litetext,
                        ),
                        const Gap(24),

                        Text('Vehicle year', style: AppTextStyles.bodytext1),
                        const Gap(16),
                        _buildYearDropdown(),
                        const Gap(24),

                        Text('Vehicle color', style: AppTextStyles.bodytext1),
                        const Gap(16),
                        _buildColorDropdown(),
                        const Gap(24),

                        _buildDocumentSection(
                          title: 'Taxi Operating License',
                          description:
                              'Please upload your taxi operating license to approve your application.',
                          buttonText: 'Upload A File',
                          file: taxiLicense,
                          onPressed: () {
                            setState(
                              () => taxiLicense = File('dummy_license.png'),
                            );
                          },
                          onDelete: () {
                            setState(() => taxiLicense = null);
                          },
                        ),
                        const Gap(24),

                        _buildDocumentSection(
                          title: 'Taximeter',
                          description: 'Add a picture of your taximeter.',
                          buttonText: 'Upload A File',
                          file: taxiMeter,
                          onPressed: () {
                            setState(() => taxiMeter = File('dummy_meter.png'));
                          },
                          onDelete: () {
                            setState(() => taxiMeter = null);
                          },
                        ),
                        const Gap(24),

                        _buildDocumentSection(
                          title: 'Roof Light',
                          description:
                              'Please provide a picture of a roof light as required in Norway after 1/1/2023.',
                          buttonText: 'Upload A File',
                          file: taxiLight,
                          onPressed: () {
                            setState(() => taxiLight = File('dummy_light.png'));
                          },
                          onDelete: () {
                            setState(() => taxiLight = null);
                          },
                        ),
                        const Gap(24),

                        _buildDocumentSection(
                          title: 'Vehicle insurance documentation',
                          description:
                              'Please provide a copy of your vehicle insurance.',
                          buttonText: 'Upload A File',
                          file: vehicleInsurance,
                          onPressed: () {
                            setState(
                              () => vehicleInsurance = File(
                                'dummy_insurance.png',
                              ),
                            );
                          },
                          onDelete: () {
                            setState(() => vehicleInsurance = null);
                          },
                        ),
                        const Gap(32),

                        RoundedButton(
                          title: 'Next',
                          onpress: () {
                            // if (_validateDocuments()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterDocView(),
                              ),
                            );
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text(
                            //         'Please upload all required documents',
                            //       ),
                            //     ),
                            //   );
                            // }
                          },
                        ),
                        const Gap(24),
                        RoundedBorderButton(
                          title: 'Back',
                          onpress: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Gap(24),
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

  // Manufacturer Dropdown
  Widget _buildManufacturerDropdown() {
    return _buildDropdown(
      hint: "Select Manufacturer",
      value: selectedManufacturer,
      items: manufacturers,
      onChanged: (val) {
        setState(() {
          selectedManufacturer = val;
          selectedModel = null; // Reset model when manufacturer changes
        });
      },
      onClear: () => setState(() => selectedManufacturer = null),
    );
  }

  // Model Dropdown
  Widget _buildModelDropdown() {
    final availableModels = models[selectedManufacturer] ?? [];
    return _buildDropdown(
      hint: "Select Model",
      value: selectedModel,
      items: availableModels,
      onChanged: (val) => setState(() => selectedModel = val),
      onClear: () => setState(() => selectedModel = null),
    );
  }

  // Year Dropdown
  Widget _buildYearDropdown() {
    return _buildDropdown(
      hint: "Select Year",
      value: selectedYear,
      items: years,
      onChanged: (val) => setState(() => selectedYear = val),
      onClear: () => setState(() => selectedYear = null),
    );
  }

  // Color Dropdown
  Widget _buildColorDropdown() {
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
                value: selectedColor,
                hint: const Text("Select Color"),
                items: colorMap.keys.map((colorName) {
                  return DropdownMenuItem<String>(
                    value: colorName,
                    child: Row(
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: colorMap[colorName],
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(colorName),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() => selectedColor = newValue);
                },
              ),
            ),
          ),
          if (selectedColor != null)
            GestureDetector(
              onTap: () => setState(() => selectedColor = null),
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

  // Reusable Dropdown Builder
  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
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
                  hint,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: onChanged,
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

  // Document Upload Section
  Widget _buildDocumentSection({
    required String title,
    required String description,
    required String buttonText,
    required File? file,
    required VoidCallback onPressed,
    required VoidCallback onDelete,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.bodytext1),
        const Gap(8),
        Text(description, style: AppTextStyles.litetext),
        const Gap(16),
        file != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      file.path.split('/').last,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_forever_rounded,
                      color: AppColors.blackcolor,
                    ),
                    onPressed: onDelete,
                  ),
                ],
              )
            : GestureDetector(
                onTap: onPressed,
                child: Container(
                  height: 31,
                  width: 118,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.inputboxcolor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 16, color: AppColors.primarycolor),
                      const SizedBox(width: 4),
                      Text(buttonText, style: AppTextStyles.litebuttontext),
                    ],
                  ),
                ),
              ),
      ],
    );
  }

  bool _validateDocuments() {
    return taxiLicense != null &&
        taxiMeter != null &&
        taxiLight != null &&
        vehicleInsurance != null;
  }
}
