// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'juz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Juz {

@HiveField(0) int? get number;@HiveField(1) List<Ayah?>? get ayahs;
/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JuzCopyWith<Juz> get copyWith => _$JuzCopyWithImpl<Juz>(this as Juz, _$identity);

  /// Serializes this Juz to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Juz;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Juz&&(identical(other.number, _this.number) || other.number == _this.number)&&const DeepCollectionEquality().equals(other.ayahs, _this.ayahs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Juz;
  return Object.hash(runtimeType,_this.number,const DeepCollectionEquality().hash(_this.ayahs));
}

@override
String toString() {
  final _this = this as Juz;
  return 'Juz(number: ${_this.number}, ayahs: ${_this.ayahs})';
}


}

/// @nodoc
abstract mixin class $JuzCopyWith<$Res>  {
  factory $JuzCopyWith(Juz value, $Res Function(Juz) _then) = _$JuzCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? number,@HiveField(1) List<Ayah?>? ayahs
});




}
/// @nodoc
class _$JuzCopyWithImpl<$Res>
    implements $JuzCopyWith<$Res> {
  _$JuzCopyWithImpl(this._self, this._then);

  final Juz _self;
  final $Res Function(Juz) _then;

/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? ayahs = freezed,}) {
  return _then(Juz(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,ayahs: freezed == ayahs ? _self.ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as List<Ayah?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Juz].
extension JuzPatterns on Juz {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Juz value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Juz() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Juz value)  $default,){
final _that = this;
switch (_that) {
case _Juz():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Juz value)?  $default,){
final _that = this;
switch (_that) {
case _Juz() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int? number, @HiveField(1)  List<Ayah?>? ayahs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Juz() when $default != null:
return $default(_that.number,_that.ayahs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int? number, @HiveField(1)  List<Ayah?>? ayahs)  $default,) {final _that = this;
switch (_that) {
case _Juz():
return $default(_that.number,_that.ayahs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int? number, @HiveField(1)  List<Ayah?>? ayahs)?  $default,) {final _that = this;
switch (_that) {
case _Juz() when $default != null:
return $default(_that.number,_that.ayahs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: AppHiveTypes.juz, adapterName: 'JuzAdapter')
class _Juz extends Juz {
  const _Juz({@HiveField(0) this.number, @HiveField(1) this.ayahs}): super._();
  factory _Juz.fromJson(Map<String, dynamic> json) => _$JuzFromJson(json);

@override@HiveField(0) final  int? number;
@override@HiveField(1) final  List<Ayah?>? ayahs;

/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JuzCopyWith<_Juz> get copyWith => __$JuzCopyWithImpl<_Juz>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JuzToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Juz&&(identical(other.number, number) || other.number == number)&&const DeepCollectionEquality().equals(other.ayahs, ayahs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,const DeepCollectionEquality().hash(ayahs));
}

@override
String toString() {
    return 'Juz(number: $number, ayahs: $ayahs)';
}


}

/// @nodoc
abstract mixin class _$JuzCopyWith<$Res> implements $JuzCopyWith<$Res> {
  factory _$JuzCopyWith(_Juz value, $Res Function(_Juz) _then) = __$JuzCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? number,@HiveField(1) List<Ayah?>? ayahs
});




}
/// @nodoc
class __$JuzCopyWithImpl<$Res>
    implements _$JuzCopyWith<$Res> {
  __$JuzCopyWithImpl(this._self, this._then);

  final _Juz _self;
  final $Res Function(_Juz) _then;

/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? ayahs = freezed,}) {
  return _then(_Juz(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,ayahs: freezed == ayahs ? _self.ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as List<Ayah?>?,
  ));
}


}

// dart format on
