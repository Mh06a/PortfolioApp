class Skill {
  //step1 ----> here I will Create the class's variables :
  final int id;
  final String name;
  final String level;
  final String icon;

  //step2 ----> here I will Create The constructor :
  Skill({
    required this.id,
    required this.name,
    required this.level,
    required this.icon,
  });

  //step3 ----> here I will Create Methode to transfer from Json :
  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      icon: json['icon'],
    );
  }
}
