import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/models.dart';
import '../services/splash_screen_service.dart';

abstract class SplashScreenRepository {
  Future<bool> isFirstLaunch();
  createQuestion(QuestionModel question);
  setFirstLaunch();
}

class DefaultSplashScreenRepository implements SplashScreenRepository {
  final _service = Modular.get<SplashScreenService>();

  @override
  Future<bool> isFirstLaunch() async {
    return await _service.isFirstLaunch();
  }

  @override
  createQuestion(QuestionModel question) async {
    print('question ------> $question');
    final encodedQuestion = json.encode(question.toJson());
    print('encodedQuestion -------->  $encodedQuestion');
    await _service.createQuestion(encodedQuestion);
  }

  @override
  setFirstLaunch() async {
    await _service.setFirstLaunch();
  }
}
