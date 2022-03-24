import 'package:frontend/backend/models/certificate.dart';
import 'package:frontend/services/deep_analyse.dart';

/// This Analyze is hardcoded. For better understanding of the concept,
///  take a look at "LikesChallenges.dart"
class Communicative extends DeepAnalyze {
  @override
  bool analyze(List<Certificate> certificates) {
    return true;
  }

  @override
  DeepAnalyze clone() {
    return Communicative();
  }

  @override
  String explanation() {
    return "According to a couple of organizations, this person is strongly communicative";
  }

  @override
  String title() {
    return "Communicative";
  }
}
