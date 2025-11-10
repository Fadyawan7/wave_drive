import 'package:country_flags/country_flags.dart';
import 'package:flutter/widgets.dart';

class CountryFlagWidget extends StatelessWidget {
  const CountryFlagWidget({
    super.key,
    this.countryconde = "PK",
    this.width = 18,
    this.height = 18,
    this.borderRadius = 2,
  });

  final String countryconde;
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CountryFlag.fromCountryCode(
        countryconde,
        
        
      ),
    );
  }
}
