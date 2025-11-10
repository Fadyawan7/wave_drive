import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class AppCarousel extends StatefulWidget {
  const AppCarousel({
    super.key,
    required this.items,
    this.autoPlay = true,
    // this.carouselController,
    this.initPage = 0,
    this.enableInfiniteScroll = true,
    this.aspectRatio = 1,
    this.inactiveIndicatorDecoration,
    this.activeIndicatorDecoration,
    this.showIndicators = true,
    this.indicatorBottom = 4,
    this.autoPlayInterval = 5,
    this.isCenter = false,
  });

  final BoxDecoration? activeIndicatorDecoration;
  final double aspectRatio;
  final bool autoPlay;
  // final CarouselController? carouselController;
  final bool enableInfiniteScroll;
  final BoxDecoration? inactiveIndicatorDecoration;
  final int initPage;
  final List<Widget> items;
  final bool showIndicators;
  final double indicatorBottom;
  final bool isCenter;
  final int autoPlayInterval;

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  late int _currentPage;

  @override
  void initState() {
    _currentPage = widget.initPage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CarouselSlider(
            //   carouselController: widget.carouselController,
            options: CarouselOptions(
              aspectRatio: widget.aspectRatio,
              initialPage: widget.initPage,
              viewportFraction: 1,
              autoPlay: widget.items.length > 1 && widget.autoPlay,
              enlargeFactor: .2,
              autoPlayInterval: Duration(seconds: widget.autoPlayInterval),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
              enableInfiniteScroll:
                  widget.items.length > 1 && widget.enableInfiniteScroll,
            ),
            items: widget.items
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ), // 👈 4+4 = 8
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
        if (widget.items.length > 1 && widget.showIndicators) _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    return Positioned.fill(
      bottom: widget.indicatorBottom,
      child: Align(
        alignment: Alignment.bottomCenter,
        // add padding new
        child: Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 6),
          child: Row(
            mainAxisAlignment: widget.isCenter
                ? MainAxisAlignment.center
                : MainAxisAlignment.start, // remove this new
            children: widget.items.asMap().entries.map((entry) {
              return Container(
                width: _currentPage == entry.key ? 8 : 7,
                height: _currentPage == entry.key ? 8 : 2,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: _currentPage == entry.key
                    ? widget.activeIndicatorDecoration ??
                          BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          )
                    : widget.inactiveIndicatorDecoration ??
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.white,
                          ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
