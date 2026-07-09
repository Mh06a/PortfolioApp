import 'package:flutter/material.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:protfolio_app/shared/widgets/custom_button.dart';
import 'package:protfolio_app/shared/widgets/custom_snackbar.dart';
import 'package:protfolio_app/shared/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  //step1 ----> here I will Create the class's variables :
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

    final profile = context.read<ProfileProvider>().profile;

    if (profile != null) {
      _nameController.text = profile.fullName;
      _specializationController.text = profile.specialization;
      _bioController.text = profile.bio;
      _yearsController.text = profile.yearsOfExperience.toString();
      _emailController.text = profile.email;
      _githubController.text = profile.githubLink;
      _linkedinController.text = profile.linkedinLink;
    }
  }

  //step3 ----> here I will Create a function to update profile :
  Future<void> _updateProfile() async {
    final provider = context.read<ProfileProvider>();

    final profile = Profile(
      id: 3,
      fullName: _nameController.text.trim(),
      specialization: _specializationController.text.trim(),
      bio: _bioController.text.trim(),
      yearsOfExperience: int.tryParse(_yearsController.text) ?? 0,
      email: _emailController.text.trim(),
      githubLink: _githubController.text.trim(),
      linkedinLink: _linkedinController.text.trim(),
    );

    final success = await provider.updateProfile(profile);

    if (!mounted) return;

    if (success) {
      CustomSnackbar.success(context, "Profile updated successfully");

      Navigator.pop(context, true);
    } else {
      CustomSnackbar.error(
        context,
        provider.errorMessage ?? "Something went wrong",
      );
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
    final provider = context.watch<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Edit Profile")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfield(
              controller: _nameController,
              labelText: "Full Name",
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _specializationController,
              labelText: "Specialization",
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _yearsController,
              labelText: "Years Of Experience",
              textInputType: TextInputType.number,
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _bioController,
              labelText: "Bio",
              maxLines: 4,
            ),

            SizedBox(height: 16),

            CustomTextfield(controller: _emailController, labelText: "Email"),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _githubController,
              labelText: "GitHub Link",
            ),

            SizedBox(height: 16),

            CustomTextfield(
              controller: _linkedinController,
              labelText: "LinkedIn Link",
            ),

            SizedBox(height: 24),

            provider.isLoading
                ? const CircularProgressIndicator()
                : CustomButton(
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
