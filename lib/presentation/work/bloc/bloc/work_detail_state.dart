part of 'work_detail_bloc.dart';

@freezed
class WorkDetailState with _$WorkDetailState {
  const factory WorkDetailState.initial() = _Initial;
  const factory WorkDetailState.loading() = _Loading;
  const factory WorkDetailState.loaded(GetDetailJobSeeker jobDetail) = _Loaded;
  const factory WorkDetailState.error(String message) = _Error;
}
