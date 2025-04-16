import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/colors_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/color_extension.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/services/theme/theme_service.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';

class ResultChart extends StatefulWidget {
  const ResultChart({super.key});

  @override
  State<ResultChart> createState() => _ResultChartState();
}

class _ResultChartState extends State<ResultChart> {
  Widget _bottomTitles(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Happ';
        break;
      case 1:
        text = 'Angr';
        break;
      case 2:
        text = 'Sad';
        break;
      case 3:
        text = 'Neut';
        break;
      case 4:
        text = 'Fear';
        break;
      case 5:
        text = 'Disg';
        break;
      case 6:
        text = 'Surp';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      meta: meta,
      child: Text(text, style: context.displaySmall?.copyWith(fontSize: 12)),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "${LocaleKeys.yourScoreIs.tr()} 87.25 ${LocaleKeys.andAverageIs.tr()} 71.09.",
            style: context.displayLarge,
          ),
        ),
        SizedBox(height: 12.h),
        LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 180;
            final barsWidth = 8.0 * constraints.maxWidth / 90;

            return SizedBox(
              height: 200.h,
              child: BarChart(
                BarChartData(
                  maxY: 101,
                  alignment: BarChartAlignment.center,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        getTitlesWidget: _bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
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
                  barGroups: _getBarGroups(barsWidth, barsSpace),
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

  List<BarChartGroupData> _getBarGroups(double barsWidth, double barsSpace) {
    // ! stack item with lower value must be at the bottom
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceHappyColor.darken(25),
              ),
              BarChartRodStackItem(0, 1.5, ColorConstants.userPerformanceHappyColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceAngryColor.darken(25),
              ),
              BarChartRodStackItem(0, 1.5, ColorConstants.userPerformanceAngryColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceSadColor.darken(25),
              ),
              BarChartRodStackItem(0, 55, ColorConstants.userPerformanceSadColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceNeutralColor.darken(25),
              ),
              BarChartRodStackItem(
                0,
                1.5,
                ColorConstants.userPerformanceNeutralColor,
              ),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceFearColor.darken(25),
              ),
              BarChartRodStackItem(0, 37, ColorConstants.userPerformanceFearColor),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceDisgustColor.darken(25),
              ),
              BarChartRodStackItem(
                0,
                15,
                ColorConstants.userPerformanceDisgustColor,
              ),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: 80,
            rodStackItems: [
              BarChartRodStackItem(
                0,
                80,
                ColorConstants.userPerformanceSurpriseColor.darken(25),
              ),
              BarChartRodStackItem(
                0,
                69,
                ColorConstants.userPerformanceSurpriseColor,
              ),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
  }
}
