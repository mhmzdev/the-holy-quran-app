// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'juz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Juz _$JuzFromJson(Map<String, dynamic> json) {
  return _Juz.fromJson(json);
}

/// @nodoc
mixin _$Juz {
  @HiveField(0)
  int? get number => throw _privateConstructorUsedError;
  @HiveField(1)
  List<Ayah?>? get ayahs => throw _privateConstructorUsedError;

  /// Serializes this Juz to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JuzCopyWith<Juz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JuzCopyWith<$Res> {
  factory $JuzCopyWith(Juz value, $Res Function(Juz) then) =
      _$JuzCopyWithImpl<$Res, Juz>;
  @useResult
  $Res call({@HiveField(0) int? number, @HiveField(1) List<Ayah?>? ayahs});
}

/// @nodoc
class _$JuzCopyWithImpl<$Res, $Val extends Juz> implements $JuzCopyWith<$Res> {
  _$JuzCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? ayahs = freezed,
  }) {
    return _then(_value.copyWith(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      ayahs: freezed == ayahs
          ? _value.ayahs
          : ayahs // ignore: cast_nullable_to_non_nullable
              as List<Ayah?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JuzImplCopyWith<$Res> implements $JuzCopyWith<$Res> {
  factory _$$JuzImplCopyWith(_$JuzImpl value, $Res Function(_$JuzImpl) then) =
      __$$JuzImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int? number, @HiveField(1) List<Ayah?>? ayahs});
}

/// @nodoc
class __$$JuzImplCopyWithImpl<$Res> extends _$JuzCopyWithImpl<$Res, _$JuzImpl>
    implements _$$JuzImplCopyWith<$Res> {
  __$$JuzImplCopyWithImpl(_$JuzImpl _value, $Res Function(_$JuzImpl) _then)
      : super(_value, _then);

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = freezed,
    Object? ayahs = freezed,
  }) {
    return _then(_$JuzImpl(
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      ayahs: freezed == ayahs
          ? _value.ayahs
          : ayahs // ignore: cast_nullable_to_non_nullable
              as List<Ayah?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: AppHiveTypes.juz, adapterName: 'JuzAdapter')
class _$JuzImpl extends _Juz {
  const _$JuzImpl({@HiveField(0) this.number, @HiveField(1) this.ayahs})
      : super._();

  factory _$JuzImpl.fromJson(Map<String, dynamic> json) =>
      _$$JuzImplFromJson(json);

  @override
  @HiveField(0)
  final int? number;
  @override
  @HiveField(1)
  final List<Ayah?>? ayahs;

  @override
  String toString() {
    return 'Juz(number: $number, ayahs: $ayahs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JuzImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other.ayahs, ayahs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, number, const DeepCollectionEquality().hash(ayahs));

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JuzImplCopyWith<_$JuzImpl> get copyWith =>
      __$$JuzImplCopyWithImpl<_$JuzImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JuzImplToJson(
      this,
    );
  }
}

abstract class _Juz extends Juz {
  const factory _Juz(
      {@HiveField(0) final int? number,
      @HiveField(1) final List<Ayah?>? ayahs}) = _$JuzImpl;
  const _Juz._() : super._();

  factory _Juz.fromJson(Map<String, dynamic> json) = _$JuzImpl.fromJson;

  @override
  @HiveField(0)
  int? get number;
  @override
  @HiveField(1)
  List<Ayah?>? get ayahs;

  /// Create a copy of Juz
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JuzImplCopyWith<_$JuzImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
