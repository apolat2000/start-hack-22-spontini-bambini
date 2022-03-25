import 'package:frontend/backend/models/certificate.dart';

class CertificateRepository {
  List<Certificate> getAllCertificates() {
    List<Certificate> result = [];
    result.add(Certificate(
        startDate: DateTime(2022, 03, 23),
        endDate: DateTime(2022, 03, 26),
        type: CertificateType.university,
        title: "Bachelor of Computer Science (enrolled)",
        organizationName: "St. Gallen University",
        topicList: [
          "economics",
          "algorhythms",
        ],
        skillsList: [
          "statistics",
        ],
        achievments: [
          "Finished statistics courses with the best grade",
        ]));
    result.add(Certificate(
        startDate: DateTime(2022, 03, 23),
        endDate: DateTime(2022, 03, 26),
        type: CertificateType.competition,
        title: "START Hack",
        organizationName: "START Summit",
        topicList: [
          "coding",
          "education",
          "entrepreneurship",
          "hackathon",
          "OpenID Connect"
        ],
        skillsList: [
          "team work",
          "business plan"
        ],
        achievments: [
          "Has proven, that your grades do not say much about your skills",
          "Had fun",
          "Met cool people"
        ]));
    result.add(Certificate(
        startDate: DateTime(2022, 01, 26),
        type: CertificateType.volunteerActivity,
        title: "Volunteer activities as Software Developer",
        organizationName: "Aktion Sodis",
        topicList: ["education", "entrepreneurship", "OpenID Connect"],
        skillsList: ["flutter", "aws", "git", "ux/ui"]));
    result.add(Certificate(
        startDate: DateTime(2021, 06, 26),
        endDate: DateTime(2022, 08, 06),
        type: CertificateType.work,
        title: "Internship as Software Developer",
        organizationName: "DbFH",
        topicList: [
          "VR",
          "AR",
        ],
        skillsList: [
          "unity3d",
          "oauth 2.0",
          "web ar"
        ],
        achievments: [
          "Found a simple and solution for a AR experience in browser",
          "Integrated an OpenID to the existing server"
        ]));
    result.add(Certificate(
      startDate: DateTime(2020, 09, 26),
      endDate: DateTime(2020, 09, 27),
      type: CertificateType.competition,
      title: "ABCD Hackathon",
      organizationName: "ABCD Univercity",
      topicList: ["coding", "digitalization", "hackathon"],
      skillsList: ["coding", "pitching"],
    ));
    return result;
  }

  List<String> getAllSkills() {
    List<String> skills = [];

    var certificates = getAllCertificates();

    for (Certificate certificate in certificates)
      for (String skill in certificate.skillsList!) skills.add(skill);

    return skills;
  }

  List<Certificate> getAllWorkExperience() {
    List<Certificate> result = [];

    var certificates = getAllCertificates();

    return certificates
        .where((element) =>
            element.type == CertificateType.work ||
            element.type == CertificateType.volunteerActivity)
        .toList();
  }

  List<Certificate> getAllEducation() {
    List<Certificate> result = [];

    var certificates = getAllCertificates();

    return certificates
        .where((element) => element.type == CertificateType.university)
        .toList();
  }
}
