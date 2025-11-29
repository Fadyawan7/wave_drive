import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:country_picker/country_picker.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class FormBuilderPhoneField extends StatefulWidget {
  final String name;
  final String? initialCountryCode;
  final String? label;
  final double? width;
  final double? height;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;

  const FormBuilderPhoneField({
    super.key,
    required this.name,
    this.initialCountryCode = 'PK',
    this.label,
    this.width,
    this.height,
    this.validator,
    this.onChanged,
  });

  @override
  State<FormBuilderPhoneField> createState() => _FormBuilderPhoneFieldState();
}

class _FormBuilderPhoneFieldState extends State<FormBuilderPhoneField> {
  Country? _selectedCountry;
  String _countryCode = '+92';

  @override
  void initState() {
    super.initState();
    _selectedCountry = CountryParser.parseCountryCode(
      widget.initialCountryCode!,
    );
    _countryCode = '+${_selectedCountry?.phoneCode ?? '92'}';
  }

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: [widget.initialCountryCode!],
      countryListTheme: const CountryListThemeData(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(0)),
        inputDecoration: InputDecoration(
          filled: true,

          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),

          prefixIcon: Icon(Icons.search, color: AppColors.blackcolor),
          fillColor: AppColors.grayF8,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),

      onSelect: (Country value) {
        setState(() {
          _selectedCountry = value;
          _countryCode = '+${value.phoneCode}';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width ?? MediaQuery.of(context).size.width;

    return FormBuilderField<String>(
      name: widget.name,
      validator: widget.validator,
      builder: (FormFieldState<String> field) {
        final hasError = field.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Country picker box
                GestureDetector(
                  onTap: _pickCountry,
                  child: Container(
                    height: widget.height ?? 58,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      color: AppColors.grayF8,

                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${_selectedCountry?.flagEmoji ?? '🇵🇰'} $_countryCode',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.expand_more,
                            color: Colors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Phone field
                Expanded(
                  child: Container(
                    height: widget.height ?? 58,
                    decoration: BoxDecoration(
                      color: AppColors.grayF8,

                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 18,
                      ),
                      child: TextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.phone,
                        onChanged: (val) {
                          final fullNumber = '$_countryCode$val';
                          field.didChange(fullNumber);
                          widget.onChanged?.call(fullNumber);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.label ?? 'Enter phone number',
                          hintStyle: AppTextStyles.text14.copyWith(
                            color: AppColors.grayA9,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (hasError) ...[
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  field.errorText ?? '',
                  style: AppTextStyles.text12.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
