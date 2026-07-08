import 'package:flutter/material.dart';
import 'package:protfolio_app/features/home/provider/home_provider.dart';
import 'package:protfolio_app/shared/widgets/stat_card.dart';
import 'package:provider/provider.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    print("اعاد بناء قسم الاراقم");
    final provider = context.watch<HomeProvider>();
    return Row(
      children: [
        StatCard(title: "Years Exp", value: provider.yearsExperience),
        StatCard(title: "Projects", value: provider.projectsCount),
        StatCard(title: "Skills", value: provider.skillsCount),
      ],
    );
  }
}
