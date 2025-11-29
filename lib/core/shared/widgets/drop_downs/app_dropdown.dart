import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';

class AppDropdownField<T> extends StatelessWidget {
  final String name;
  final String hint;
  final List<T> items;
  final Widget Function(T item)? itemBuilder; // optional
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final TextStyle? hintStype;

  const AppDropdownField({
    super.key,
    required this.name,
    required this.hint,
    required this.items,
    this.itemBuilder,
    this.onChanged,
    this.hintStype,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: name,
      validator: validator,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 58,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.grayF8,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<T>(
                        dropdownColor: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        menuMaxHeight: context.height * 0.5,
                        isExpanded: true,
                        value: field.value,
                        hint: Text(
                          hint,
                          style:
                              hintStype ??
                              const TextStyle(
                                color: AppColors.grayA9,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                        ),
                        items: items
                            .map(
                              (item) => DropdownMenuItem<T>(
                                value: item,
                                child: itemBuilder != null
                                    ? itemBuilder!(item)
                                    : Text(item.toString()),
                              ),
                            )
                            .toList(),
                        onChanged: (val) {
                          field.didChange(val);
                          if (onChanged != null) onChanged!(val);
                        },
                      ),
                    ),
                  ),
                  if (field.value != null)
                    GestureDetector(
                      onTap: () {
                        field.didChange(null);
                        if (onChanged != null) onChanged!(null);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.clear, size: 18),
                      ),
                    ),
                ],
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 4),
                child: Text(
                  field.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
