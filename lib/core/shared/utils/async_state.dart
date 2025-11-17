typedef AsyncErrorBuilder<E> = E Function(dynamic error, StackTrace? stack);
typedef AsyncDataBuilder<E, T> = E Function(T value);
typedef AsyncStateBuilder<E> = E Function();

sealed class AsyncState<T> {
  final bool isLoading;
  final T? _value;
  final (Object, StackTrace?)? _error;

  const AsyncState({
    required this.isLoading,
    required T? value,
    required (Object, StackTrace?)? error,
  })  : _value = value,
        _error = error;

  factory AsyncState.data(T data) {
    return AsyncData<T>(data);
  }

  factory AsyncState.error(Object error, [StackTrace? stackTrace]) {
    return AsyncError<T>(error, stackTrace ?? StackTrace.current);
  }

  factory AsyncState.loading() {
    return AsyncLoading<T>();
  }

  bool get hasValue;
  bool get hasError;
  bool get isRefreshing =>
      isLoading && (hasValue || hasError) && this is! AsyncLoading<T>;
  bool get isReloading => (hasValue || hasError) && this is AsyncLoading<T>;
  bool get isInitLoading => isLoading && !hasValue && this is AsyncLoading<T>;

  T get requireValue => _value as T;
  T? get value => _value;
  Object? get error => _error?.$1;
  StackTrace? get stackTrace => _error?.$2;

  E map<E>({
    required AsyncDataBuilder<E, T> data,
    required AsyncErrorBuilder<E> error,
    required AsyncStateBuilder<E> loading,
    AsyncStateBuilder<E>? reloading,
    AsyncStateBuilder<E>? refreshing,
  }) {
    if (isRefreshing) if (refreshing != null) return refreshing();
    if (isReloading) if (reloading != null) return reloading();
    if (hasValue) return data(value as T);
    if (hasError) return error(this.error, stackTrace);

    return loading();
  }

  E maybeMap<E>({
    AsyncDataBuilder<E, T>? data,
    AsyncErrorBuilder<E>? error,
    AsyncStateBuilder<E>? loading,
    AsyncStateBuilder<E>? reloading,
    AsyncStateBuilder<E>? refreshing,
    required AsyncStateBuilder<E> orElse,
  }) {
    if (isRefreshing) if (refreshing != null) return refreshing();
    if (isReloading) if (reloading != null) return reloading();
    if (hasValue) if (data != null) return data(value as T);
    if (hasError) {
      if (error != null) {
        return error(this.error, stackTrace);
      }
    }
    if (isLoading) if (loading != null) return loading();
    return orElse();
  }

  @override
  bool operator ==(covariant AsyncState<T> other) {
    if (identical(this, other)) return true;
    return other.hasError == hasError &&
        other.hasValue == hasValue &&
        other.isLoading == isLoading &&
        other.isRefreshing == isRefreshing &&
        other.isReloading == isReloading &&
        other._value == _value &&
        other._error == _error;
  }

  @override
  int get hashCode {
    return hasError.hashCode ^
        hasValue.hashCode ^
        isLoading.hashCode ^
        isRefreshing.hashCode ^
        isReloading.hashCode ^
        _value.hashCode ^
        _error.hashCode;
  }
}

class AsyncData<T> extends AsyncState<T> {
  const AsyncData(
    T data, {
    super.isLoading = false,
    super.error,
  }) : super(value: data);

  @override
  bool get hasValue => true;

  @override
  bool get hasError => false;

  @override
  T get value => super.value as T;
}

class AsyncError<T> extends AsyncState<T> {
  const AsyncError(
    Object error,
    StackTrace? stackTrace, {
    super.isLoading = false,
    super.value,
  }) : super(error: (error, stackTrace));

  @override
  bool get hasValue => false;

  @override
  bool get hasError => true;

  @override
  Object get error => super.error ?? Object;
}

class AsyncLoading<T> extends AsyncState<T> {
  const AsyncLoading({
    super.value,
    super.error,
    super.isLoading = true,
    this.hasValue = false,
    this.hasError = false,
  });

  @override
  final bool hasValue;

  @override
  final bool hasError;
}
