// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sanctum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sanctum _$SanctumFromJson(Map<String, dynamic> json) {
  return _Sanctum.fromJson(json);
}

/// @nodoc
mixin _$Sanctum {
  String get id => throw _privateConstructorUsedError;
  String get element => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SanctumCopyWith<Sanctum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SanctumCopyWith<$Res> {
  factory $SanctumCopyWith(Sanctum value, $Res Function(Sanctum) then) =
      _$SanctumCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String element,
      String type,
      String name,
      int level,
      String description,
      List<String> info});
}

/// @nodoc
class _$SanctumCopyWithImpl<$Res> implements $SanctumCopyWith<$Res> {
  _$SanctumCopyWithImpl(this._value, this._then);

  final Sanctum _value;
  // ignore: unused_field
  final $Res Function(Sanctum) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? element = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? description = freezed,
    Object? info = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_SanctumCopyWith<$Res> implements $SanctumCopyWith<$Res> {
  factory _$$_SanctumCopyWith(
          _$_Sanctum value, $Res Function(_$_Sanctum) then) =
      __$$_SanctumCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String element,
      String type,
      String name,
      int level,
      String description,
      List<String> info});
}

/// @nodoc
class __$$_SanctumCopyWithImpl<$Res> extends _$SanctumCopyWithImpl<$Res>
    implements _$$_SanctumCopyWith<$Res> {
  __$$_SanctumCopyWithImpl(_$_Sanctum _value, $Res Function(_$_Sanctum) _then)
      : super(_value, (v) => _then(v as _$_Sanctum));

  @override
  _$_Sanctum get _value => super._value as _$_Sanctum;

  @override
  $Res call({
    Object? id = freezed,
    Object? element = freezed,
    Object? type = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? description = freezed,
    Object? info = freezed,
  }) {
    return _then(_$_Sanctum(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      element: element == freezed
          ? _value.element
          : element // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      info: info == freezed
          ? _value._info
          : info // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sanctum implements _Sanctum {
  const _$_Sanctum(
      {required this.id,
      required this.element,
      required this.type,
      required this.name,
      required this.level,
      required this.description,
      required final List<String> info})
      : _info = info;

  factory _$_Sanctum.fromJson(Map<String, dynamic> json) =>
      _$$_SanctumFromJson(json);

  @override
  final String id;
  @override
  final String element;
  @override
  final String type;
  @override
  final String name;
  @override
  final int level;
  @override
  final String description;
  final List<String> _info;
  @override
  List<String> get info {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_info);
  }

  @override
  String toString() {
    return 'Sanctum(id: $id, element: $element, type: $type, name: $name, level: $level, description: $description, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sanctum &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.element, element) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other._info, _info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(element),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(_info));

  @JsonKey(ignore: true)
  @override
  _$$_SanctumCopyWith<_$_Sanctum> get copyWith =>
      __$$_SanctumCopyWithImpl<_$_Sanctum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SanctumToJson(
      this,
    );
  }
}

abstract class _Sanctum implements Sanctum {
  const factory _Sanctum(
      {required final String id,
      required final String element,
      required final String type,
      required final String name,
      required final int level,
      required final String description,
      required final List<String> info}) = _$_Sanctum;

  factory _Sanctum.fromJson(Map<String, dynamic> json) = _$_Sanctum.fromJson;

  @override
  String get id;
  @override
  String get element;
  @override
  String get type;
  @override
  String get name;
  @override
  int get level;
  @override
  String get description;
  @override
  List<String> get info;
  @override
  @JsonKey(ignore: true)
  _$$_SanctumCopyWith<_$_Sanctum> get copyWith =>
      throw _privateConstructorUsedError;
}
