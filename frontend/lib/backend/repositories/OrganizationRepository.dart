import 'package:frontend/backend/models/organization.dart';

class OrganizationRepository {
  List<Organization> getAllOrganisations() {
    List<Organization> result = [];

    result.add(Organization(
        name: "Aktion Sodis",
        values: ["impact"],
        learningResource: ["PR", "fundraising", "spanish"]));

    result.add(Organization(
        name: "ABILAY",
        values: ["self-development", "freedom"],
        learningResource: ["coding", "git", "english"]));

    result.add(Organization(
        name: "Industry Khan",
        values: ["fun", "quality"],
        learningResource: ["banking", "startup"]));

    return result;
  }
}
