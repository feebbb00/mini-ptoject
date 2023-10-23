import 'package:flutter/material.dart';
import 'package:mini_project/screen/detail_screen/detail_agent_view_model.dart';
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
      backgroundColor: const Color(0XFF141c24),
      appBar: AppBar(
        title: Text(
          'Detail Agent',
          style: TypographyStyle.antonL,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFbd3944),
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
                        Card(
                          color: const Color(0xFF53212b),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BIOGRAPHY',
                                  style: TypographyStyle.antonM,
                                ),
                                Text(
                                  detailAgentData.description ?? '-',
                                  style: TypographyStyle.robotoS,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: detailAgentData.abilities?.length,
                          itemBuilder: (context, abilityIndex) {
                            var ability =
                                detailAgentData.abilities?[abilityIndex];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${ability?.slot}',
                                  style: TypographyStyle.robotoS,
                                ),
                                Text(
                                  ability?.displayName ?? '-',
                                  style: TypographyStyle.robotoS,
                                ),
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      ability?.displayIcon ?? '-',
                                      fit: BoxFit.cover,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                Text(
                                  ability?.description ?? '-',
                                  style: TypographyStyle.robotoS,
                                ),
                                const SizedBox(height: 50),
                              ],
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
