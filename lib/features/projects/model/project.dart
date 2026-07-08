class Project {
  //step1 ----> here I will Create the class's variables :
  final int id;
  final String name;
  final String description;
  final String techStack;
  final String githubLink;

  //step2 ----> here I will Create The constructor :
  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.techStack,
    required this.githubLink,
  });

  //step3 ----> here I will Create Methode to transfer from Json :
  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      techStack: json['techStack'],
      githubLink: json['githubLink'],
    );
  }
}
