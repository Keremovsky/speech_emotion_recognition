import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speech_emotion_recognition/core/components/custom_loading_indicator.dart';
import 'package:flutter_speech_emotion_recognition/core/components/failure_display.dart';
import 'package:flutter_speech_emotion_recognition/core/constants/size_constants.dart';
import 'package:flutter_speech_emotion_recognition/core/enums/challenge_card_type.dart';
import 'package:flutter_speech_emotion_recognition/core/extensions/context_extensions.dart';
import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/pre_challenge_model/pre_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/controller/challenge_controller.dart';
import 'package:flutter_speech_emotion_recognition/features/challenge/widgets/challenge_card.dart';
import 'package:flutter_speech_emotion_recognition/gen/locale_keys.g.dart';
import 'package:fpdart/fpdart.dart' as fp;

class ChallengeCardList extends StatefulWidget {
  final String? title;
  final bool activateRefreshButton;
  final ChallengeCardType type;

  const ChallengeCardList({
    super.key,
    this.title,
    this.activateRefreshButton = false,
    required this.type,
  });

  @override
  ChallengeCardListState createState() => ChallengeCardListState();
}

class ChallengeCardListState extends State<ChallengeCardList> {
  late Future<fp.Either<String, List<PreChallengeModel>>> value;

  @override
  void initState() {
    super.initState();
    value = _getData();
  }

  Future<fp.Either<String, List<PreChallengeModel>>> _getData() async {
    late fp.Either<BaseFailureModel, List<PreChallengeModel>> result;

    switch (widget.type) {
      case ChallengeCardType.random:
        result =
            await context.read<ChallengeController>().fetchPreChallengesRandom();
        break;
      case ChallengeCardType.popular:
        result =
            await context.read<ChallengeController>().fetchPreChallengesPopular();
        break;
    }

    return result.fold(
      (error) {
        return fp.Left(error.message);
      },
      (data) async {
        return fp.Right(data);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
          child: Row(
            children: [
              widget.title == null
                  ? const SizedBox()
                  : Text(widget.title ?? "", style: context.titleMedium),
              Spacer(),
              !widget.activateRefreshButton
                  ? const SizedBox()
                  : IconButton(
                    onPressed: () {
                      setState(() {
                        value = _getData();
                      });
                    },
                    icon: Icon(Icons.refresh, size: 28.r),
                    splashColor: Colors.transparent,
                  ),
            ],
          ),
        ),
        FutureBuilder(
          future: value,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                final error = snapshot.error!;

                return FailureDisplay(
                  error: error.toString(),
                  refresh: () {
                    setState(() {
                      value = _getData();
                    });
                  },
                );
              } else {
                final result = snapshot.data;

                if (result != null) {
                  return result.fold(
                    (error) {
                      return FailureDisplay(
                        error: error,
                        refresh: () {
                          setState(() {
                            value = _getData();
                          });
                        },
                      );
                    },
                    (data) {
                      return _Success(data: data);
                    },
                  );
                }
                return FailureDisplay(
                  error: LocaleKeys.unknownError.tr(),
                  refresh: () {
                    setState(() {
                      value = _getData();
                    });
                  },
                );
              }
            }
            return CustomLoadingIndicator(
              padding: EdgeInsets.symmetric(vertical: 30.h),
            );
          },
        ),
      ],
    );
  }
}

class _Success extends StatelessWidget {
  final List<PreChallengeModel> data;

  const _Success({required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return Center(
        child: SizedBox(
          height: 125.h,
          child: Center(
            child: Text("Fetched data is empty.", style: context.displayLarge),
          ),
        ),
      );
    }

    return SizedBox(
      height: 125.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: SizeConstants.screenPadding),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ChallengeCard(
            onPressed: (controller) {},
            width: 230.w,
            data: data[index],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 15.w),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
