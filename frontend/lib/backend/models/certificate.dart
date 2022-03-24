class Certificate {
  Certificate(
      {this.organizationName,
      this.title,
      this.achievments,
      this.topicList,
      this.skillsList,
      this.startDate,
      this.endDate,
      this.type});

  String? organizationName;
  String? position;
  String? title;
  List<String>? topicList, skillsList;
  DateTime? startDate, endDate;
  CertificateType? type;
  List<String>? achievments;
}

enum CertificateType { competition, volunteerActivity, work, university }
