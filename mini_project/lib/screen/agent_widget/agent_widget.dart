import 'package:flutter/material.dart';
import 'package:mini_project/screen/agent_widget/agent_view_model.dart';
import 'package:mini_project/screen/detail_agent_screen/detail_agent_screen.dart';
import 'package:mini_project/theme/color_theme.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class AgentWidget extends StatelessWidget {
  const AgentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final agentViewModel = context.read<AgentViewModel>();
    agentViewModel.getAgent();

    return Consumer<AgentViewModel>(
      builder: (context, agentViewModel, child) {
        return agentViewModel.isLoadingAgent == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: agentViewModel.listAgent.length,
                itemBuilder: (context, index) {
                  var dataAgent = agentViewModel.listAgent[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailAgentScreen(
                            agentUUID: dataAgent.uuid ?? '-',
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: ColorTheme().colorMaroon,
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  dataAgent.background ?? '-',
                                  fit: BoxFit.cover,
                                  width: 160,
                                  height: 220,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  dataAgent.bustPortrait ?? '-',
                                  fit: BoxFit.cover,
                                  width: 160,
                                  height: 220,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            dataAgent.displayName ?? '-',
                            style: TypographyStyle.antonXL,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
