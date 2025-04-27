import 'dart:developer';
import 'dart:io';

import 'package:flutter_speech_emotion_recognition/core/models/base_failure_model/base_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/challenge_result_model/challenge_result_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/pre_challenge_model/pre_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge/recording_challenge_model/recording_challenge_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/post_challenge_history/post_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/challenge_history/pre_challenge_history/pre_challenge_history_model.dart';
import 'package:flutter_speech_emotion_recognition/core/models/type_failure_model/type_failure_model.dart';
import 'package:flutter_speech_emotion_recognition/core/services/network/network_service.dart';
import 'package:flutter_speech_emotion_recognition/core/services/recording_cache/recording_cache_service.dart';
import 'package:fpdart/fpdart.dart';

// TODO: add error messages to json

class ChallengeController {
  late NetworkService _networkService;
  late RecordingCacheService _recordingCacheService;

  factory ChallengeController() => _instance;
  static final ChallengeController _instance = ChallengeController._init();

  ChallengeController._init() {
    _recordingCacheService = RecordingCacheService();
    _networkService = NetworkService();
  }

  // fetch initial info about challenges randomly
  Future<Either<BaseFailureModel, List<PreChallengeModel>>>
  fetchPreChallengesRandom() async {
    final result = await _networkService.get("challenges/pre/random/");

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;
        if (data is List) {
          return Right(
            data
                .map(
                  (item) => PreChallengeModel.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
          );
        } else {
          return Left(
            TypeFailureModel.invalidType("Type of fetched data was wrong."),
          );
        }
      },
    );
  }

  // fetch initial info about popular challenges
  Future<Either<BaseFailureModel, List<PreChallengeModel>>>
  fetchPreChallengesPopular() async {
    final result = await _networkService.get("challenges/pre/popular/");

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;
        if (data is List) {
          return Right(
            data
                .map(
                  (item) => PreChallengeModel.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
          );
        } else {
          return Left(
            TypeFailureModel.invalidType("Type of fetched data was wrong."),
          );
        }
      },
    );
  }

  // fetch challenge recording
  Future<Either<BaseFailureModel, File>> fetchChallengeRecording(int id) async {
    final result = _recordingCacheService.getRecording(id);

    return await result.fold(
      (message) async {
        // if recording is not cached
        log(message);
        final result = await _networkService.get("challenges/$id/recording/");

        return await result.fold(
          (error) {
            log(error.message);
            return Left(error);
          },
          (result) async {
            // successfully fetched
            final data = result.data;
            if (data is Map<String, dynamic>) {
              final file = await _recordingCacheService.addToCache(
                id,
                RecordingChallengeModel.fromJson(data).recording,
              );

              return Right(file);
            } else {
              return Left(
                TypeFailureModel.invalidType("Type of fetched data was wrong."),
              );
            }
          },
        );
      },
      (file) {
        return Right(file);
      },
    );
  }

  // upload recording and return the analysis result
  Future<Either<BaseFailureModel, ChallengeResultModel>> takeOnChallenge(
    int id,
    RecordingChallengeModel data,
  ) async {
    final result = await _networkService.post(
      "try-challenge/$id/",
      data: data.toJson(),
    );

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          return Right(ChallengeResultModel.fromJson(data));
        }
        return Left(TypeFailureModel.invalidType("Type of fetched data was wrong."));
      },
    );
  }

  // fetch last challenge histories
  Future<Either<BaseFailureModel, List<PreChallengeHistoryModel>>>
  fetchPreChallengeHistories() async {
    final result = await _networkService.get("challenge-histories/pre/");

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;
        if (data is List) {
          return Right(
            data
                .map(
                  (item) => PreChallengeHistoryModel.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList(),
          );
        } else {
          return Left(
            TypeFailureModel.invalidType("Type of fetched data was wrong."),
          );
        }
      },
    );
  }

  // fetch rest of the challenge history after pre-fetch
  Future<Either<BaseFailureModel, PostChallengeHistoryModel>>
  fetchPostChallengeHistory(int id) async {
    final result = await _networkService.get("challenge-histories/$id/rest/");

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;
        if (data is Map<String, dynamic>) {
          return Right(PostChallengeHistoryModel.fromJson(data));
        } else {
          return Left(
            TypeFailureModel.invalidType("Type of fetched data was wrong."),
          );
        }
      },
    );
  }

  // remove the challenge history with given id
  Future<Option<BaseFailureModel>> removeChallengeHistory(int id) async {
    final result = await _networkService.delete("challenge-histories/$id/");

    return result.fold(
      (error) {
        return some(error);
      },
      (result) {
        return none();
      },
    );
  }

  // fetch challenge history scores for challenge view
  Future<Either<BaseFailureModel, List<ChallengeResultModel>>>
  fetchChallengeHistoryScores(int id) async {
    final result = await _networkService.get("challenges/$id/get_history_scores/");

    return result.fold(
      (error) {
        return Left(error);
      },
      (result) {
        final data = result.data;
        if (data is List) {
          return Right(
            data
                .map(
                  (item) =>
                      ChallengeResultModel.fromJson(item as Map<String, dynamic>),
                )
                .toList(),
          );
        } else {
          return Left(
            TypeFailureModel.invalidType("Type of fetched data was wrong."),
          );
        }
      },
    );
  }
}
