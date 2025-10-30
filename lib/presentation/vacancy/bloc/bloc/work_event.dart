part of 'work_bloc.dart';

@freezed
class WorkEvent with _$WorkEvent {
  const factory WorkEvent.started() = _Started;
  const factory WorkEvent.fetchJobs({
    required int page,
    int? minimalGaji,
    int? maksimalGaji,
    String? search,
    String? jenis,
    String? tipe,
  }) = _FetchJobs;

  const factory WorkEvent.loadMore({
    int? minimalGaji,
    int? maksimalGaji,
    String? jenis,
  }) = _LoadMore;
}
