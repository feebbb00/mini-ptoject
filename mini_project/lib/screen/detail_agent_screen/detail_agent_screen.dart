import 'package:flutter/material.dart';
import 'package:mini_project/screen/detail_agent_screen/detail_agent_view_model.dart';
import 'package:mini_project/theme/color_theme.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class DetailAgentScreen extends StatelessWidget {
  final String agentUUID;

  const DetailAgentScreen({super.key, required this.agentUUID});

  @override
  Widget build(BuildContext context) {
    final detailAgentViewModel = context.read<DetailAgentViewModel>();
    detailAgentViewModel.getDetailAgent(agentUUID);

    return Scaffold(
      backgroundColor: ColorTheme().colorBlack,
      appBar: AppBar(
        title: Text(
          'Detail Agent',
          style: TypographyStyle.antonL,
        ),
        centerTitle: true,
        backgroundColor: ColorTheme().colorDarkMaroon,
      ),
      body: Consumer<DetailAgentViewModel>(
        builder: (context, detailAgentViewModel, child) {
          if (detailAgentViewModel.isLoadingDetailAgent) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final detailAgentData = detailAgentViewModel.detailAgentData?.data;
            if (detailAgentData != null) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                detailAgentData.background ?? '-',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 350,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                detailAgentData.bustPortrait ?? '-',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 350,
                              ),
                            ),
                            Text(
                              detailAgentData.displayName ?? '-',
                              style: TypographyStyle.antonXLBL,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Card(
                            color: ColorTheme().colorMaroon,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '//BIOGRAPHY',
                                    style: TypographyStyle.antonM,
                                  ),
                                  Text(
                                    detailAgentData.description ?? '-',
                                    style: TypographyStyle.robotoS,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '//ROLE',
                                    style: TypographyStyle.antonM,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        detailAgentData.role?.displayName ??
                                            '-',
                                        style: TypographyStyle.antonL,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          detailAgentData.role?.displayIcon ??
                                              '-',
                                          fit: BoxFit.cover,
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    detailAgentData.role?.description ?? '-',
                                    style: TypographyStyle.robotoS,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Text(
                            'ABILITY',
                            style: TypographyStyle.antonXL,
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: detailAgentData.abilities?.length,
                          itemBuilder: (context, abilityIndex) {
                            var ability =
                                detailAgentData.abilities?[abilityIndex];
                            return Padding(
                              padding: const EdgeInsets.all(12),
                              child: Card(
                                color: ColorTheme().colorRed,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${ability?.slot}',
                                        style: TypographyStyle.antonM,
                                      ),
                                      Text(
                                        ability?.displayName ?? '-',
                                        style: TypographyStyle.antonL,
                                      ),
                                      Center(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            ability?.displayIcon ?? '-',
                                            fit: BoxFit.cover,
                                            width: 65,
                                            height: 65,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ability?.description ?? '-',
                                        style: TypographyStyle.robotoS,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Detail Agent Data Not Available');
            }
          }
        },
      ),
    );
  }
}
