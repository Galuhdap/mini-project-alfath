part of 'working_bloc.dart';

@freezed
class WorkingState with _$WorkingState {
  const factory WorkingState.initial() = _Initial;
  const factory WorkingState.loading() = _Loading;
  const factory WorkingState.loaded({
    required List<Datum> jobs,
    required bool hasReachedMax,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(0) int perPage,
    @Default(0) int total,
  }) = _Loaded;
  const factory WorkingState.error(String message) = _Error;
}
