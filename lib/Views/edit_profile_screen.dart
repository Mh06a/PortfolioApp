import 'package:flutter/material.dart';
import 'package:protfolio_app/Controllers/profile_controller.dart';
import 'package:protfolio_app/Models/profile.dart';
import 'package:protfolio_app/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //step1 ----> here I will Create the class's variables :
  final ProfileController _profileController = ProfileController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();

  //step2 ----> here I will call initState becasue use load functions :
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _profileController.loadProfile(3);

    final profile = _profileController.profile;

    if (profile != null) {
      _nameController.text = profile.fullName;
      _specializationController.text = profile.specialization;
      _bioController.text = profile.bio;
      _yearsController.text = profile.yearsOfExperience.toString();
      _emailController.text = profile.email;
      _githubController.text = profile.githubLink;
      _linkedinController.text = profile.linkedinLink;
    }
    setState(() {});
  }

  //step3 ----> here I will Create a function to update profile :
  Future<void> _updateProfile() async {
    try {
      final profile = Profile(
        id: 3,
        fullName: _nameController.text,
        specialization: _specializationController.text,
        bio: _bioController.text,
        yearsOfExperience: int.tryParse(_yearsController.text) ?? 0,
        email: _emailController.text,
        githubLink: _githubController.text,
        linkedinLink: _linkedinController.text,
      );

      await _profileController.updateProfile(3, profile);

      print("Success");
      print(_profileController.errorMessage);

      if (mounted) {
        Navigator.pop(context, true);
      }
    } catch (e) {
      print(e);
    }
  }

  //step4 ----> here I will call dispose function :
  @override
  void dispose() {
    _nameController.dispose();
    _specializationController.dispose();
    _bioController.dispose();
    _yearsController.dispose();
    _emailController.dispose();
    _githubController.dispose();
    _linkedinController.dispose();
    super.dispose();
  }

  //step5 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _specializationController,
              decoration: InputDecoration(
                labelText: "Specialization",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _yearsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Years Of Experience",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _bioController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Bio",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _githubController,
              decoration: InputDecoration(
                labelText: "GitHub Link",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              controller: _linkedinController,
              decoration: InputDecoration(
                labelText: "LinkedIn Link",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 24),

            CustomButton(
              tilte: "Update Profile",
              icon: Icons.save,
              width: double.infinity,
              onPressed: _updateProfile,
            ),
          ],
        ),
      ),
    );
  }
}
