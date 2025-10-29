part of 'work_bloc.dart';

@freezed
class WorkState with _$WorkState {
  const factory WorkState.initial() = _Initial;
  const factory WorkState.loading() = _Loading;
  const factory WorkState.loaded({
    required List<Datum> jobs,
    required bool hasReachedMax,
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(0) int perPage,
    @Default(0) int total,
  }) = _Loaded;
  const factory WorkState.error(String message) = _Error;
}
