class Profile {
  //step1 ----> here I will Create the class's variables :
  final int id;
  final String fullName;
  final String specialization;
  final String bio;
  final int yearsOfExperience;
  final String email;
  final String githubLink;
  final String linkedinLink;

  //step2 ----> here I will Create The constructor :
  Profile({
    required this.id,
    required this.fullName,
    required this.specialization,
    required this.bio,
    required this.yearsOfExperience,
    required this.email,
    required this.githubLink,
    required this.linkedinLink,
  });

  //step3 ----> here I will Create Methode to transfer from Json :
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      fullName: json['fullName'],
      specialization: json['specialization'],
      bio: json['bio'],
      yearsOfExperience: json['yearsOfExperience'],
      email: json['email'],
      githubLink: json['githubLink'],
      linkedinLink: json['linkedinLink'],
    );
  }
}
