// // FULL LIST
// @override
// Future<List<Sanctum>> getSanctumFullList() {
//   final jsonString = prefs.getString('sanctum_list');
//   if (jsonString != null) {
//     final jsonList = json.decode(jsonString).cast<Map<String, dynamic>>();
//     final sanctumList =
//     jsonList.map<Sanctum>((s) => Sanctum.fromJson(s)).toList();
//
//     return Future.value(sanctumList);
//   } else {
//     throw CacheException();
//   }
// }
//
// @override
// Future<List<Sanctum>> upgradeSanctumList(List<Sanctum> sanctumList) async {
//   var jsonSanctumList = '';
//   for (Sanctum sanctum in sanctumList) {
//     jsonSanctumList += jsonEncode(sanctum);
//   }
//   await prefs.setString('sanctum_list', jsonSanctumList);
//   return sanctumList;
// }
