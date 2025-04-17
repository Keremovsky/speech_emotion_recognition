// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecordingChallengeModel implements DiagnosticableTreeMixin {

@Base64Uint8ListConverter() Uint8List get recording;
/// Create a copy of RecordingChallengeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecordingChallengeModelCopyWith<RecordingChallengeModel> get copyWith => _$RecordingChallengeModelCopyWithImpl<RecordingChallengeModel>(this as RecordingChallengeModel, _$identity);

  /// Serializes this RecordingChallengeModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecordingChallengeModel'))
    ..add(DiagnosticsProperty('recording', recording));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecordingChallengeModel&&const DeepCollectionEquality().equals(other.recording, recording));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recording));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecordingChallengeModel(recording: $recording)';
}


}

/// @nodoc
abstract mixin class $RecordingChallengeModelCopyWith<$Res>  {
  factory $RecordingChallengeModelCopyWith(RecordingChallengeModel value, $Res Function(RecordingChallengeModel) _then) = _$RecordingChallengeModelCopyWithImpl;
@useResult
$Res call({
@Base64Uint8ListConverter() Uint8List recording
});




}
/// @nodoc
class _$RecordingChallengeModelCopyWithImpl<$Res>
    implements $RecordingChallengeModelCopyWith<$Res> {
  _$RecordingChallengeModelCopyWithImpl(this._self, this._then);

  final RecordingChallengeModel _self;
  final $Res Function(RecordingChallengeModel) _then;

/// Create a copy of RecordingChallengeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recording = null,}) {
  return _then(_self.copyWith(
recording: null == recording ? _self.recording : recording // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RecordingChallengeModel with DiagnosticableTreeMixin implements RecordingChallengeModel {
  const _RecordingChallengeModel({@Base64Uint8ListConverter() required this.recording});
  factory _RecordingChallengeModel.fromJson(Map<String, dynamic> json) => _$RecordingChallengeModelFromJson(json);

@override@Base64Uint8ListConverter() final  Uint8List recording;

/// Create a copy of RecordingChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecordingChallengeModelCopyWith<_RecordingChallengeModel> get copyWith => __$RecordingChallengeModelCopyWithImpl<_RecordingChallengeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecordingChallengeModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecordingChallengeModel'))
    ..add(DiagnosticsProperty('recording', recording));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecordingChallengeModel&&const DeepCollectionEquality().equals(other.recording, recording));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recording));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecordingChallengeModel(recording: $recording)';
}


}

/// @nodoc
abstract mixin class _$RecordingChallengeModelCopyWith<$Res> implements $RecordingChallengeModelCopyWith<$Res> {
  factory _$RecordingChallengeModelCopyWith(_RecordingChallengeModel value, $Res Function(_RecordingChallengeModel) _then) = __$RecordingChallengeModelCopyWithImpl;
@override @useResult
$Res call({
@Base64Uint8ListConverter() Uint8List recording
});




}
/// @nodoc
class __$RecordingChallengeModelCopyWithImpl<$Res>
    implements _$RecordingChallengeModelCopyWith<$Res> {
  __$RecordingChallengeModelCopyWithImpl(this._self, this._then);

  final _RecordingChallengeModel _self;
  final $Res Function(_RecordingChallengeModel) _then;

/// Create a copy of RecordingChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recording = null,}) {
  return _then(_RecordingChallengeModel(
recording: null == recording ? _self.recording : recording // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

// dart format on
