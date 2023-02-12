class CreateTeamModel {
  late Team team;
  CreateTeamModel.fromJson(Map<String, dynamic> json) {
    // team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    team = Team.fromJson(json['team']);
  }
}

class Team {
  late String id ="1";
  late Attributes attributes;


  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // attributes = json['attributes'] != null
    //     ? new Attributes.fromJson(json['attributes'])
    //     : null;
    attributes =Attributes.fromJson(json['attributes']);
  }
}

class Attributes {
  late String title;
  late String body;
  late String type;

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    type = json['type'];
    // print(title);
    // print(body);
    // print(
    //     "999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999");
    // print(type);
  }
}