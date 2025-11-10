import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class AppPullToRefresh extends StatefulWidget {
  const AppPullToRefresh({
    super.key,
    this.itemBuilder,
    this.itemCount,
    this.onRefresh,
    this.onLoading,
    this.enablePullDown = false,
    this.enablePullUp = true,
    this.loadMoreWidget,
    this.padding,
    this.scrollPadding,
    this.child,
    this.heightOfItem,
    this.reverse = false,
    this.scrollController,
    this.headerSlot,
    this.mainAxisSpacing = 24,
    this.scrollDirection,
  });

  final Widget Function(BuildContext, int)? itemBuilder;
  final Widget? child;
  final bool enablePullDown;
  final bool enablePullUp;
  final double? heightOfItem;
  final int? itemCount;
  final Widget? loadMoreWidget;
  final Function()? onLoading;
  final Function()? onRefresh;
  final EdgeInsets? padding;
  final EdgeInsets? scrollPadding;
  final bool reverse;
  final ScrollController? scrollController;
  final Widget? headerSlot;
  final double mainAxisSpacing;
  final Axis? scrollDirection;

  @override
  State<AppPullToRefresh> createState() => _AppPullToRefreshState();
}

class _AppPullToRefreshState extends State<AppPullToRefresh> {
  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      scrollDirection: widget.scrollDirection,
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp,
      reverse: widget.reverse,
      header: ClassicHeader(
        refreshingIcon: const AppLoading(size: 16),
        textStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
        completeIcon: const Icon(
          Icons.done,
          color: AppColors.primary,
          size: 18,
        ),
        idleText: 'Pull down to Refresh',
        releaseText: 'Release to Refresh',
      ),
      footer: CustomFooter(
        builder: (context, mode) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
              24,
              24,
              24,
              50 + MediaQuery.paddingOf(context).bottom,
            ),
            child: const AppLoading(size: 20),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      scrollController: widget.scrollController,
      child:
          widget.child ??
          SingleChildScrollView(
            padding: widget.scrollPadding,
            child: Column(
              children: [
                if (widget.headerSlot != null) widget.headerSlot!,
                Padding(
                  padding:
                      widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: ListView.separated(
                    itemBuilder: widget.itemBuilder!,
                    itemCount: widget.itemCount ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: widget.mainAxisSpacing);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Future<void> _onRefresh() async {
    await widget.onRefresh?.call();
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    if (widget.onLoading != null) {
      _refreshController.requestLoading();
      await widget.onLoading!();
    }

    _refreshController.loadComplete();
  }
}
