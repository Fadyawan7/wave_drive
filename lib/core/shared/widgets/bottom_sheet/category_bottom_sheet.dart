import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/data/repositories/user_repository.dart';
import 'package:wave_drive/core/routes/routes.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/core/shared/extensions/media_query_extension.dart';

import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';
import 'package:wave_drive/injector_setup.dart';

class CategoryListBotonSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    bool barrierDismissible = true,
    VehicleCategory selectedCategory = VehicleCategory.comfort,
    required Function(String selectedCat) onChange,
  }) {
    return DefaultBottomSheet.show<T>(
      boarder: 12,
      context,
      barrierDismissible: barrierDismissible,
      showDivider: false,

      child: SizedBox(
        height: context.height * .5,
        child: CategoryList(selectedCategory: selectedCategory, onChange: onChange),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  final VehicleCategory selectedCategory;
  final Function(String selectedCat) onChange;
  const CategoryList({super.key, required this.selectedCategory, required this.onChange});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> categories = [];
  late String currentSelected;

  @override
  void initState() {
    super.initState();
    _getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: AppTextStyles.text20.copyWith(fontWeight: FontWeight.w600, color: AppColors.black33),
            ),
            const Gap(12),

            if (categories.isEmpty)
              SizedBox(
                height: context.height * .2,
                child: const Center(child: AppLoading()),
              ),

            // Radio items
            for (final category in categories)
              _buildItem(
                title: category,
                isSelected: currentSelected == category,
                onTap: (_) {
                  setState(() {
                    currentSelected = category;
                  });
                },
              ),

            const Gap(30),
            if (categories.isNotEmpty)
              PrimaryButton(
                text: "Confirm",
                onPressed: () {
                  widget.onChange(currentSelected);
                  AppNavigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItem({
    required String title,
    required bool isSelected,
    bool showDivider = true,
    required Function(String title) onTap,
  }) {
    return InkWell(
      onTap: () => onTap(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                customRadio(isSelected),
                const Gap(12),
                Text(title, style: AppTextStyles.text16.copyWith(color: AppColors.black33)),
              ],
            ),
            if (showDivider)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Divider(thickness: 0.3, color: AppColors.grayA9),
              ),
          ],
        ),
      ),
    );
  }

  static Widget customRadio(bool isSelected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 2),
        color: isSelected ? AppColors.primary.withOpacity(0.2) : Colors.transparent,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
              ),
            )
          : null,
    );
  }

  Future<void> _getCategories() async {
    final userRepo = injector<UserRepository>();
    final List<String> list = await userRepo.getCategory();
    setState(() {
      categories = list;
      currentSelected = list.first;
    });
  }
}
