import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:wave_drive/core/shared/constants/constants.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/buttons/link_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class FormBuilderGenderPicker extends StatefulWidget {
  const FormBuilderGenderPicker({
    super.key,
    required this.name,
    this.borderRadius = 8,
    this.label,
    this.hintText,
    this.validator,
    this.onSearching,
    this.alignment,
    this.initialValue,
  });

  final String name;
  final double borderRadius;
  final String? label;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(bool searching)? onSearching;
  final Alignment? alignment;
  final String? initialValue;

  @override
  State<FormBuilderGenderPicker> createState() =>
      _FormBuilderGenderPickerState();
}

class _FormBuilderGenderPickerState extends State<FormBuilderGenderPicker> {
  bool _isExpand = false;
  late String _selectedGender;

  @override
  void initState() {
    _selectedGender = widget.initialValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext rootContext) {
    return FormBuilderField(
      name: widget.name,
      validator: widget.validator,
      initialValue: widget.initialValue,
      builder: (field) {
        final errorText = field.errorText;
        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpand = true;
            });
          },
          child: InputDecorator(
            isFocused: _isExpand,
            decoration: InputDecoration(
              errorText: errorText,
              hintStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              suffixIcon: const Icon(
                Icons.expand_more,
                size: 25,
                color: AppColors.grayA2,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grayF1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.grayE8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.grayF1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.borderRadius),
                ),
                borderSide: const BorderSide(color: AppColors.error),
              ),
              labelText: widget.label,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
              floatingLabelStyle: AppTextStyles.text16.copyWith(
                color: AppColors.gray,
              ),
            ),
            child: PortalTarget(
              visible: _isExpand,
              anchor: Aligned(
                follower: Alignment.topCenter,
                target: widget.alignment ?? const Alignment(0.1, 2.5),
              ),
              portalFollower: Builder(
                builder: (context) {
                  return TapRegion(
                    onTapOutside: (event) {
                      setState(() {
                        _isExpand = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            color: Colors.black.withOpacity(.1),
                          ),
                        ],
                      ),
                      height: 140,
                      width: MediaQuery.sizeOf(rootContext).width - 48,
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(8),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(genderList.length, (
                                  index,
                                ) {
                                  final gender = genderList[index];
                                  final isSelected = gender == _selectedGender;
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      top: index == 0 ? 4 : 0,
                                    ),
                                    child: LinkButton(
                                      label: gender,
                                      textStyle: AppTextStyles.text14.copyWith(
                                        color: isSelected
                                            ? AppColors.darkPrimary
                                            : AppColors.gray,
                                      ),
                                      height: 42,
                                      onTap: () {
                                        setState(() {
                                          _isExpand = false;
                                          _selectedGender = gender;
                                        });
                                        field.didChange(gender);
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              child: field.value == null
                  ? Text(
                      widget.hintText ?? "",
                      style: AppTextStyles.text14.copyWith(
                        color: AppColors.gray,
                      ),
                    )
                  : Text('${field.value}', style: AppTextStyles.textMed14),
            ),
          ),
        );
      },
    );
  }
}
