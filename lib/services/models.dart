//// Embedded Maps

class Match {
  String uid;
  String missionId;
  String deploymentId;
  List<Round> rounds;
  bool finished;
  List<String> players;

  Match({ this.missionId, this.deploymentId, this.rounds, this.finished, this.players });
  Match.fromMap(Map data) {
    missionId = data['missionId'];
    deploymentId = data['deploymentId'];
    rounds = (data['rounds'] as List ?? []).map((v) => Round.fromMap(v)).toList();
    finished = data['finished'];
    players = data['players'] ;
}
}


class Round {
  num roundNumber;
  num cpSpent;
  num vpWon;
  Round.fromMap(Map data) {
    roundNumber = data['roundNumber'];
    cpSpent =  data['cpSpent'] ?? 0;
    vpWon =  data['vpWon'] ?? 0;
}
}

///// Database Collections

class Mission { 
  String uid;
  String name;
  String description;
  String imageUrl;
  String secondary;
  String scoring;

  Mission({ this.name, this.description, this.uid, this.imageUrl, this.secondary, this.scoring});

  factory Mission.fromMap(Map data) {
    return Mission(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      secondary: data['secondary'] ?? '',
      scoring: data['scoring'] ?? '',
      description: data['description'] ?? ''
    );
  }
  
}

class Deployment { 
  String uid;
  String name;
  String description;

  Deployment({ this.name, this.description, this.uid });

  factory Deployment.fromMap(Map data) {
    return Deployment(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? ''
    );
  }
  
}