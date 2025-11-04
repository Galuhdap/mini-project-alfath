part of 'working_bloc.dart';

@freezed
class WorkingEvent with _$WorkingEvent {
  const factory WorkingEvent.started() = _Started;
  const factory WorkingEvent.fetchJobs({
    required int page,
    int? minimalGaji,
    int? maksimalGaji,
    String? search,
    String? jenis,
    List<int>? tipe,
  }) = _FetchJobs;

  const factory WorkingEvent.loadMore({
    int? minimalGaji,
    int? maksimalGaji,
    String? jenis,
  }) = _LoadMore;
}
