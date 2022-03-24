import 'package:frontend/backend/models/certificate.dart';
import 'package:frontend/services/deep_analyse.dart';

/// This Analyze is hardcoded. For better understanding of the concept,
///  take a look at "LikesChallenges.dart"
class LanguageSkills extends DeepAnalyze {
  @override
  bool analyze(List<Certificate> certificates) {
    return true;
  }

  @override
  DeepAnalyze clone() {
    return LanguageSkills();
  }

  @override
  String explanation() {
    return "This person has done 3 language courses and belongs to the top 15% students in these courses";
  }

  @override
  String title() {
    return "Language skills";
  }
}
