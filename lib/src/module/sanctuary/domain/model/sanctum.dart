import 'package:freezed_annotation/freezed_annotation.dart';

part 'sanctum.freezed.dart';
part 'sanctum.g.dart';

@freezed
class Sanctum with _$Sanctum {
  const factory Sanctum({
    required String id,
    required String element,
    required String type,
    required String name,
    required int level,
    required String description,
    required List<String> info,
  }) = _Sanctum;

  factory Sanctum.fromJson(Map<String, dynamic> json) =>
      _$SanctumFromJson(json);
}
