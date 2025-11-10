import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_drive/core/shared/constants/countries/countries.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/buttons/link_button.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/country_flag_widget.dart';
import 'package:wave_drive/core/shared/widgets/texts/required_text_filed_label.dart';

class FormBuilderPhoneTextField extends StatefulWidget {
  const FormBuilderPhoneTextField({
    super.key,
    required this.name,
    required this.countryName,
    this.borderRadius = 40,
    this.labelText,
    this.hintText,
    this.validator,
    this.isRequired = false,
    this.onChanged,
    this.initialValue,
    this.heightOfPopup = 400,
    this.initialCountry,
    this.isReadOnly = false,
  });

  final String name;
  final bool isReadOnly;
  final String countryName;
  final double borderRadius;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool isRequired;
  final Function(String?)? onChanged;
  final double heightOfPopup;
  final CountryCode? initialCountry;

  @override
  State<FormBuilderPhoneTextField> createState() =>
      _FormBuilderPhoneTextFieldState();
}

class _FormBuilderPhoneTextFieldState extends State<FormBuilderPhoneTextField> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();
  bool _isExpand = false;
  String _searchText = '';
  late CountryCode _selectedCountry;

  @override
  void initState() {
    super.initState();
    _selectedCountry = widget.initialCountry ?? CountryCode.fromCode('PK')!;
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchedList =
        countries
            .where(
              (element) => element.name.toLowerCase().contains(
                _searchText.toLowerCase(),
              ),
            )
            .toList()
          ..sort((a, b) {
            final aName = a.name.toLowerCase();
            final bName = b.name.toLowerCase();
            final search = _searchText.toLowerCase();
            final aStartsWith = aName.startsWith(search) ? 0 : 1;
            final bStartsWith = bName.startsWith(search) ? 0 : 1;
            return aStartsWith != bStartsWith
                ? aStartsWith - bStartsWith
                : aName.compareTo(bName);
          });

    return FormBuilderField<String>(
      name: widget.name,
      initialValue: widget.initialValue,
      validator: widget.validator,
      onChanged: widget.onChanged,
      builder: (field) {
        final errorText = field.errorText;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                  gradient: AppColors.gradientbutton,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gradient: AppColors.gradienttextfield,
              ),
              child: InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  labelText: widget.isRequired ? null : widget.labelText,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: AppTextStyles.text16.copyWith(
                    color: AppColors.gray,
                  ),
                  floatingLabelStyle: AppTextStyles.text16.copyWith(
                    color: AppColors.gray,
                  ),
                  label: widget.isRequired
                      ? RequiredTextFiledLabel(label: widget.labelText ?? '')
                      : null,
                  hintStyle: AppTextStyles.text14.copyWith(
                    color: AppColors.gray,
                  ),
                ),
                child: PortalTarget(
                  visible: _isExpand,
                  anchor: const Aligned(
                    follower: Alignment.topCenter,
                    target: Alignment(0.0, 1.1),
                  ),
                  portalFollower: TapRegion(
                    onTapOutside: (_) {
                      setState(() {
                        _isExpand = false;
                        _searchText = "";
                      });
                    },
                    child: _buildCountryPopup(context, searchedList),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!widget.isReadOnly) {
                            if (!_isExpand) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                            setState(() {
                              _isExpand = !_isExpand;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              CountryFlagWidget(
                                countryconde: _selectedCountry.code,
                              ),
                              const Gap(5),
                              Text(
                                '${_selectedCountry.dialCode} ',
                                style: AppTextStyles.textMed14.copyWith(
                                  color: AppColors.black6A,
                                ),
                              ),
                              Text(
                                ' | ',
                                style: AppTextStyles.textMed14.copyWith(
                                  color: AppColors.black6A,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          maxLength: 20,
                          buildCounter:
                              (
                                BuildContext context, {
                                required int currentLength,
                                required bool isFocused,
                                required int? maxLength,
                              }) {
                                return null; // Hides the counter
                              },
                          controller: _controller,
                          readOnly: widget.isReadOnly,
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: AppTextStyles.textMed14,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.hintText,
                            hintStyle: AppTextStyles.text14.copyWith(
                              color: AppColors.black6A,
                            ),
                          ),
                          onChanged: (value) {
                            field.didChange(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (errorText != null && errorText.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(left: 18.w, top: 4),
                child: Text(
                  errorText,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildCountryPopup(
    BuildContext context,
    List<CountryCode> searchedList,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.black.withOpacity(.1)),
        ],
      ),
      height: widget.heightOfPopup,
      width: MediaQuery.sizeOf(context).width - 48,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24),
          CupertinoSearchTextField(
            borderRadius: BorderRadius.circular(20),
            style: AppTextStyles.text12,
            onChanged: (value) {
              setState(() {
                _searchText = value.trim();
              });
            },
          ),
          const Gap(8),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(searchedList.length, (index) {
                  final country = searchedList[index];
                  final isSelected = _selectedCountry.code == country.code;
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 4 : 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpand = false;
                          _selectedCountry = country;
                        });
                        FormBuilder.of(context)?.fields[widget.countryName]
                            ?.didChange(_selectedCountry.name);
                      },
                      child: Row(
                        children: [
                          CountryFlagWidget(countryconde: country.code),
                          const Gap(5),
                          Text(
                            '${country.dialCode} | ',
                            style: AppTextStyles.textMed14.copyWith(
                              color: isSelected
                                  ? AppColors.darkPrimary
                                  : AppColors.gray,
                            ),
                          ),
                          Expanded(
                            child: LinkButton(
                              align: Alignment.centerLeft,
                              label: country.name,
                              textStyle: AppTextStyles.text14.copyWith(
                                color: isSelected
                                    ? AppColors.darkPrimary
                                    : AppColors.gray,
                              ),
                              height: 42,
                              onTap: () {
                                setState(() {
                                  _isExpand = false;
                                  _selectedCountry = country;
                                });
                                FormBuilder.of(context)
                                    ?.fields[widget.countryName]
                                    ?.didChange(_selectedCountry.name);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
