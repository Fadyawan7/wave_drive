// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:wave_drive/core/shared/widgets/tab_bar/custom_tab_indicator.dart';
import 'package:wave_drive/core/shared/widgets/tab_bar/tab_bar_item.dart';

class AppTabBarView extends StatefulWidget {
  const AppTabBarView({
    super.key,
    required this.items,
    this.labelStyle,
    this.labelColor,
    this.unselectedLabelStyle,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.padding,
    this.margin,
    this.isScrollable = true,
    this.initialIndex = 0,
    this.viewPhysics,
    this.onTabChanged,
    this.tabHeight,
    this.tabWidth,
    this.tabBackground,
    this.tabAlignment = Alignment.bottomLeft,
    this.isTransparentBgTabBar = false,
    this.tabBarAlignment,
    this.isCustomIndicator = false,
    this.colorIndicator,
    this.widthIndicator = 8,
    this.tabdecoration,
    this.btntabbarWidget,
  });

  final List<AppTabBarViewItem> items;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final TextStyle? unselectedLabelStyle;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool isScrollable;
  final Color? tabBackground;
  final double? tabHeight;
  final double? tabWidth;
  final int initialIndex;
  final ScrollPhysics? viewPhysics;
  final Function(int currentPage)? onTabChanged;
  final Alignment tabAlignment;
  final bool isTransparentBgTabBar;
  final TabAlignment? tabBarAlignment;
  final bool isCustomIndicator;
  final Color? colorIndicator;
  final double widthIndicator;
  final Decoration? tabdecoration;
  final Widget? btntabbarWidget;

  @override
  State<AppTabBarView> createState() => _AppTabBarViewState();
}

class _AppTabBarViewState extends State<AppTabBarView>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: widget.items.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );

    _controller.addListener(() {
      if (!_controller.indexIsChanging) {
        widget.onTabChanged?.call(_controller.index);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isTransparentBgTabBar) {
      return Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: TabBarView(
                    controller: _controller,
                    physics: widget.viewPhysics,
                    children: List.generate(
                      widget.items.length,
                      (index) => widget.items[index].child,
                    ),
                  ),
                ),
                Container(
                  color: widget.tabBackground,
                  alignment: widget.tabAlignment,
                  height: widget.tabHeight,
                  padding: widget.padding ?? EdgeInsets.zero,
                  child: TabBar(
                    tabAlignment: widget.tabBarAlignment,
                    isScrollable: widget.isScrollable,
                    dividerColor: Colors.transparent,
                    controller: _controller,
                    indicatorColor: widget.indicatorColor ?? Colors.white,
                    padding: EdgeInsets.zero,
                    labelColor: widget.labelColor ?? Colors.white,
                    labelStyle: widget.labelStyle ?? AppTextStyles.textMed18,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(99),
                      borderSide: BorderSide(
                        width: 2,
                        color: widget.indicatorColor ?? Colors.white,
                      ),
                    ),
                    unselectedLabelColor:
                        widget.unselectedLabelColor ?? Colors.white,
                    unselectedLabelStyle:
                        widget.unselectedLabelStyle ?? AppTextStyles.text16,
                    splashBorderRadius: BorderRadius.circular(4),
                    splashFactory: InkRipple.splashFactory,
                    overlayColor: WidgetStateColor.resolveWith(
                      (states) => AppColors.stroke.withValues(alpha: .2),
                    ),
                    tabs: List.generate(
                      widget.items.length,
                      (index) => TabBarItem(
                        text: widget.items[index].title,
                        icon: widget.items[index].icon,
                        child: widget.items[index].tabChild,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          width: widget.tabWidth,
          decoration: widget.tabdecoration,
          height: widget.tabHeight,
          color: widget.tabBackground,
          alignment: widget.tabAlignment,
          padding: widget.padding ?? EdgeInsets.zero,
          margin: widget.margin ?? EdgeInsets.zero,
          child: TabBar(
            tabAlignment: widget.tabBarAlignment,
            isScrollable: widget.isScrollable,
            dividerColor: Colors.transparent,
            controller: _controller,
            indicatorColor: widget.indicatorColor ?? Colors.white,
            padding: EdgeInsets.zero,
            labelColor: widget.labelColor ?? Colors.white,
            labelStyle: widget.labelStyle ?? AppTextStyles.textMed20,
            indicator: widget.isCustomIndicator
                ? CustomTabIndicator(
                    color: widget.colorIndicator,
                    widthIndicator: widget.widthIndicator,
                  )
                : UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(99),
                    borderSide: BorderSide(
                      width: 2,
                      color: widget.indicatorColor ?? Colors.white,
                    ),
                  ),
            unselectedLabelColor: widget.unselectedLabelColor ?? Colors.white,
            unselectedLabelStyle:
                widget.unselectedLabelStyle ?? AppTextStyles.text16,
            splashBorderRadius: BorderRadius.circular(4),
            splashFactory: InkRipple.splashFactory,
            overlayColor: WidgetStateColor.resolveWith(
              (states) => AppColors.stroke.withValues(alpha: .2),
            ),
            tabs: List.generate(
              widget.items.length,
              (index) => TabBarItem(
                text: widget.items[index].title,
                icon: widget.items[index].icon,
                child: widget.items[index].tabChild,
              ),
            ),
          ),
        ),

        if (widget.btntabbarWidget != null) widget.btntabbarWidget!,
        Expanded(
          child: TabBarView(
            controller: _controller,
            physics: widget.viewPhysics,
            children: List.generate(
              widget.items.length,
              (index) => widget.items[index].child,
            ),
          ),
        ),
      ],
    );
  }
}

class AppTabBarViewItem {
  String? title;
  Widget child;
  Widget? icon;
  Widget? tabChild;
  AppTabBarViewItem({
    this.title,
    required this.child,
    this.tabChild,
    this.icon,
  });
}
