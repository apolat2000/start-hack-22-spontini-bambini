import 'package:frontend/backend/models/certificate.dart';
import 'package:frontend/services/deep_analyzes/Communicative.dart';
import 'package:frontend/services/deep_analyzes/LanguageSkills.dart';
import 'package:frontend/services/deep_analyzes/LikesChallenges.dart';

List<DeepAnalyze> _analyzeList = [
  LikesChallenges(),
  Communicative(),
  LanguageSkills()
];

List<DeepAnalyze> analyzeCertificates(List<Certificate> certificates) {
  List<DeepAnalyze> result = [];
  for (DeepAnalyze analyze in _analyzeList) {
    DeepAnalyze newAnalyze = analyze.clone();
    if (newAnalyze.analyze(certificates)) result.add(newAnalyze);
  }
  return result;
}

abstract class DeepAnalyze {
  bool analyze(List<Certificate> certificates);

  String title();
  String explanation();

  DeepAnalyze clone();

  void clean() {}
}
