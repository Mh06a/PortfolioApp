import 'package:flutter/material.dart';
import 'package:protfolio_app/features/home/widgets/about_section.dart';
import 'package:protfolio_app/features/home/widgets/action_section.dart';
import 'package:protfolio_app/features/home/widgets/home_header.dart';
import 'package:protfolio_app/features/home/widgets/profile_card.dart';
import 'package:protfolio_app/features/home/widgets/skills_section.dart';
import 'package:protfolio_app/features/home/widgets/statistics_section.dart';
import 'package:protfolio_app/features/profile/provider/profile_provider.dart';
import 'package:protfolio_app/features/projects/provider/project_provider.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    final skillsProvider = context.watch<SkillsProvider>();
    final projectsProvider = context.watch<ProjectProvider>();

    final isLoading =
        profileProvider.isLoading ||
        skillsProvider.isLoading ||
        projectsProvider.isLoading;

    final error =
        profileProvider.errorMessage ??
        skillsProvider.errorMessage ??
        projectsProvider.errorMessage;
    if (isLoading) {
      return const LoadingView();
    }

    if (error != null) {
      return ErrorView(
        message: error,
        onRetry: () async {
          await Future.wait([
            profileProvider.loadData(),
            skillsProvider.loadData(),
            projectsProvider.loadData(),
          ]);
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              profileProvider.loadData(),
              skillsProvider.loadData(),
              projectsProvider.loadData(),
            ]);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //step3.1 ---> here I will Create Name Section :
                  HomeHeader(),

                  SizedBox(height: 25),

                  //step3.2 ---> here I will Create bio section :
                  ProfileCard(),

                  SizedBox(height: 20),

                  //step3.3 ---> here I will Create statistics section :
                  StatisticsSection(),

                  SizedBox(height: 15),

                  //step3.4 ---> here I will Create Specializations section :
                  SkillsSection(),

                  SizedBox(height: 12),
                  //step3.5 ---> here I will Create About me section :
                  AboutSection(),

                  SizedBox(height: 10),

                  //step3.6 ---> here I will Create Buttons section :
                  ActionSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
