import 'package:dartz/dartz.dart';

abstract class SanctumLocalDatasource {
  /// Throws [CacheException] for all local error codes.

  // CREATE
  Future<Unit> createSanctum(String id);
  // RETRIEVE
  //Future<Sanctum> retrieveSanctum(String id);
  // UPGRADE
  //Future<Unit> upgradeSanctum(String id);
  // DELETE
  Future<Unit> deleteSanctum(String id);
}
