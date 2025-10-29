import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/data/service/job_seeker_service.dart';

part 'work_event.dart';
part 'work_state.dart';
part 'work_bloc.freezed.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  final JobSeekerService service;
  int currentPage = 1;

  WorkBloc(this.service) : super(const WorkState.initial()) {
    on<_FetchJobs>(_onFetchJobs);
    on<_LoadMore>(_onLoadMore);
  }
  Future<void> _onFetchJobs(_FetchJobs event, Emitter<WorkState> emit) async {
    emit(const WorkState.loading());

    final result = await service.getActiveJobs(
      page: event.page,
      minimalGaji: event.minimalGaji,
      maksimalGaji: event.maksimalGaji,
      jenis: event.jenis,
    );

    result.fold((error) => emit(WorkState.error(error)), (data) {
      final jobs = data.data;
      final meta = data.meta;

      // ambil data pagination
      final currentPage = meta.currentPage;
      final lastPage = meta.lastPage;
      final perPage = meta.perPage;
      final total = meta.total;

      // cek apakah sudah sampai halaman terakhir
      final bool hasReachedMax = currentPage >= lastPage;

      emit(
        WorkState.loaded(
          jobs: jobs,
          hasReachedMax: hasReachedMax,
          currentPage: currentPage,
          lastPage: lastPage,
          perPage: perPage,
          total: total,
        ),
      );
    });
  }

  Future<void> _onLoadMore(_LoadMore event, Emitter<WorkState> emit) async {
    // Pastikan state sekarang sudah loaded
    final currentState = state;
    if (currentState is! _Loaded) return;
    if (currentState.hasReachedMax) return;

    // Ambil data lama
    final oldJobs = currentState.jobs;

    final result = await service.getActiveJobs(
      page: currentPage,
      minimalGaji: event.minimalGaji,
      maksimalGaji: event.maksimalGaji,
      jenis: event.jenis,
    );

    result.fold((error) => emit(WorkState.error(error)), (data) {
      final newJobs = data.data;
      final allJobs = List<Datum>.from(oldJobs)..addAll(newJobs);
      final hasReachedMax = newJobs.isEmpty;
      emit(WorkState.loaded(jobs: allJobs, hasReachedMax: hasReachedMax));
      currentPage++;
    });
  }
}
