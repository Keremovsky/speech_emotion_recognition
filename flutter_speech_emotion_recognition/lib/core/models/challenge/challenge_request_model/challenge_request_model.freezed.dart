// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeRequestModel implements DiagnosticableTreeMixin {

@Base64Uint8ListConverter() Uint8List get recording;
/// Create a copy of ChallengeRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeRequestModelCopyWith<ChallengeRequestModel> get copyWith => _$ChallengeRequestModelCopyWithImpl<ChallengeRequestModel>(this as ChallengeRequestModel, _$identity);

  /// Serializes this ChallengeRequestModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChallengeRequestModel'))
    ..add(DiagnosticsProperty('recording', recording));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeRequestModel&&const DeepCollectionEquality().equals(other.recording, recording));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recording));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChallengeRequestModel(recording: $recording)';
}


}

/// @nodoc
abstract mixin class $ChallengeRequestModelCopyWith<$Res>  {
  factory $ChallengeRequestModelCopyWith(ChallengeRequestModel value, $Res Function(ChallengeRequestModel) _then) = _$ChallengeRequestModelCopyWithImpl;
@useResult
$Res call({
@Base64Uint8ListConverter() Uint8List recording
});




}
/// @nodoc
class _$ChallengeRequestModelCopyWithImpl<$Res>
    implements $ChallengeRequestModelCopyWith<$Res> {
  _$ChallengeRequestModelCopyWithImpl(this._self, this._then);

  final ChallengeRequestModel _self;
  final $Res Function(ChallengeRequestModel) _then;

/// Create a copy of ChallengeRequestModel
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

class _ChallengeRequestModel with DiagnosticableTreeMixin implements ChallengeRequestModel {
  const _ChallengeRequestModel({@Base64Uint8ListConverter() required this.recording});
  factory _ChallengeRequestModel.fromJson(Map<String, dynamic> json) => _$ChallengeRequestModelFromJson(json);

@override@Base64Uint8ListConverter() final  Uint8List recording;

/// Create a copy of ChallengeRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeRequestModelCopyWith<_ChallengeRequestModel> get copyWith => __$ChallengeRequestModelCopyWithImpl<_ChallengeRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeRequestModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChallengeRequestModel'))
    ..add(DiagnosticsProperty('recording', recording));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeRequestModel&&const DeepCollectionEquality().equals(other.recording, recording));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(recording));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChallengeRequestModel(recording: $recording)';
}


}

/// @nodoc
abstract mixin class _$ChallengeRequestModelCopyWith<$Res> implements $ChallengeRequestModelCopyWith<$Res> {
  factory _$ChallengeRequestModelCopyWith(_ChallengeRequestModel value, $Res Function(_ChallengeRequestModel) _then) = __$ChallengeRequestModelCopyWithImpl;
@override @useResult
$Res call({
@Base64Uint8ListConverter() Uint8List recording
});




}
/// @nodoc
class __$ChallengeRequestModelCopyWithImpl<$Res>
    implements _$ChallengeRequestModelCopyWith<$Res> {
  __$ChallengeRequestModelCopyWithImpl(this._self, this._then);

  final _ChallengeRequestModel _self;
  final $Res Function(_ChallengeRequestModel) _then;

/// Create a copy of ChallengeRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recording = null,}) {
  return _then(_ChallengeRequestModel(
recording: null == recording ? _self.recording : recording // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

// dart format on
