// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_challenge_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostChallengeHistoryModel {

 String get challenge_description; String get challenge_sentence;@LevelIntToStringConverter() String get challenge_level; double get challenge_average; List<double> get challenge_emotions; List<double> get emotions; double get score;
/// Create a copy of PostChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostChallengeHistoryModelCopyWith<PostChallengeHistoryModel> get copyWith => _$PostChallengeHistoryModelCopyWithImpl<PostChallengeHistoryModel>(this as PostChallengeHistoryModel, _$identity);

  /// Serializes this PostChallengeHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostChallengeHistoryModel&&(identical(other.challenge_description, challenge_description) || other.challenge_description == challenge_description)&&(identical(other.challenge_sentence, challenge_sentence) || other.challenge_sentence == challenge_sentence)&&(identical(other.challenge_level, challenge_level) || other.challenge_level == challenge_level)&&(identical(other.challenge_average, challenge_average) || other.challenge_average == challenge_average)&&const DeepCollectionEquality().equals(other.challenge_emotions, challenge_emotions)&&const DeepCollectionEquality().equals(other.emotions, emotions)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challenge_description,challenge_sentence,challenge_level,challenge_average,const DeepCollectionEquality().hash(challenge_emotions),const DeepCollectionEquality().hash(emotions),score);

@override
String toString() {
  return 'PostChallengeHistoryModel(challenge_description: $challenge_description, challenge_sentence: $challenge_sentence, challenge_level: $challenge_level, challenge_average: $challenge_average, challenge_emotions: $challenge_emotions, emotions: $emotions, score: $score)';
}


}

/// @nodoc
abstract mixin class $PostChallengeHistoryModelCopyWith<$Res>  {
  factory $PostChallengeHistoryModelCopyWith(PostChallengeHistoryModel value, $Res Function(PostChallengeHistoryModel) _then) = _$PostChallengeHistoryModelCopyWithImpl;
@useResult
$Res call({
 String challenge_description, String challenge_sentence,@LevelIntToStringConverter() String challenge_level, double challenge_average, List<double> challenge_emotions, List<double> emotions, double score
});




}
/// @nodoc
class _$PostChallengeHistoryModelCopyWithImpl<$Res>
    implements $PostChallengeHistoryModelCopyWith<$Res> {
  _$PostChallengeHistoryModelCopyWithImpl(this._self, this._then);

  final PostChallengeHistoryModel _self;
  final $Res Function(PostChallengeHistoryModel) _then;

/// Create a copy of PostChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? challenge_description = null,Object? challenge_sentence = null,Object? challenge_level = null,Object? challenge_average = null,Object? challenge_emotions = null,Object? emotions = null,Object? score = null,}) {
  return _then(_self.copyWith(
challenge_description: null == challenge_description ? _self.challenge_description : challenge_description // ignore: cast_nullable_to_non_nullable
as String,challenge_sentence: null == challenge_sentence ? _self.challenge_sentence : challenge_sentence // ignore: cast_nullable_to_non_nullable
as String,challenge_level: null == challenge_level ? _self.challenge_level : challenge_level // ignore: cast_nullable_to_non_nullable
as String,challenge_average: null == challenge_average ? _self.challenge_average : challenge_average // ignore: cast_nullable_to_non_nullable
as double,challenge_emotions: null == challenge_emotions ? _self.challenge_emotions : challenge_emotions // ignore: cast_nullable_to_non_nullable
as List<double>,emotions: null == emotions ? _self.emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostChallengeHistoryModel implements PostChallengeHistoryModel {
  const _PostChallengeHistoryModel({required this.challenge_description, required this.challenge_sentence, @LevelIntToStringConverter() required this.challenge_level, required this.challenge_average, required final  List<double> challenge_emotions, required final  List<double> emotions, required this.score}): _challenge_emotions = challenge_emotions,_emotions = emotions;
  factory _PostChallengeHistoryModel.fromJson(Map<String, dynamic> json) => _$PostChallengeHistoryModelFromJson(json);

@override final  String challenge_description;
@override final  String challenge_sentence;
@override@LevelIntToStringConverter() final  String challenge_level;
@override final  double challenge_average;
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

@override final  double score;

/// Create a copy of PostChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostChallengeHistoryModelCopyWith<_PostChallengeHistoryModel> get copyWith => __$PostChallengeHistoryModelCopyWithImpl<_PostChallengeHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostChallengeHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostChallengeHistoryModel&&(identical(other.challenge_description, challenge_description) || other.challenge_description == challenge_description)&&(identical(other.challenge_sentence, challenge_sentence) || other.challenge_sentence == challenge_sentence)&&(identical(other.challenge_level, challenge_level) || other.challenge_level == challenge_level)&&(identical(other.challenge_average, challenge_average) || other.challenge_average == challenge_average)&&const DeepCollectionEquality().equals(other._challenge_emotions, _challenge_emotions)&&const DeepCollectionEquality().equals(other._emotions, _emotions)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,challenge_description,challenge_sentence,challenge_level,challenge_average,const DeepCollectionEquality().hash(_challenge_emotions),const DeepCollectionEquality().hash(_emotions),score);

@override
String toString() {
  return 'PostChallengeHistoryModel(challenge_description: $challenge_description, challenge_sentence: $challenge_sentence, challenge_level: $challenge_level, challenge_average: $challenge_average, challenge_emotions: $challenge_emotions, emotions: $emotions, score: $score)';
}


}

/// @nodoc
abstract mixin class _$PostChallengeHistoryModelCopyWith<$Res> implements $PostChallengeHistoryModelCopyWith<$Res> {
  factory _$PostChallengeHistoryModelCopyWith(_PostChallengeHistoryModel value, $Res Function(_PostChallengeHistoryModel) _then) = __$PostChallengeHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String challenge_description, String challenge_sentence,@LevelIntToStringConverter() String challenge_level, double challenge_average, List<double> challenge_emotions, List<double> emotions, double score
});




}
/// @nodoc
class __$PostChallengeHistoryModelCopyWithImpl<$Res>
    implements _$PostChallengeHistoryModelCopyWith<$Res> {
  __$PostChallengeHistoryModelCopyWithImpl(this._self, this._then);

  final _PostChallengeHistoryModel _self;
  final $Res Function(_PostChallengeHistoryModel) _then;

/// Create a copy of PostChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? challenge_description = null,Object? challenge_sentence = null,Object? challenge_level = null,Object? challenge_average = null,Object? challenge_emotions = null,Object? emotions = null,Object? score = null,}) {
  return _then(_PostChallengeHistoryModel(
challenge_description: null == challenge_description ? _self.challenge_description : challenge_description // ignore: cast_nullable_to_non_nullable
as String,challenge_sentence: null == challenge_sentence ? _self.challenge_sentence : challenge_sentence // ignore: cast_nullable_to_non_nullable
as String,challenge_level: null == challenge_level ? _self.challenge_level : challenge_level // ignore: cast_nullable_to_non_nullable
as String,challenge_average: null == challenge_average ? _self.challenge_average : challenge_average // ignore: cast_nullable_to_non_nullable
as double,challenge_emotions: null == challenge_emotions ? _self._challenge_emotions : challenge_emotions // ignore: cast_nullable_to_non_nullable
as List<double>,emotions: null == emotions ? _self._emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
