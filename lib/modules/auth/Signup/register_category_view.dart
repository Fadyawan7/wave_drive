// packages
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/mixins/mixins.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_outlined_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/form_builders/form_builder_item_picker.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/modules/auth/Signup/price_details_view.dart';

// widgets
import 'widgets/custom_horizontal_divider.dart';
import 'widgets/driver_category_widget.dart';

class RegisterCategoryView extends StatefulWidget {
  const RegisterCategoryView({super.key});

  @override
  State<RegisterCategoryView> createState() => _RegisterCategoryViewState();
}

class _RegisterCategoryViewState extends State<RegisterCategoryView>
    with FormMixin {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
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
                  child: FormBuilder(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        ),
                        Gap(10),
                        Text(
                          'Your national ID and license will be kept Private',
                          style: AppTextStyles.text12.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.grayA9,
                          ),
                        ),
                        Gap(24),
                        Text(
                          'I want to join wave as:*',
                          style: AppTextStyles.text16.copyWith(
                            color: AppColors.black33,
                          ),
                        ),
                        Gap(10),
                        //  DriverCategoryWidget(),
                        FormBuilderItemPicker(
                          name: "city",
                          items: [
                            "Self-employed driver with own vehicle",
                            "Fleet Owner",
                          ],
                          hintText: "Select as",
                        ),
                        Gap(36),
                        PrimaryButton(
                          text: "Back",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Gap(24),
                        PrimaryOutlinedButton(
                          text: "Next",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PriceDetailsView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
