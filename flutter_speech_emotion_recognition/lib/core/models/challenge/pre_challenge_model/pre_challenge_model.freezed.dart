// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pre_challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreChallengeModel {

 int get id; String get title; String get description; String get sentence; int get level;
/// Create a copy of PreChallengeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreChallengeModelCopyWith<PreChallengeModel> get copyWith => _$PreChallengeModelCopyWithImpl<PreChallengeModel>(this as PreChallengeModel, _$identity);

  /// Serializes this PreChallengeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreChallengeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sentence, sentence) || other.sentence == sentence)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,sentence,level);

@override
String toString() {
  return 'PreChallengeModel(id: $id, title: $title, description: $description, sentence: $sentence, level: $level)';
}


}

/// @nodoc
abstract mixin class $PreChallengeModelCopyWith<$Res>  {
  factory $PreChallengeModelCopyWith(PreChallengeModel value, $Res Function(PreChallengeModel) _then) = _$PreChallengeModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String sentence, int level
});




}
/// @nodoc
class _$PreChallengeModelCopyWithImpl<$Res>
    implements $PreChallengeModelCopyWith<$Res> {
  _$PreChallengeModelCopyWithImpl(this._self, this._then);

  final PreChallengeModel _self;
  final $Res Function(PreChallengeModel) _then;

/// Create a copy of PreChallengeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? sentence = null,Object? level = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sentence: null == sentence ? _self.sentence : sentence // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PreChallengeModel implements PreChallengeModel {
  const _PreChallengeModel({required this.id, required this.title, required this.description, required this.sentence, required this.level});
  factory _PreChallengeModel.fromJson(Map<String, dynamic> json) => _$PreChallengeModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String sentence;
@override final  int level;

/// Create a copy of PreChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreChallengeModelCopyWith<_PreChallengeModel> get copyWith => __$PreChallengeModelCopyWithImpl<_PreChallengeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreChallengeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreChallengeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sentence, sentence) || other.sentence == sentence)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,sentence,level);

@override
String toString() {
  return 'PreChallengeModel(id: $id, title: $title, description: $description, sentence: $sentence, level: $level)';
}


}

/// @nodoc
abstract mixin class _$PreChallengeModelCopyWith<$Res> implements $PreChallengeModelCopyWith<$Res> {
  factory _$PreChallengeModelCopyWith(_PreChallengeModel value, $Res Function(_PreChallengeModel) _then) = __$PreChallengeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String sentence, int level
});




}
/// @nodoc
class __$PreChallengeModelCopyWithImpl<$Res>
    implements _$PreChallengeModelCopyWith<$Res> {
  __$PreChallengeModelCopyWithImpl(this._self, this._then);

  final _PreChallengeModel _self;
  final $Res Function(_PreChallengeModel) _then;

/// Create a copy of PreChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? sentence = null,Object? level = null,}) {
  return _then(_PreChallengeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sentence: null == sentence ? _self.sentence : sentence // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
