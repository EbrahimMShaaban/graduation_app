// class MyTeam {
//   late Team team;
//   MyTeam.fromJson(Map<String, dynamic> json) {
//     // team = json['team'] != null ? new Team.fromJson(json['team']) : null;
//     team = Team.fromJson(json['team']);
//   }
// }
//
// class Team {
//   late String id;
//   late Attributes attributes;
//
//
//   Team.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     // attributes = json['attributes'] != null
//     //     ? new Attributes.fromJson(json['attributes'])
//     //     : null;
//     attributes =Attributes.fromJson(json['attributes']);
//   }
// }
//
// class Attributes {
//  late String title;
//  late String body;
//  late String type;
//
//
//   Attributes.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     body = json['body'];
//     type = json['type'];
//     print(title);
//     print(body);
//     print("999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999");
//     print(type);
//   }
//
// }




class MyTeam {
  Team? team;

  MyTeam({this.team});

  MyTeam.fromJson(Map<String, dynamic> json) {
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    return data;
  }
}

class Team {
  String? id;
  Attributes? attributes;

  Team({this.id, this.attributes});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? title;
  String? body;
  String? type;

  Attributes({this.title, this.body, this.type});

  Attributes.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['type'] = this.type;
    return data;
  }
}