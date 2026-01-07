import 'dart:async';
import 'dart:convert';

import 'package:extended_image/extended_image.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/data/models/ride_request/ride_request_model.dart';
import 'package:wave_drive/core/shared/extensions/media_query_extension.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/injector_setup.dart';
import 'package:wave_drive/modules/home/widgets/bottom_trevel_details_sheet.dart';
import 'package:wave_drive/modules/home/widgets/user_request_bottom_sheet.dart';
import 'package:wave_drive/modules/ride/cubit/ride_cubit.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [Positioned.fill(child: child)]),
    );
  }
}

