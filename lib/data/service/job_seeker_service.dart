import 'package:dartz/dartz.dart';
import 'package:mini_project_alfath/data/datasource/job_seeker/job_seeker_remote_datasource.dart';
import 'package:mini_project_alfath/data/model/get_detail_job_seeker_response.dart';
import 'package:mini_project_alfath/data/model/get_job_seeker_response.dart';

class JobSeekerService {
  final JobSeekerRemoteDatasource _remoteDatasource;

  JobSeekerService({JobSeekerRemoteDatasource? remoteDatasource})
    : _remoteDatasource = remoteDatasource ?? JobSeekerRemoteDatasource();

  Future<Either<String, GetJobSeeker>> getActiveJobs({
    int page = 1,
    int? minimalGaji,
    int? maksimalGaji,
    String? search,
    String? jenis,
    List<int>? tipe,
  }) async {
    try {
      final result = await _remoteDatasource.getActiveJobs(
        page: page,
        minimalGaji: minimalGaji,
        maksimalGaji: maksimalGaji,
        search: search,
        jenis: jenis,
        tipe: tipe,
      );

      return result;
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }

  Future<Either<String, GetDetailJobSeeker>> getJobDetail(String id) async {
    try {
      final result = await _remoteDatasource.getJobDetail(id);

      return result;
    } catch (e) {
      return Left('Unexpected error: ${e.toString()}');
    }
  }
}
