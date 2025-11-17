import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class RoundedTabBarView extends StatefulWidget {
  const RoundedTabBarView({
    super.key,
    required this.items,
    this.labelStyle,
    this.labelColor,
    this.unselectedLabelStyle,
    this.unselectedLabelColor,
    this.indicatorColor,
    this.padding,
    this.isScrollable = true,
    this.initialIndex = 0,
  });

  final List<RoundedTabBarViewItem> items;
  final TextStyle? labelStyle;
  final Color? labelColor;
  final TextStyle? unselectedLabelStyle;
  final Color? unselectedLabelColor;
  final Color? indicatorColor;
  final EdgeInsets? padding;
  final bool isScrollable;
  final int initialIndex;

  @override
  State<RoundedTabBarView> createState() => _RoundedTabBarViewState();
}

class _RoundedTabBarViewState extends State<RoundedTabBarView>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(
      length: widget.items.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: ButtonsTabBar(
            controller: _controller,
            labelStyle:
                widget.labelStyle ??
                AppTextStyles.text12.copyWith(color: AppColors.white),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 12,
            ),
            splashColor: AppColors.stroke.withOpacity(.2),
            backgroundColor: AppColors.darkPrimary,
            unselectedBackgroundColor: AppColors.grayF0,
            radius: 20,
            buttonMargin: const EdgeInsets.symmetric(horizontal: 10),
            unselectedLabelStyle:
                widget.unselectedLabelStyle ??
                AppTextStyles.text12.copyWith(color: AppColors.gray),
            tabs: List.generate(
              widget.items.length,
              (index) => Tab(text: widget.items[index].title),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
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

class RoundedTabBarViewItem {
  String title;
  Widget child;
  RoundedTabBarViewItem({required this.title, required this.child});
}

const double _kTabHeight = 30.0;

class ButtonsTabBar extends StatefulWidget implements PreferredSizeWidget {
  const ButtonsTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.duration = 100,
    this.backgroundColor,
    this.unselectedBackgroundColor,
    this.decoration,
    this.unselectedDecoration,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.splashColor,
    this.borderWidth = 0,
    this.borderColor = Colors.black,
    this.unselectedBorderColor = Colors.black,
    this.physics = const BouncingScrollPhysics(),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 4),
    this.buttonMargin = EdgeInsets.zero,
    this.labelSpacing = 4.0,
    this.radius = 7.0,
    this.elevation = 0,
    this.height = _kTabHeight,
    this.center = false,
    this.onTap,
  });

  final List<Widget> tabs;
  final TabController? controller;
  final int duration;
  final Color? backgroundColor;
  final Color? unselectedBackgroundColor;
  final Color? splashColor;
  final BoxDecoration? decoration;
  final BoxDecoration? unselectedDecoration;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final double borderWidth;
  final Color borderColor;
  final Color unselectedBorderColor;
  final ScrollPhysics physics;
  final EdgeInsets contentPadding;
  final EdgeInsets buttonMargin;
  final double labelSpacing;
  final double radius;
  final double elevation;
  final double? height;
  final bool center;

  final void Function(int)? onTap;

  @override
  Size get preferredSize {
    return Size.fromHeight(
      height ?? (_kTabHeight + contentPadding.vertical + buttonMargin.vertical),
    );
  }

  @override
  _ButtonsTabBarState createState() => _ButtonsTabBarState();
}

class _ButtonsTabBarState extends State<ButtonsTabBar>
    with TickerProviderStateMixin {
  TabController? _controller;

  final ScrollController _scrollController = ScrollController();

  late AnimationController _animationController;

  late List<GlobalKey> _tabKeys;
  final GlobalKey _tabsContainerKey = GlobalKey();
  final GlobalKey _tabsParentKey = GlobalKey();

  int _currentIndex = 0;
  int _prevIndex = -1;
  int _aniIndex = 0;
  double _prevAniValue = 0;

  late bool _textLTR;

  EdgeInsets _centerPadding = EdgeInsets.zero;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _getCenterPadding(context),
    );

    _tabKeys = widget.tabs.map((Widget tab) => GlobalKey()).toList();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    _animationController.value = 1.0;
    _animationController.addListener(() {
      setState(() {});
    });
  }

  void _updateTabController() {
    final newController = widget.controller ?? DefaultTabController.of(context);

    if (newController == _controller) return;

    if (_controllerIsValid) {
      _controller?.animation!.removeListener(_handleTabAnimation);
      _controller?.removeListener(_handleController);
    }
    _controller = newController;
    _controller?.animation!.addListener(_handleTabAnimation);
    _controller?.addListener(_handleController);
    _currentIndex = _controller!.index;
  }

  bool get _controllerIsValid => _controller?.animation != null;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assert(debugCheckHasMaterial(context));
    _updateTabController();
  }

  @override
  void didUpdateWidget(ButtonsTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      _updateTabController();
    }

    if (widget.tabs.length > oldWidget.tabs.length) {
      final int delta = widget.tabs.length - oldWidget.tabs.length;
      _tabKeys.addAll(List<GlobalKey>.generate(delta, (int n) => GlobalKey()));
    } else if (widget.tabs.length < oldWidget.tabs.length) {
      _tabKeys.removeRange(widget.tabs.length, oldWidget.tabs.length);
    }
  }

  void _handleController() {
    if (_controller!.indexIsChanging) {
      _goToIndex(_controller!.index);
    }
  }

  @override
  void dispose() {
    if (_controllerIsValid) {
      _controller!.animation!.removeListener(_handleTabAnimation);
      _controller!.removeListener(_handleController);
    }
    _controller = null;
    _scrollController.dispose();
    super.dispose();
  }

  void _getCenterPadding(BuildContext context) {
    final RenderBox tabsParent =
        _tabsParentKey.currentContext!.findRenderObject()! as RenderBox;
    final double screenWidth = tabsParent.size.width;

    RenderBox renderBox =
        _tabKeys.first.currentContext!.findRenderObject()! as RenderBox;
    double size = renderBox.size.width;
    final double left = (screenWidth - size) / 2;

    renderBox = _tabKeys.last.currentContext!.findRenderObject()! as RenderBox;
    size = renderBox.size.width;
    final double right = (screenWidth - size) / 2;
    _centerPadding = EdgeInsets.only(left: left, right: right);
  }

  Widget _buildButton(int index, Tab tab) {
    final double animationValue;
    if (index == _currentIndex) {
      animationValue = _animationController.value;
    } else if (index == _prevIndex) {
      animationValue = 1 - _animationController.value;
    } else {
      animationValue = 0;
    }

    final TextStyle? textStyle = TextStyle.lerp(
      widget.unselectedLabelStyle ?? const TextStyle(color: Colors.black),
      widget.labelStyle ?? const TextStyle(color: Colors.white),
      animationValue,
    );
    final Color? borderColor = Color.lerp(
      widget.unselectedBorderColor,
      widget.borderColor,
      animationValue,
    );
    final Color foregroundColor = textStyle?.color ?? Colors.black;

    final BoxDecoration? boxDecoration = BoxDecoration.lerp(
      BoxDecoration(
        color:
            widget.unselectedDecoration?.color ??
            widget.unselectedBackgroundColor ??
            Colors.grey[300],
        boxShadow: widget.unselectedDecoration?.boxShadow,
        gradient: widget.unselectedDecoration?.gradient,
        borderRadius:
            widget.unselectedDecoration?.borderRadius ??
            BorderRadius.circular(widget.radius),
      ),
      BoxDecoration(
        color:
            widget.decoration?.color ??
            widget.backgroundColor ??
            Theme.of(context).colorScheme.secondary,
        boxShadow: widget.decoration?.boxShadow,
        gradient: widget.decoration?.gradient,
        borderRadius:
            widget.decoration?.borderRadius ??
            BorderRadius.circular(widget.radius),
      ),
      animationValue,
    );

    EdgeInsets margin;

    if (index == 0) {
      margin = EdgeInsets.only(
        top: widget.buttonMargin.top,
        bottom: widget.buttonMargin.bottom,
        left: widget.buttonMargin.left,
        right: widget.buttonMargin.right / 2,
      );
    } else if (index == widget.tabs.length - 1) {
      margin = EdgeInsets.only(
        top: widget.buttonMargin.top,
        bottom: widget.buttonMargin.bottom,
        right: widget.buttonMargin.right,
        left: widget.buttonMargin.left / 2,
      );
    } else {
      margin = EdgeInsets.only(
        top: widget.buttonMargin.top,
        bottom: widget.buttonMargin.bottom,
        left: widget.buttonMargin.left / 2,
        right: widget.buttonMargin.right / 2,
      );
    }

    return Padding(
      key: _tabKeys[index],
      padding: margin,
      child: TextButton(
        onPressed: () {
          _controller?.animateTo(index);
          if (widget.onTap != null) widget.onTap?.call(index);
        },
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(widget.elevation),
          minimumSize: WidgetStateProperty.all(const Size(40, 40)),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          textStyle: WidgetStateProperty.all(textStyle),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: (widget.borderWidth == 0)
                  ? BorderSide.none
                  : BorderSide(
                      color: borderColor ?? Colors.black,
                      width: widget.borderWidth,
                    ),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
          overlayColor: WidgetStateProperty.all(widget.splashColor),
        ),
        child: Ink(
          decoration: boxDecoration,
          child: Container(
            padding: widget.contentPadding,
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                if (tab.icon != null)
                  IconTheme.merge(
                    data: IconThemeData(size: 24.0, color: foregroundColor),
                    child: tab.icon!,
                  )
                else
                  Container(),
                SizedBox(
                  width:
                      tab.icon == null ||
                          (tab.text == null && tab.child == null)
                      ? 0
                      : widget.labelSpacing,
                ),
                if (tab.text != null)
                  Text(tab.text!, style: textStyle)
                else
                  tab.child ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(() {
      if (_controller!.length != widget.tabs.length) {
        throw FlutterError(
          "Controller's length property (${_controller!.length}) does not match the "
          "number of tabs (${widget.tabs.length}) present in TabBar's tabs property.",
        );
      }
      return true;
    }());
    if (_controller!.length == 0) return Container(height: widget.height);

    _textLTR = Directionality.of(context).index == 1;
    return Opacity(
      opacity: (!widget.center || _centerPadding != EdgeInsets.zero) ? 1 : 0,
      child: AnimatedBuilder(
        animation: _animationController,
        key: _tabsParentKey,
        builder: (context, child) => SizedBox(
          key: _tabsContainerKey,
          height: widget.preferredSize.height,
          child: SingleChildScrollView(
            physics: widget.physics,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: widget.center ? _centerPadding : EdgeInsets.zero,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.tabs.length,
                (int index) => _buildButton(index, widget.tabs[index] as Tab),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleTabAnimation() {
    _aniIndex =
        ((_controller!.animation!.value > _prevAniValue)
                ? _controller!.animation!.value
                : _prevAniValue)
            .round();
    if (!_controller!.indexIsChanging && _aniIndex != _currentIndex) {
      _setCurrentIndex(_aniIndex);
    }
    _prevAniValue = _controller!.animation!.value;
  }

  void _goToIndex(int index) {
    if (index != _currentIndex) {
      _setCurrentIndex(index);
      _controller?.animateTo(index);
    }
  }

  void _setCurrentIndex(int index) {
    setState(() {
      _prevIndex = _currentIndex;
      _currentIndex = index;
    });
    _scrollTo(index);
    _triggerAnimation();
  }

  void _triggerAnimation() {
    _animationController.reset();

    _animationController.forward();
  }

  void _scrollTo(int index) {
    final RenderBox tabsContainer =
        _tabsContainerKey.currentContext!.findRenderObject()! as RenderBox;
    double screenWidth = tabsContainer.size.width;
    final tabsContainerPosition = tabsContainer.localToGlobal(Offset.zero).dx;

    final tabsContainerOffset = Offset(-tabsContainerPosition, 0);

    RenderBox renderBox =
        _tabKeys[index].currentContext!.findRenderObject()! as RenderBox;

    double size = renderBox.size.width;

    double position = renderBox.localToGlobal(tabsContainerOffset).dx;

    double offset = (position + size / 2) - screenWidth / 2;

    if (offset < 0) {
      renderBox =
          (_textLTR ? _tabKeys.first : _tabKeys.last).currentContext!
                  .findRenderObject()!
              as RenderBox;

      position = renderBox.localToGlobal(tabsContainerOffset).dx;

      if (!widget.center && position > offset) offset = position;
    } else {
      renderBox =
          (_textLTR ? _tabKeys.last : _tabKeys.first).currentContext!
                  .findRenderObject()!
              as RenderBox;

      position = renderBox.localToGlobal(tabsContainerOffset).dx;

      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (!widget.center && position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }
    offset *= (_textLTR ? 1 : -1);

    _scrollController.animateTo(
      offset + _scrollController.offset,
      duration: Duration(milliseconds: widget.duration),
      curve: Curves.easeInOut,
    );
  }
}
