// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeHistoryModel implements DiagnosticableTreeMixin {

 int get id; int get user; int get challenge; double get score; List<double> get emotions;@Base64Uint8ListConverter() Uint8List get user_recording;
/// Create a copy of ChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeHistoryModelCopyWith<ChallengeHistoryModel> get copyWith => _$ChallengeHistoryModelCopyWithImpl<ChallengeHistoryModel>(this as ChallengeHistoryModel, _$identity);

  /// Serializes this ChallengeHistoryModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChallengeHistoryModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('challenge', challenge))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('emotions', emotions))..add(DiagnosticsProperty('user_recording', user_recording));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.challenge, challenge) || other.challenge == challenge)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.emotions, emotions)&&const DeepCollectionEquality().equals(other.user_recording, user_recording));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,challenge,score,const DeepCollectionEquality().hash(emotions),const DeepCollectionEquality().hash(user_recording));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChallengeHistoryModel(id: $id, user: $user, challenge: $challenge, score: $score, emotions: $emotions, user_recording: $user_recording)';
}


}

/// @nodoc
abstract mixin class $ChallengeHistoryModelCopyWith<$Res>  {
  factory $ChallengeHistoryModelCopyWith(ChallengeHistoryModel value, $Res Function(ChallengeHistoryModel) _then) = _$ChallengeHistoryModelCopyWithImpl;
@useResult
$Res call({
 int id, int user, int challenge, double score, List<double> emotions,@Base64Uint8ListConverter() Uint8List user_recording
});




}
/// @nodoc
class _$ChallengeHistoryModelCopyWithImpl<$Res>
    implements $ChallengeHistoryModelCopyWith<$Res> {
  _$ChallengeHistoryModelCopyWithImpl(this._self, this._then);

  final ChallengeHistoryModel _self;
  final $Res Function(ChallengeHistoryModel) _then;

/// Create a copy of ChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? challenge = null,Object? score = null,Object? emotions = null,Object? user_recording = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,emotions: null == emotions ? _self.emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,user_recording: null == user_recording ? _self.user_recording : user_recording // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChallengeHistoryModel with DiagnosticableTreeMixin implements ChallengeHistoryModel {
  const _ChallengeHistoryModel({required this.id, required this.user, required this.challenge, required this.score, required final  List<double> emotions, @Base64Uint8ListConverter() required this.user_recording}): _emotions = emotions;
  factory _ChallengeHistoryModel.fromJson(Map<String, dynamic> json) => _$ChallengeHistoryModelFromJson(json);

@override final  int id;
@override final  int user;
@override final  int challenge;
@override final  double score;
 final  List<double> _emotions;
@override List<double> get emotions {
  if (_emotions is EqualUnmodifiableListView) return _emotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emotions);
}

@override@Base64Uint8ListConverter() final  Uint8List user_recording;

/// Create a copy of ChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeHistoryModelCopyWith<_ChallengeHistoryModel> get copyWith => __$ChallengeHistoryModelCopyWithImpl<_ChallengeHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeHistoryModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChallengeHistoryModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('challenge', challenge))..add(DiagnosticsProperty('score', score))..add(DiagnosticsProperty('emotions', emotions))..add(DiagnosticsProperty('user_recording', user_recording));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.challenge, challenge) || other.challenge == challenge)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._emotions, _emotions)&&const DeepCollectionEquality().equals(other.user_recording, user_recording));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,challenge,score,const DeepCollectionEquality().hash(_emotions),const DeepCollectionEquality().hash(user_recording));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChallengeHistoryModel(id: $id, user: $user, challenge: $challenge, score: $score, emotions: $emotions, user_recording: $user_recording)';
}


}

/// @nodoc
abstract mixin class _$ChallengeHistoryModelCopyWith<$Res> implements $ChallengeHistoryModelCopyWith<$Res> {
  factory _$ChallengeHistoryModelCopyWith(_ChallengeHistoryModel value, $Res Function(_ChallengeHistoryModel) _then) = __$ChallengeHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int user, int challenge, double score, List<double> emotions,@Base64Uint8ListConverter() Uint8List user_recording
});




}
/// @nodoc
class __$ChallengeHistoryModelCopyWithImpl<$Res>
    implements _$ChallengeHistoryModelCopyWith<$Res> {
  __$ChallengeHistoryModelCopyWithImpl(this._self, this._then);

  final _ChallengeHistoryModel _self;
  final $Res Function(_ChallengeHistoryModel) _then;

/// Create a copy of ChallengeHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? challenge = null,Object? score = null,Object? emotions = null,Object? user_recording = null,}) {
  return _then(_ChallengeHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,emotions: null == emotions ? _self._emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,user_recording: null == user_recording ? _self.user_recording : user_recording // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

// dart format on
