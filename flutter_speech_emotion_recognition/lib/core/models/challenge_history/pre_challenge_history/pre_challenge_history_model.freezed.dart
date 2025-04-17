// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pre_challenge_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreChallengeHistoryModel {

 int get id; String get challenge_title; double get score;
/// Create a copy of PreChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreChallengeHistoryModelCopyWith<PreChallengeHistoryModel> get copyWith => _$PreChallengeHistoryModelCopyWithImpl<PreChallengeHistoryModel>(this as PreChallengeHistoryModel, _$identity);

  /// Serializes this PreChallengeHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreChallengeHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.challenge_title, challenge_title) || other.challenge_title == challenge_title)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,challenge_title,score);

@override
String toString() {
  return 'PreChallengeHistoryModel(id: $id, challenge_title: $challenge_title, score: $score)';
}


}

/// @nodoc
abstract mixin class $PreChallengeHistoryModelCopyWith<$Res>  {
  factory $PreChallengeHistoryModelCopyWith(PreChallengeHistoryModel value, $Res Function(PreChallengeHistoryModel) _then) = _$PreChallengeHistoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String challenge_title, double score
});




}
/// @nodoc
class _$PreChallengeHistoryModelCopyWithImpl<$Res>
    implements $PreChallengeHistoryModelCopyWith<$Res> {
  _$PreChallengeHistoryModelCopyWithImpl(this._self, this._then);

  final PreChallengeHistoryModel _self;
  final $Res Function(PreChallengeHistoryModel) _then;

/// Create a copy of PreChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? challenge_title = null,Object? score = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,challenge_title: null == challenge_title ? _self.challenge_title : challenge_title // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PreChallengeHistoryModel implements PreChallengeHistoryModel {
  const _PreChallengeHistoryModel({required this.id, required this.challenge_title, required this.score});
  factory _PreChallengeHistoryModel.fromJson(Map<String, dynamic> json) => _$PreChallengeHistoryModelFromJson(json);

@override final  int id;
@override final  String challenge_title;
@override final  double score;

/// Create a copy of PreChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreChallengeHistoryModelCopyWith<_PreChallengeHistoryModel> get copyWith => __$PreChallengeHistoryModelCopyWithImpl<_PreChallengeHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreChallengeHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreChallengeHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.challenge_title, challenge_title) || other.challenge_title == challenge_title)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,challenge_title,score);

@override
String toString() {
  return 'PreChallengeHistoryModel(id: $id, challenge_title: $challenge_title, score: $score)';
}


}

/// @nodoc
abstract mixin class _$PreChallengeHistoryModelCopyWith<$Res> implements $PreChallengeHistoryModelCopyWith<$Res> {
  factory _$PreChallengeHistoryModelCopyWith(_PreChallengeHistoryModel value, $Res Function(_PreChallengeHistoryModel) _then) = __$PreChallengeHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String challenge_title, double score
});




}
/// @nodoc
class __$PreChallengeHistoryModelCopyWithImpl<$Res>
    implements _$PreChallengeHistoryModelCopyWith<$Res> {
  __$PreChallengeHistoryModelCopyWithImpl(this._self, this._then);

  final _PreChallengeHistoryModel _self;
  final $Res Function(_PreChallengeHistoryModel) _then;

/// Create a copy of PreChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? challenge_title = null,Object? score = null,}) {
  return _then(_PreChallengeHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,challenge_title: null == challenge_title ? _self.challenge_title : challenge_title // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
