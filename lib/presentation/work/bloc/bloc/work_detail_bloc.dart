import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_project_alfath/data/model/get_detail_job_seeker_response.dart';
import 'package:mini_project_alfath/data/service/job_seeker_service.dart';

part 'work_detail_event.dart';
part 'work_detail_state.dart';
part 'work_detail_bloc.freezed.dart';

class WorkDetailBloc extends Bloc<WorkDetailEvent, WorkDetailState> {
  final JobSeekerService service;

  WorkDetailBloc(this.service) : super(_Initial()) {
    on<_FetchDetail>(_onFetchDetail);
  }

  Future<void> _onFetchDetail(
    _FetchDetail event,
    Emitter<WorkDetailState> emit,
  ) async {
    emit(const WorkDetailState.loading());

    final result = await service.getJobDetail(event.jobKey);

    result.fold(
      (error) => emit(WorkDetailState.error(error)),
      (data) => emit(WorkDetailState.loaded(data)),
    );
  }
}
