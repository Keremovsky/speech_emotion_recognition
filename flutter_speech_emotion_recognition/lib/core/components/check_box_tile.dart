import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/duration_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';

enum _Type { long, short }

abstract final class CheckBoxTile extends StatelessWidget {
  final bool value;
  final double? size;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final BoxDecoration? activeDecoration;
  final String label;
  final TextStyle? labelStyle;
  final bool labelOnLeft;
  final Color? backgroundColor;
  final BoxBorder? borderDecoration;
  final Duration animationDuration;
  final void Function(bool value) onChanged;
  final _Type type;

  const CheckBoxTile({
    super.key,
    required this.type,
    required this.value,
    this.size,
    this.height,
    this.width,
    this.decoration,
    this.activeDecoration,
    required this.label,
    this.labelStyle,
    this.labelOnLeft = true,
    this.backgroundColor,
    this.borderDecoration,
    this.animationDuration = DurationConstant.checkBoxTileAnimationDuration,
    required this.onChanged,
  });

  /// when label's length is long
  const factory CheckBoxTile.long({
    required bool value,
    double? size,
    double? height,
    double? width,
    BoxDecoration? decoration,
    BoxDecoration? activeDecoration,
    required String label,
    TextStyle? labelStyle,
    bool labelOnLeft,
    Color? backgroundColor,
    BoxBorder? borderDecoration,
    Duration animationDuration,
    required void Function(bool value) onChanged,
  }) = _Long;

  /// when label's length is short
  const factory CheckBoxTile.short({
    required bool value,
    double? size,
    double? height,
    double? width,
    BoxDecoration? decoration,
    BoxDecoration? activeDecoration,
    required String label,
    TextStyle? labelStyle,
    bool labelOnLeft,
    Color? backgroundColor,
    BoxBorder? borderDecoration,
    Duration animationDuration,
    required void Function(bool value) onChanged,
  }) = _Short;
}

final class _Long extends CheckBoxTile {
  const _Long({
    required super.value,
    super.size,
    super.height,
    super.width,
    super.decoration,
    super.activeDecoration,
    required super.label,
    super.labelStyle,
    super.labelOnLeft,
    super.backgroundColor,
    super.borderDecoration,
    super.animationDuration,
    required super.onChanged,
  }) : super(type: _Type.long);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          color: backgroundColor ?? Colors.transparent,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: borderDecoration,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                if (labelOnLeft == true)
                  Flexible(
                    child: _LabelText(
                      label: label,
                      labelStyle: labelStyle ?? context.displayLarge,
                      labelOnLeft: labelOnLeft,
                      size: size,
                    ),
                  ),
                if (labelOnLeft == true) _GapLong(label: label, size: size),
                _CheckBox(
                  size: size,
                  animationDuration: animationDuration,
                  value: value,
                  activeDecoration: activeDecoration,
                  decoration: decoration,
                ),
                if (labelOnLeft == false) _GapLong(label: label, size: size),
                if (labelOnLeft == false)
                  Flexible(
                    child: _LabelText(
                      label: label,
                      labelStyle: labelStyle ?? context.displayLarge,
                      labelOnLeft: labelOnLeft,
                      size: size,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _Short extends CheckBoxTile {
  const _Short({
    required super.value,
    super.size,
    super.height,
    super.width,
    super.decoration,
    super.activeDecoration,
    required super.label,
    super.labelStyle,
    super.labelOnLeft,
    super.backgroundColor,
    super.borderDecoration,
    super.animationDuration,
    required super.onChanged,
  }) : super(type: _Type.short);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(15.r),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: borderDecoration,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                if (labelOnLeft == true)
                  _LabelText(
                    label: label,
                    labelStyle: labelStyle ?? context.displayLarge,
                    labelOnLeft: labelOnLeft,
                    size: size,
                  ),
                if (labelOnLeft == true) _GapShort(label: label, size: size),
                _CheckBox(
                  size: size,
                  animationDuration: animationDuration,
                  value: value,
                  activeDecoration: activeDecoration,
                  decoration: decoration,
                ),
                if (labelOnLeft == false) _GapShort(label: label, size: size),
                if (labelOnLeft == false)
                  _LabelText(
                    label: label,
                    labelStyle: labelStyle ?? context.displayLarge,
                    labelOnLeft: labelOnLeft,
                    size: size,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GapLong extends StatelessWidget {
  const _GapLong({required this.label, required this.size});

  final String label;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: label != "" ? (size != null ? size! / 2.5 : 8.w) : 0);
  }
}

class _GapShort extends StatelessWidget {
  const _GapShort({required this.label, required this.size});

  final String label;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return const Spacer();
  }
}

class _LabelText extends StatelessWidget {
  const _LabelText({
    required this.label,
    required this.labelStyle,
    required this.labelOnLeft,
    this.size,
  });

  final String label;
  final TextStyle? labelStyle;
  final bool labelOnLeft;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: labelStyle ?? context.displaySmall);
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox({
    required this.size,
    required this.animationDuration,
    required this.value,
    required this.activeDecoration,
    required this.decoration,
  });

  final double? size;
  final Duration animationDuration;
  final bool value;
  final BoxDecoration? activeDecoration;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: size ?? 18.r,
      width: size ?? 18.r,
      duration: animationDuration,
      decoration:
          value
              ? activeDecoration ??
                  BoxDecoration(
                    color:
                        context.read<ThemeService>().isLightTheme()
                            ? ColorConstants.lightScaffoldBackground
                            : ColorConstants.darkScaffoldBackground,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: size != null ? size! / 3 : 6.r,
                      color:
                          context.read<ThemeService>().isLightTheme()
                              ? ColorConstants.lightMain
                              : ColorConstants.darkMain,
                    ),
                  )
              : decoration ??
                  BoxDecoration(
                    color:
                        context.read<ThemeService>().isLightTheme()
                            ? ColorConstants.lightScaffoldBackground
                            : ColorConstants.darkScaffoldBackground,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: size != null ? size! / (size! / 2) : 1.5.r,
                      color:
                          context.read<ThemeService>().isLightTheme()
                              ? ColorConstants.lightMain
                              : ColorConstants.darkMain,
                    ),
                  ),
    );
  }
}
