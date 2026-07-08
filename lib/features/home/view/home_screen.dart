import 'package:flutter/material.dart';
import 'package:protfolio_app/features/home/provider/home_provider.dart';
import 'package:protfolio_app/features/home/widgets/about_section.dart';
import 'package:protfolio_app/features/home/widgets/action_section.dart';
import 'package:protfolio_app/features/home/widgets/home_header.dart';
import 'package:protfolio_app/features/home/widgets/profile_card.dart';
import 'package:protfolio_app/features/home/widgets/skills_section.dart';
import 'package:protfolio_app/features/home/widgets/statistics_section.dart';
import 'package:protfolio_app/shared/widgets/error_view.dart';
import 'package:protfolio_app/shared/widgets/loading_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //step3 ----> here I will call build function to create the page :
  //final provider = context.watch<HomeProvider>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()..loadData(),
      builder: (context, child) {
        final provider = context.watch<HomeProvider>();

        if (provider.isLoading) {
          return const LoadingView();
        }

        if (provider.errorMessage != null) {
          return ErrorView(
            message: provider.errorMessage!,
            onRetry: provider.loadData,
          );
        }

        print("اعاد بناء الصفحة الهوم");
        return Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: provider.loadData,
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
      },
    );
  }
}
