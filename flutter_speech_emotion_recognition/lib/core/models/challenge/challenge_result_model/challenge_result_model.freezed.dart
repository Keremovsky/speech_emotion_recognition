// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeResultModel {

 double get score; double get average_score; List<double> get challenge_emotions; List<double> get emotions;
/// Create a copy of ChallengeResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeResultModelCopyWith<ChallengeResultModel> get copyWith => _$ChallengeResultModelCopyWithImpl<ChallengeResultModel>(this as ChallengeResultModel, _$identity);

  /// Serializes this ChallengeResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeResultModel&&(identical(other.score, score) || other.score == score)&&(identical(other.average_score, average_score) || other.average_score == average_score)&&const DeepCollectionEquality().equals(other.challenge_emotions, challenge_emotions)&&const DeepCollectionEquality().equals(other.emotions, emotions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,average_score,const DeepCollectionEquality().hash(challenge_emotions),const DeepCollectionEquality().hash(emotions));

@override
String toString() {
  return 'ChallengeResultModel(score: $score, average_score: $average_score, challenge_emotions: $challenge_emotions, emotions: $emotions)';
}


}

/// @nodoc
abstract mixin class $ChallengeResultModelCopyWith<$Res>  {
  factory $ChallengeResultModelCopyWith(ChallengeResultModel value, $Res Function(ChallengeResultModel) _then) = _$ChallengeResultModelCopyWithImpl;
@useResult
$Res call({
 double score, double average_score, List<double> challenge_emotions, List<double> emotions
});




}
/// @nodoc
class _$ChallengeResultModelCopyWithImpl<$Res>
    implements $ChallengeResultModelCopyWith<$Res> {
  _$ChallengeResultModelCopyWithImpl(this._self, this._then);

  final ChallengeResultModel _self;
  final $Res Function(ChallengeResultModel) _then;

/// Create a copy of ChallengeResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? score = null,Object? average_score = null,Object? challenge_emotions = null,Object? emotions = null,}) {
  return _then(_self.copyWith(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,average_score: null == average_score ? _self.average_score : average_score // ignore: cast_nullable_to_non_nullable
as double,challenge_emotions: null == challenge_emotions ? _self.challenge_emotions : challenge_emotions // ignore: cast_nullable_to_non_nullable
as List<double>,emotions: null == emotions ? _self.emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChallengeResultModel implements ChallengeResultModel {
  const _ChallengeResultModel({required this.score, required this.average_score, required final  List<double> challenge_emotions, required final  List<double> emotions}): _challenge_emotions = challenge_emotions,_emotions = emotions;
  factory _ChallengeResultModel.fromJson(Map<String, dynamic> json) => _$ChallengeResultModelFromJson(json);

@override final  double score;
@override final  double average_score;
 final  List<double> _challenge_emotions;
@override List<double> get challenge_emotions {
  if (_challenge_emotions is EqualUnmodifiableListView) return _challenge_emotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_challenge_emotions);
}

 final  List<double> _emotions;
@override List<double> get emotions {
  if (_emotions is EqualUnmodifiableListView) return _emotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emotions);
}


/// Create a copy of ChallengeResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeResultModelCopyWith<_ChallengeResultModel> get copyWith => __$ChallengeResultModelCopyWithImpl<_ChallengeResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeResultModel&&(identical(other.score, score) || other.score == score)&&(identical(other.average_score, average_score) || other.average_score == average_score)&&const DeepCollectionEquality().equals(other._challenge_emotions, _challenge_emotions)&&const DeepCollectionEquality().equals(other._emotions, _emotions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,score,average_score,const DeepCollectionEquality().hash(_challenge_emotions),const DeepCollectionEquality().hash(_emotions));

@override
String toString() {
  return 'ChallengeResultModel(score: $score, average_score: $average_score, challenge_emotions: $challenge_emotions, emotions: $emotions)';
}


}

/// @nodoc
abstract mixin class _$ChallengeResultModelCopyWith<$Res> implements $ChallengeResultModelCopyWith<$Res> {
  factory _$ChallengeResultModelCopyWith(_ChallengeResultModel value, $Res Function(_ChallengeResultModel) _then) = __$ChallengeResultModelCopyWithImpl;
@override @useResult
$Res call({
 double score, double average_score, List<double> challenge_emotions, List<double> emotions
});




}
/// @nodoc
class __$ChallengeResultModelCopyWithImpl<$Res>
    implements _$ChallengeResultModelCopyWith<$Res> {
  __$ChallengeResultModelCopyWithImpl(this._self, this._then);

  final _ChallengeResultModel _self;
  final $Res Function(_ChallengeResultModel) _then;

/// Create a copy of ChallengeResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? score = null,Object? average_score = null,Object? challenge_emotions = null,Object? emotions = null,}) {
  return _then(_ChallengeResultModel(
score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,average_score: null == average_score ? _self.average_score : average_score // ignore: cast_nullable_to_non_nullable
as double,challenge_emotions: null == challenge_emotions ? _self._challenge_emotions : challenge_emotions // ignore: cast_nullable_to_non_nullable
as List<double>,emotions: null == emotions ? _self._emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
