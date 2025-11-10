import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_drive/core/shared/constants/countries/countries.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/link_button.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/app_search_text_field.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/country_flag_widget.dart';

class FormBuilderCountryPicker extends StatefulWidget {
  const FormBuilderCountryPicker({
    super.key,
    required this.name,
    this.borderRadius = 8,
    this.labelText,
    this.hintText,
    this.validator,
    this.onSearching,
    this.alignment,
    this.dropdownWidth,
    this.scrollPadding,
    this.isRequired = true,
    this.initialValue,
  });

  final String name;
  final double borderRadius;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(bool searching)? onSearching;
  final Alignment? alignment;
  final double? dropdownWidth;
  final EdgeInsets? scrollPadding;
  final bool isRequired;
  final String? initialValue;

  @override
  State<FormBuilderCountryPicker> createState() =>
      _FormBuilderCountryPickerState();
}

class _FormBuilderCountryPickerState extends State<FormBuilderCountryPicker> {
  bool _isExpand = false;
  String _searchText = '';
  CountryCode _selectedCountry = CountryCode.fromCode('PK')!;
  final _scrollController = ScrollController();

  @override
  void initState() {
    if (!widget.initialValue.isNullOrEmpty) {
     _selectedCountry = countries.firstWhere(
  (element) => element.name.toLowerCase() == widget.initialValue?.toLowerCase(),
  orElse: () => CountryCode.fromCode('PK')!,
);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext rootContext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: AppColors.gradientbutton,
              borderRadius: BorderRadius.circular(40),
            ),
            borderRadius: BorderRadius.circular(40),
            gradient: AppColors.gradienttextfield,
          ),
          child: FormBuilderField(
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
                    filled: true,
                    fillColor: Colors.transparent,
                    errorText: errorText,

                    hintStyle: AppTextStyles.text14.copyWith(
                      color: AppColors.gray,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: Icon(
                      Icons.expand_more,
                      size: 25,
                      color: AppColors.black.withOpacity(.5),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    // errorBorder: const OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(40)),
                    //   borderSide: BorderSide(color: AppColors.error),
                    // ),
                    errorStyle: const TextStyle(fontSize: 0),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: AppTextStyles.text16.copyWith(
                      color: AppColors.gray,
                    ),
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
                        // final searchedList = countries
                        //     .where((element) => element.name
                        //         .toLowerCase()
                        //         .contains(_searchText.toLowerCase()))
                        //     .toList();

                        final searchedList =
                            countries
                                .where(
                                  (element) => element.name
                                      .toLowerCase()
                                      .contains(_searchText),
                                )
                                .toList()
                              ..sort((a, b) {
                                final aName = a.name.toLowerCase();
                                final bName = b.name.toLowerCase();
                                final search = _searchText.toLowerCase();

                                final aStartsWith = aName.startsWith(search)
                                    ? 0
                                    : 1;
                                final bStartsWith = bName.startsWith(search)
                                    ? 0
                                    : 1;

                                if (aStartsWith != bStartsWith) {
                                  return aStartsWith -
                                      bStartsWith; // Put startsWith items first
                                }
                                return aName.compareTo(
                                  bName,
                                ); // Then alphabetically
                              });

                        return TapRegion(
                          onTapOutside: (event) {
                            setState(() {
                              _isExpand = false;
                              _searchText = "";
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
                            height: 300,
                            width:
                                widget.dropdownWidth ??
                                MediaQuery.sizeOf(rootContext).width - 48,
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(24),
                                AppSearchTextField(
                                  style: AppTextStyles.text12,
                                  scrollPadding:
                                      widget.scrollPadding ??
                                      const EdgeInsets.only(bottom: 200),
                                  onTap: () {
                                    widget.onSearching?.call(true);
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _searchText = value;
                                    });
                                  },
                                ),
                                const Gap(8),
                                Expanded(
                                  child: SingleChildScrollView(
                                    controller: _scrollController,
                                    child: Column(
                                      children: List.generate(
                                        searchedList.length,
                                        (index) {
                                          final country = searchedList[index];
                                          final isSelected =
                                              _selectedCountry.code ==
                                              country.code;
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              top: index == 0 ? 4 : 0,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _isExpand = false;
                                                  _selectedCountry = country;
                                                });
                                                field.didChange(
                                                  _selectedCountry.name,
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  CountryFlagWidget(
                                                    countryconde: country.code,
                                                  ),
                                                  const Gap(5),
                                                  Expanded(
                                                    child: LinkButton(
                                                      align:
                                                          Alignment.centerLeft,
                                                      label: country.name,
                                                      textStyle: AppTextStyles
                                                          .text14
                                                          .copyWith(
                                                            color: isSelected
                                                                ? AppColors
                                                                      .darkPrimary
                                                                : AppColors
                                                                      .gray,
                                                          ),
                                                      height: 42,
                                                      onTap: () {
                                                        setState(() {
                                                          _isExpand = false;
                                                          _selectedCountry =
                                                              country;
                                                        });
                                                        field.didChange(
                                                          _selectedCountry.name,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
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
                        : Row(
                            children: [
                              CountryFlagWidget(
                                countryconde: _selectedCountry.code,
                              ),
                              const Gap(5),
                              Text(
                                '${field.value}',
                                style: AppTextStyles.textMed14,
                              ),
                            ],
                          ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Builder(
          builder: (context) {
            final field = FormBuilder.of(context)?.fields[widget.name];
            if (field != null && field.hasError) {
              return Padding(
                padding: EdgeInsets.only(left: 18.w),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
