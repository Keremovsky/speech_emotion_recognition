import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/font_size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/color_extension.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/core/utils/custom_math.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

class ResultChart extends StatefulWidget {
  final ChallengeResultModel model;

  const ResultChart({super.key, required this.model});

  @override
  State<ResultChart> createState() => _ResultChartState();
}

class _ResultChartState extends State<ResultChart> {
  Widget _bottomTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = LocaleKeys.emotionShort_happy.tr();
        break;
      case 1:
        text = LocaleKeys.emotionShort_angry.tr();
        break;
      case 2:
        text = LocaleKeys.emotionShort_sad.tr();
        break;
      case 3:
        text = LocaleKeys.emotionShort_neutral.tr();
        break;
      case 4:
        text = LocaleKeys.emotionShort_fear.tr();
        break;
      case 5:
        text = LocaleKeys.emotionShort_disgust.tr();
        break;
      case 6:
        text = LocaleKeys.emotionShort_surprise.tr();
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: context.displaySmall?.copyWith(fontSize: 12.r)),
    );
  }

  Widget _leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }

    return SideTitleWidget(
      meta: meta,
      child: Text(
        meta.formattedValue,
        style: context.displaySmall?.copyWith(fontSize: 12),
      ),
    );
  }

  BarTouchData _getBarTouchData() {
    return BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (group) => Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 2.h,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            TextStyle(
              color: ColorConstants.emotionColors[groupIndex],
              fontWeight: FontWeight.bold,
              fontSize: FontSizeConstants.fontSize16,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "${LocaleKeys.yourScoreIs.tr()} ${widget.model.score} ${LocaleKeys.andAverageIs.tr()} ${widget.model.average_score}",
            style: context.displayLarge,
          ),
        ),
        SizedBox(height: 22.h),
        LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 180;
            final barsWidth = 8.0 * constraints.maxWidth / 90;

            return SizedBox(
              height: 275.h,
              child: BarChart(
                BarChartData(
                  maxY: 101,
                  minY: -10,
                  alignment: BarChartAlignment.center,
                  barTouchData: _getBarTouchData(),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32.r,
                        getTitlesWidget: _bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32.r,
                        getTitlesWidget: _leftTitles,
                      ),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 10 == 0,
                    getDrawingHorizontalLine:
                        (value) => FlLine(
                          color:
                              context.read<ThemeService>().isLightTheme()
                                  ? ColorConstants.lightTextCursor
                                  : ColorConstants.darkTextCursor,
                          strokeWidth: 0.8,
                          dashArray: [6],
                        ),
                    drawVerticalLine: false,
                  ),
                  borderData: FlBorderData(show: false),
                  groupsSpace: barsSpace,
                  barGroups: _getBarGroups(
                    barsWidth,
                    barsSpace,
                    widget.model.challenge_emotions,
                    widget.model.emotions,
                  ),
                ),
              ),
            );
          },
        ),
        Center(
          child: Text(
            LocaleKeys.lightColorIsYourResult.tr(),
            style: context.displaySmall?.copyWith(fontSize: 12.r),
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _getBarGroups(
    double barsWidth,
    double barsSpace,
    List<double> challengeEmotions,
    List<double> emotions,
  ) {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < challengeEmotions.length; i++) {
      final emotionValues = CustomMath().bigLittle(
        challengeEmotions[i],
        emotions[i],
      );

      final BorderRadius borderRadius = BorderRadius.only(
        topLeft: Radius.circular(6.r),
        topRight: Radius.circular(6.r),
      );

      barGroups.add(
        BarChartGroupData(
          x: i,
          barsSpace: barsSpace,
          barRods: [
            BarChartRodData(
              toY: emotionValues[0],
              fromY: -10,
              rodStackItems: [
                BarChartRodStackItem(
                  emotionValues[1],
                  emotionValues[0],
                  emotionValues[0] == challengeEmotions[i]
                      ? ColorConstants.emotionColors[i].darken(25)
                      : ColorConstants.emotionColors[i],
                ),
                BarChartRodStackItem(
                  -10,
                  emotionValues[1],
                  emotionValues[0] == challengeEmotions[i]
                      ? ColorConstants.emotionColors[i].darken(25)
                      : ColorConstants.emotionColors[i],
                ),
              ],
              borderRadius: borderRadius,
              width: barsWidth,
            ),
          ],
        ),
      );
    }

    return barGroups;
  }
}
