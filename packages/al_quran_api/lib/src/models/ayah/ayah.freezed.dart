// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ayah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ayah {

@HiveField(0) int? get number;@HiveField(1) String? get text;
/// Create a copy of Ayah
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AyahCopyWith<Ayah> get copyWith => _$AyahCopyWithImpl<Ayah>(this as Ayah, _$identity);

  /// Serializes this Ayah to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Ayah;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ayah&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.text, _this.text) || other.text == _this.text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Ayah;
  return Object.hash(runtimeType,_this.number,_this.text);
}

@override
String toString() {
  final _this = this as Ayah;
  return 'Ayah(number: ${_this.number}, text: ${_this.text})';
}


}

/// @nodoc
abstract mixin class $AyahCopyWith<$Res>  {
  factory $AyahCopyWith(Ayah value, $Res Function(Ayah) _then) = _$AyahCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? number,@HiveField(1) String? text
});




}
/// @nodoc
class _$AyahCopyWithImpl<$Res>
    implements $AyahCopyWith<$Res> {
  _$AyahCopyWithImpl(this._self, this._then);

  final Ayah _self;
  final $Res Function(Ayah) _then;

/// Create a copy of Ayah
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? text = freezed,}) {
  return _then(Ayah(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Ayah].
extension AyahPatterns on Ayah {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ayah value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ayah() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ayah value)  $default,){
final _that = this;
switch (_that) {
case _Ayah():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ayah value)?  $default,){
final _that = this;
switch (_that) {
case _Ayah() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int? number, @HiveField(1)  String? text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ayah() when $default != null:
return $default(_that.number,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int? number, @HiveField(1)  String? text)  $default,) {final _that = this;
switch (_that) {
case _Ayah():
return $default(_that.number,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int? number, @HiveField(1)  String? text)?  $default,) {final _that = this;
switch (_that) {
case _Ayah() when $default != null:
return $default(_that.number,_that.text);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: AppHiveTypes.ayah, adapterName: 'AyahAdapter')
class _Ayah extends Ayah {
  const _Ayah({@HiveField(0) this.number, @HiveField(1) this.text}): super._();
  factory _Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

@override@HiveField(0) final  int? number;
@override@HiveField(1) final  String? text;

/// Create a copy of Ayah
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AyahCopyWith<_Ayah> get copyWith => __$AyahCopyWithImpl<_Ayah>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AyahToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ayah&&(identical(other.number, number) || other.number == number)&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,text);
}

@override
String toString() {
    return 'Ayah(number: $number, text: $text)';
}


}

/// @nodoc
abstract mixin class _$AyahCopyWith<$Res> implements $AyahCopyWith<$Res> {
  factory _$AyahCopyWith(_Ayah value, $Res Function(_Ayah) _then) = __$AyahCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? number,@HiveField(1) String? text
});




}
/// @nodoc
class __$AyahCopyWithImpl<$Res>
    implements _$AyahCopyWith<$Res> {
  __$AyahCopyWithImpl(this._self, this._then);

  final _Ayah _self;
  final $Res Function(_Ayah) _then;

/// Create a copy of Ayah
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? text = freezed,}) {
  return _then(_Ayah(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
