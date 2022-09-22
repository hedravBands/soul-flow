import 'package:dartz/dartz.dart';
import 'package:soulflow/src/common/error/exception.dart';
import 'package:soulflow/src/common/error/failure.dart';
import 'package:soulflow/src/module/sanctuary/data/repository/sanctum_repository.dart';

import '../datasource/sanctum_local_datasource.dart';

class SanctumRepositoryImpl implements SanctumRepository {
  final SanctumLocalDatasource localDatasource;

  SanctumRepositoryImpl({required this.localDatasource});

  @override
  Future<Either<Failure, Unit>> createSanctum(String id) async {
    try {
      final result = await localDatasource.createSanctum(id);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteSanctum(String id) async {
    try {
      final result = await localDatasource.deleteSanctum(id);
      return const Right(unit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
