import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';
import 'package:mini_project_alfath/data/service/job_seeker_service.dart';

part 'working_event.dart';
part 'working_state.dart';
part 'working_bloc.freezed.dart';

class WorkingBloc extends Bloc<WorkingEvent, WorkingState> {
  final JobSeekerService service;
  int currentPage = 1;

  WorkingBloc(this.service) : super(const WorkingState.initial()) {
    on<_FetchJobs>(_onFetchJobs);
  }

  Future<void> _onFetchJobs(
    _FetchJobs event,
    Emitter<WorkingState> emit,
  ) async {
    emit(const WorkingState.loading());

    final result = await service.getActiveJobs(
      page: event.page,
      minimalGaji: event.minimalGaji,
      maksimalGaji: event.maksimalGaji,
      jenis: event.jenis,
      tipe: event.tipe,
    );

    result.fold((error) => emit(WorkingState.error(error)), (data) {
      final jobs = data.data;
      final meta = data.meta;

      // ambil data pagination
      final currentPage = meta.currentPage;
      final lastPage = meta.lastPage;
      final perPage = meta.perPage;
      final total = meta.total;

      emit(
        WorkingState.loaded(
          jobs: jobs,
          hasReachedMax: true,
          currentPage: currentPage!,
          lastPage: lastPage!,
          perPage: perPage!,
          total: total!,
        ),
      );
    });
  }
}
