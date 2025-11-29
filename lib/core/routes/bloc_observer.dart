import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.d(
      '[STATE CHANGE] ${bloc.runtimeType} → '
      'old: ${change.currentState}, new: ${change.nextState}',
    );
  }
}
