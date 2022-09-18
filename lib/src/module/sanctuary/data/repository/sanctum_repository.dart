import 'package:dartz/dartz.dart';

import '../../../../common/error/failure.dart';

abstract class SanctumRepository {
  // CREATE
  Future<Either<Failure, Unit>> createSanctum(String id);
  // READ
  // Future<Either<Failure, Sanctum>> retrieveSanctum(String id);
  // UPGRADE
  // Future<Either<Failure, Unit>> upgradeSanctum(String id);
  // DELETE
  Future<Either<Failure, Unit>> deleteSanctum(String id);
}
