import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wave_drive/core/services/location_service.dart';
import 'package:wave_drive/core/shared/constants/enums.dart';
import 'package:wave_drive/injector_setup.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(locationState: LocationState()));


}
