part of 'work_detail_bloc.dart';

@freezed
class WorkDetailEvent with _$WorkDetailEvent {
  const factory WorkDetailEvent.started() = _Started;
  const factory WorkDetailEvent.fetchDetail(String jobKey) = _FetchDetail;
}