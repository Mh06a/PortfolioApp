import 'package:flutter/material.dart';
import 'package:protfolio_app/features/skills/provider/skills_provider.dart';
import 'package:protfolio_app/shared/widgets/custom_header.dart';
import 'package:protfolio_app/shared/widgets/empty_view.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:protfolio_app/shared/widgets/skill_card.dart';
import 'package:provider/provider.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  //step3 ----> here I will call build function to create the page :
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SkillsProvider()..loadData(),
      builder: (context, child) {
        final provider = context.watch<SkillsProvider>();

        if (provider.isLoading) {
          return LoadingView();
        }

        if (provider.errorMessage != null) {
          return ErrorView(
            message: provider.errorMessage!,
            onRetry: provider.loadData,
          );
        }

        if (provider.isEmpty) {
          return EmptyView(
            icon: Icons.code_off,
            title: "No Skills Found",
            subtitle: "Add your first skill.",
          );
        }

        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: provider.loadData,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //step3.1 ---> here I will Create Name of Secreen :
                      CustomHeader(
                        screenTitle: "Skills",
                        secondTitle: provider.skillsSubtitle,
                      ),

                      //step3.2 ---> here I will Create Filter section :
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            FilterChip(
                              label: Text("All"),
                              selected: true,
                              onSelected: (_) {},
                            ),

                            SizedBox(width: 8),

                            FilterChip(
                              label: Text("Mobile"),
                              selected: false,
                              onSelected: (_) {},
                            ),

                            SizedBox(width: 8),

                            FilterChip(
                              label: Text("Backend"),
                              selected: false,
                              onSelected: (_) {},
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),
                      //step3.3 ---> here I will Create Skill Card section :
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: provider.skillsCount,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.2,
                        ),

                        itemBuilder: (context, index) {
                          final skill = provider.skills[index];
                          return SkillCard(skill: skill);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
