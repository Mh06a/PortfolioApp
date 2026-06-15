class Skill {
  //step1 ----> here I will Create the class's variables :
  final int id;
  final String skillName;
  final String level;
  final String icon;

  //step2 ----> here I will Create The constructor :
  Skill({
    required this.id,
    required this.skillName,
    required this.level,
    required this.icon,
  });

  //step3 ----> here I will Create Methode to transfer from Json :
  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      skillName: json['skillName'],
      level: json['level'],
      icon: json['icon'],
    );
  }
}
