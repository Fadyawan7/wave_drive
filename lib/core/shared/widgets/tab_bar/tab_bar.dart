import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/widgets/tab_bar/tab_bar_item.dart';

class AppTabBar extends StatefulWidget {
  const AppTabBar({
    super.key,
    required this.items,
    required this.onChanged,
    this.labelStyle,
    this.labelColor,
    this.unselectedLabelStyle,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.tabController,
    this.onTapTab,
  });

  final List<String> items;
  final Function(int page) onChanged;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final TextStyle? unselectedLabelStyle;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final TabController? tabController;
  final Function(int index)? onTapTab;

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller =
        widget.tabController ??
        TabController(length: widget.items.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerColor: Colors.transparent,
      isScrollable: true,
      controller: controller,
      indicatorColor: widget.indicatorColor ?? AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      labelPadding: const EdgeInsets.symmetric(horizontal: 8),
      labelColor: widget.labelColor ?? Colors.white,
      labelStyle: widget.labelStyle ?? AppTextStyles.textBold16,
      indicator: UnderlineTabIndicator(
        borderRadius: BorderRadius.circular(99),
        borderSide: BorderSide(
          width: 2,
          color: widget.indicatorColor ?? Colors.white,
        ),
      ),
      unselectedLabelColor: widget.unselectedLabelColor ?? Colors.white,
      unselectedLabelStyle:
          widget.unselectedLabelStyle ?? AppTextStyles.textMed16,
      splashBorderRadius: BorderRadius.circular(4),
      splashFactory: InkRipple.splashFactory,
      overlayColor: WidgetStateColor.resolveWith(
        (states) => AppColors.stroke.withOpacity(.2),
      ),
      onTap: widget.onChanged,
      tabs: List.generate(
        widget.items.length,
        (index) => InkWell(
          highlightColor: Colors.white.withOpacity(.1),
          splashColor: Colors.white.withOpacity(.1),
          onTap: () {
            controller.animateTo(index);
            widget.onTapTab?.call(index);
          },
          child: TabBarItem(text: widget.items[index]),
        ),
      ),
    );
  }
}
