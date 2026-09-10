// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {

@HiveField(0) int? get number;@HiveField(1) String? get name;@HiveField(2) String? get englishName;@HiveField(3) String? get englishNameTranslation;@HiveField(4) String? get revelationType;@HiveField(5) List<Ayah?>? get ayahs;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Chapter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.englishName, _this.englishName) || other.englishName == _this.englishName)&&(identical(other.englishNameTranslation, _this.englishNameTranslation) || other.englishNameTranslation == _this.englishNameTranslation)&&(identical(other.revelationType, _this.revelationType) || other.revelationType == _this.revelationType)&&const DeepCollectionEquality().equals(other.ayahs, _this.ayahs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Chapter;
  return Object.hash(runtimeType,_this.number,_this.name,_this.englishName,_this.englishNameTranslation,_this.revelationType,const DeepCollectionEquality().hash(_this.ayahs));
}

@override
String toString() {
  final _this = this as Chapter;
  return 'Chapter(number: ${_this.number}, name: ${_this.name}, englishName: ${_this.englishName}, englishNameTranslation: ${_this.englishNameTranslation}, revelationType: ${_this.revelationType}, ayahs: ${_this.ayahs})';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
@HiveField(0) int? number,@HiveField(1) String? name,@HiveField(2) String? englishName,@HiveField(3) String? englishNameTranslation,@HiveField(4) String? revelationType,@HiveField(5) List<Ayah?>? ayahs
});




}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = freezed,Object? name = freezed,Object? englishName = freezed,Object? englishNameTranslation = freezed,Object? revelationType = freezed,Object? ayahs = freezed,}) {
  return _then(Chapter(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,englishName: freezed == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String?,englishNameTranslation: freezed == englishNameTranslation ? _self.englishNameTranslation : englishNameTranslation // ignore: cast_nullable_to_non_nullable
as String?,revelationType: freezed == revelationType ? _self.revelationType : revelationType // ignore: cast_nullable_to_non_nullable
as String?,ayahs: freezed == ayahs ? _self.ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as List<Ayah?>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  int? number, @HiveField(1)  String? name, @HiveField(2)  String? englishName, @HiveField(3)  String? englishNameTranslation, @HiveField(4)  String? revelationType, @HiveField(5)  List<Ayah?>? ayahs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.revelationType,_that.ayahs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  int? number, @HiveField(1)  String? name, @HiveField(2)  String? englishName, @HiveField(3)  String? englishNameTranslation, @HiveField(4)  String? revelationType, @HiveField(5)  List<Ayah?>? ayahs)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.revelationType,_that.ayahs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  int? number, @HiveField(1)  String? name, @HiveField(2)  String? englishName, @HiveField(3)  String? englishNameTranslation, @HiveField(4)  String? revelationType, @HiveField(5)  List<Ayah?>? ayahs)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.number,_that.name,_that.englishName,_that.englishNameTranslation,_that.revelationType,_that.ayahs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: AppHiveTypes.chapter, adapterName: 'ChapterAdapter')
class _Chapter extends Chapter {
  const _Chapter({@HiveField(0) this.number, @HiveField(1) this.name, @HiveField(2) this.englishName, @HiveField(3) this.englishNameTranslation, @HiveField(4) this.revelationType, @HiveField(5) this.ayahs}): super._();
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override@HiveField(0) final  int? number;
@override@HiveField(1) final  String? name;
@override@HiveField(2) final  String? englishName;
@override@HiveField(3) final  String? englishNameTranslation;
@override@HiveField(4) final  String? revelationType;
@override@HiveField(5) final  List<Ayah?>? ayahs;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.number, number) || other.number == number)&&(identical(other.name, name) || other.name == name)&&(identical(other.englishName, englishName) || other.englishName == englishName)&&(identical(other.englishNameTranslation, englishNameTranslation) || other.englishNameTranslation == englishNameTranslation)&&(identical(other.revelationType, revelationType) || other.revelationType == revelationType)&&const DeepCollectionEquality().equals(other.ayahs, ayahs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,name,englishName,englishNameTranslation,revelationType,const DeepCollectionEquality().hash(ayahs));
}

@override
String toString() {
    return 'Chapter(number: $number, name: $name, englishName: $englishName, englishNameTranslation: $englishNameTranslation, revelationType: $revelationType, ayahs: $ayahs)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) int? number,@HiveField(1) String? name,@HiveField(2) String? englishName,@HiveField(3) String? englishNameTranslation,@HiveField(4) String? revelationType,@HiveField(5) List<Ayah?>? ayahs
});




}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = freezed,Object? name = freezed,Object? englishName = freezed,Object? englishNameTranslation = freezed,Object? revelationType = freezed,Object? ayahs = freezed,}) {
  return _then(_Chapter(
number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,englishName: freezed == englishName ? _self.englishName : englishName // ignore: cast_nullable_to_non_nullable
as String?,englishNameTranslation: freezed == englishNameTranslation ? _self.englishNameTranslation : englishNameTranslation // ignore: cast_nullable_to_non_nullable
as String?,revelationType: freezed == revelationType ? _self.revelationType : revelationType // ignore: cast_nullable_to_non_nullable
as String?,ayahs: freezed == ayahs ? _self.ayahs : ayahs // ignore: cast_nullable_to_non_nullable
as List<Ayah?>?,
  ));
}


}

// dart format on
