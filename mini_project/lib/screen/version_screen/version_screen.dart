import 'package:flutter/material.dart';
import 'package:mini_project/screen/version_screen/version_view_model.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class UpdateInfoScreen extends StatelessWidget {
  const UpdateInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final versionViewModel = context.read<VersionViewModel>();
    versionViewModel.getVersion();

    return Consumer<VersionViewModel>(
      builder: (context, versionViewModel, child) {
        if (versionViewModel.isLoadingVersion) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final dataVersion = versionViewModel.versionData?.data;
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 100,
            ),
            children: [
              Text(
                'Manifest Id:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.manifestId ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Branch:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.branch ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Version:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.version ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Build Version:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.buildVersion ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Engine Version:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.engineVersion ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Riot CLient Version:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.riotClientVersion ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Riot Client Build:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.riotClientBuild ?? '=',
                style: TypographyStyle.robotoS,
              ),
              const SizedBox(height: 12),
              Text(
                'Build Date:',
                style: TypographyStyle.antonM,
              ),
              Text(
                dataVersion?.buildDate ?? '=',
                style: TypographyStyle.robotoS,
              ),
            ],
          );
        }
      },
    );
  }
}
