import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/error/exception.dart';
import '../../../../common/utils/file_reader.dart';
import 'sanctum_local_datasource.dart';

class SanctumLocalDatasourceImpl implements SanctumLocalDatasource {
  final SharedPreferences prefs;

  SanctumLocalDatasourceImpl({required this.prefs});

  //CRUD OPS
  @override
  Future<Unit> createSanctum(String id) async {
    // Test if it is empty to not override
    if (prefs.getString(id.toLowerCase()) == null) {
      // it is empty, get from Constant folder
      final sanctumJsonString = fileReader(
        folder: 'sanctuary',
        name: '$id.toLowerCase().json',
      );

      final result =
          await prefs.setString('$id.toLowerCase()', sanctumJsonString ?? '');
      if (result) {
        return Future.value(unit);
      } else {
        throw CacheException(); // prefs could not write
      }
    } else {
      throw CacheException(); // Sanctum already exists
    }
  }

  @override
  Future<Unit> deleteSanctum(String id) async {
    final result = await prefs.remove('sanctum_$id');
    if (result) {
      return Future.value(unit);
    } else {
      throw CacheException();
    }
  }
}
