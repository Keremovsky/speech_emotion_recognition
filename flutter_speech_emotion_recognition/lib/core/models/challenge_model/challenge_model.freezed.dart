// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeModel implements DiagnosticableTreeMixin {

 int get id; String get title; String get description; String get sentence; String get level; double get average; List<double> get emotions;@Base64Uint8ListConverter() Uint8List get audioData;
/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeModelCopyWith<ChallengeModel> get copyWith => _$ChallengeModelCopyWithImpl<ChallengeModel>(this as ChallengeModel, _$identity);

  /// Serializes this ChallengeModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChallengeModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('sentence', sentence))..add(DiagnosticsProperty('level', level))..add(DiagnosticsProperty('average', average))..add(DiagnosticsProperty('emotions', emotions))..add(DiagnosticsProperty('audioData', audioData));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sentence, sentence) || other.sentence == sentence)&&(identical(other.level, level) || other.level == level)&&(identical(other.average, average) || other.average == average)&&const DeepCollectionEquality().equals(other.emotions, emotions)&&const DeepCollectionEquality().equals(other.audioData, audioData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,sentence,level,average,const DeepCollectionEquality().hash(emotions),const DeepCollectionEquality().hash(audioData));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChallengeModel(id: $id, title: $title, description: $description, sentence: $sentence, level: $level, average: $average, emotions: $emotions, audioData: $audioData)';
}


}

/// @nodoc
abstract mixin class $ChallengeModelCopyWith<$Res>  {
  factory $ChallengeModelCopyWith(ChallengeModel value, $Res Function(ChallengeModel) _then) = _$ChallengeModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String sentence, String level, double average, List<double> emotions,@Base64Uint8ListConverter() Uint8List audioData
});




}
/// @nodoc
class _$ChallengeModelCopyWithImpl<$Res>
    implements $ChallengeModelCopyWith<$Res> {
  _$ChallengeModelCopyWithImpl(this._self, this._then);

  final ChallengeModel _self;
  final $Res Function(ChallengeModel) _then;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? sentence = null,Object? level = null,Object? average = null,Object? emotions = null,Object? audioData = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sentence: null == sentence ? _self.sentence : sentence // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,emotions: null == emotions ? _self.emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,audioData: null == audioData ? _self.audioData : audioData // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChallengeModel with DiagnosticableTreeMixin implements ChallengeModel {
  const _ChallengeModel({required this.id, required this.title, required this.description, required this.sentence, required this.level, required this.average, required final  List<double> emotions, @Base64Uint8ListConverter() required this.audioData}): _emotions = emotions;
  factory _ChallengeModel.fromJson(Map<String, dynamic> json) => _$ChallengeModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String sentence;
@override final  String level;
@override final  double average;
 final  List<double> _emotions;
@override List<double> get emotions {
  if (_emotions is EqualUnmodifiableListView) return _emotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emotions);
}

@override@Base64Uint8ListConverter() final  Uint8List audioData;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeModelCopyWith<_ChallengeModel> get copyWith => __$ChallengeModelCopyWithImpl<_ChallengeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ChallengeModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('sentence', sentence))..add(DiagnosticsProperty('level', level))..add(DiagnosticsProperty('average', average))..add(DiagnosticsProperty('emotions', emotions))..add(DiagnosticsProperty('audioData', audioData));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.sentence, sentence) || other.sentence == sentence)&&(identical(other.level, level) || other.level == level)&&(identical(other.average, average) || other.average == average)&&const DeepCollectionEquality().equals(other._emotions, _emotions)&&const DeepCollectionEquality().equals(other.audioData, audioData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,sentence,level,average,const DeepCollectionEquality().hash(_emotions),const DeepCollectionEquality().hash(audioData));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChallengeModel(id: $id, title: $title, description: $description, sentence: $sentence, level: $level, average: $average, emotions: $emotions, audioData: $audioData)';
}


}

/// @nodoc
abstract mixin class _$ChallengeModelCopyWith<$Res> implements $ChallengeModelCopyWith<$Res> {
  factory _$ChallengeModelCopyWith(_ChallengeModel value, $Res Function(_ChallengeModel) _then) = __$ChallengeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String sentence, String level, double average, List<double> emotions,@Base64Uint8ListConverter() Uint8List audioData
});




}
/// @nodoc
class __$ChallengeModelCopyWithImpl<$Res>
    implements _$ChallengeModelCopyWith<$Res> {
  __$ChallengeModelCopyWithImpl(this._self, this._then);

  final _ChallengeModel _self;
  final $Res Function(_ChallengeModel) _then;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? sentence = null,Object? level = null,Object? average = null,Object? emotions = null,Object? audioData = null,}) {
  return _then(_ChallengeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,sentence: null == sentence ? _self.sentence : sentence // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,emotions: null == emotions ? _self._emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<double>,audioData: null == audioData ? _self.audioData : audioData // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

// dart format on
