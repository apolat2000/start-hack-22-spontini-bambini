import 'package:frontend/backend/models/certificate.dart';
import 'package:frontend/services/deep_analyse.dart';

class LikesChallenges extends DeepAnalyze {
  int competitionsNumber = 0;

  @override
  bool analyze(List<Certificate> certificates) {
    for (Certificate certificate in certificates) {
      for (String tag in certificate.topicList!) {
        if (tag.toLowerCase() == "hackathon") {
          competitionsNumber++;
        }
      }
    }

    return competitionsNumber > 1;
  }

  @override
  String explanation() {
    return "The person has participaed to " +
        competitionsNumber.toString() +
        " hackathons. The person can face difficult challenges and may be competative.";
  }

  @override
  String title() {
    return "Likes challenges";
  }

  DeepAnalyze clone() {
    return LikesChallenges();
  }
}
