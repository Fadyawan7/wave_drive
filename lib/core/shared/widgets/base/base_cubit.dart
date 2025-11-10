import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';

abstract class BaseCubit<State> extends BlocBase<State> {
  BaseCubit(super.initialState);

  @override
  void emit(State state) {
    if (isClosed) {
      AppLogger.w('[D][$this] Cannot emit new states after calling close');
      return;
    }

    super.emit(state);
  }
}
