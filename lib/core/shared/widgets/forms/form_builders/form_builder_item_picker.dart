import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/forms/textfields/app_search_text_field.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class FormBuilderItemPicker extends StatefulWidget {
  const FormBuilderItemPicker({
    super.key,
    required this.name,
    required this.items,
    this.labelText,
    this.hintText,
    this.validator,
    this.onSearching,
    this.alignment,
    this.dropdownWidth,
    this.scrollPadding,
    this.borderRadius = 8,
    this.isRequired = true,
    this.initialValue,
  });

  final String name;
  final List<String> items;
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
  State<FormBuilderItemPicker> createState() =>
      _FormBuilderItemPickerState();
}

class _FormBuilderItemPickerState
    extends State<FormBuilderItemPicker> {
  bool _isExpand = false;
  String _searchText = "";
  late String _selectedItem;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _selectedItem = widget.initialValue ?? widget.items.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderField(
          name: widget.name,
          validator: widget.validator,
          initialValue: _selectedItem,
          builder: (field) {
            final errorText = field.errorText;

            return GestureDetector(
              onTap: () => setState(() => _isExpand = true),
              child: InputDecorator(
                isFocused: _isExpand,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.grayF8,
                  errorText: errorText,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 18,
                  ),
                  suffixIcon: Icon(
                    Icons.expand_more,
                    size: 25,
                    color: AppColors.black.withOpacity(.5),
                  ),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelStyle: AppTextStyles.text16.copyWith(color: AppColors.gray),
                ),
                child: PortalTarget(
                  visible: _isExpand,
                  anchor: Aligned(
                    follower: Alignment.topCenter,
                    target: widget.alignment ??
                        const Alignment(0.1, 2.5),
                  ),
                  portalFollower: Builder(
                    builder: (context) {
                      final searchedList = widget.items
                          .where((e) =>
                              e.toLowerCase().contains(_searchText.toLowerCase()))
                          .toList()
                        ..sort((a, b) {
                          final s = _searchText.toLowerCase();
                          final asw = a.toLowerCase().startsWith(s) ? 0 : 1;
                          final bsw = b.toLowerCase().startsWith(s) ? 0 : 1;
                          if (asw != bsw) return asw - bsw;
                          return a.toLowerCase().compareTo(b.toLowerCase());
                        });

                      return TapRegion(
                        onTapOutside: (_) => setState(() {
                          _isExpand = false;
                          _searchText = "";
                        }),
                        child: Container(
                          height: 300,
                          width: widget.dropdownWidth ??
                              MediaQuery.sizeOf(context).width - 48,
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              const Gap(24),
                              AppSearchTextField(
                                onTap: () =>
                                    widget.onSearching?.call(true),
                                onChanged: (v) =>
                                    setState(() => _searchText = v),
                              ),
                              const Gap(8),
                              Expanded(
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  child: Column(
                                    children: List.generate(
                                      searchedList.length,
                                      (index) {
                                        final item = searchedList[index];
                                        final isSelected =
                                            item == _selectedItem;

                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _isExpand = false;
                                              _selectedItem = item;
                                            });
                                            field.didChange(item);
                                          },
                                          child: Container(
                                            height: 42,
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              item,
                                              style: AppTextStyles.text14
                                                  .copyWith(
                                                color: isSelected
                                                    ? AppColors.darkPrimary
                                                    : AppColors.gray,
                                              ),
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
                  child: Text(
                    _selectedItem,
                    style: AppTextStyles.textMed14,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
