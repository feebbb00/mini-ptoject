// import 'package:flutter/material.dart';
// import 'package:mini_project/screen/agent_screen/agent_view_model.dart';
// import 'package:mini_project/theme/typography_style.dart';
// import 'package:provider/provider.dart';

// class AgentWidget extends StatelessWidget {
//   const AgentWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final agentViewModel = context.read<AgentViewModel>();
//     agentViewModel.getAgent();

//     return Consumer<AgentViewModel>(
//       builder: (context, agentViewModel, child) {
//         return agentViewModel.isLoadingAgent == true
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView.builder(
//                 itemCount: agentViewModel.listAgent.length,
//                 itemBuilder: (context, index) {
//                   var dataAgent = agentViewModel.listAgent[index];
//                   return Column(
//                     children: [
//                       Text(
//                         dataAgent.displayName ?? '-',
//                         style: TypographyStyle.robotoS,
//                       ),
//                       // Menampilkan daftar abilities
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: dataAgent.abilities?.length,
//                         itemBuilder: (context, abilityIndex) {
//                           var ability = dataAgent.abilities?[abilityIndex];
//                           return Column(
//                             children: [
//                               Text(
//                                 ability?.displayName ?? '-',
//                                 style: TypographyStyle.robotoS,
//                               ),
//                               Text(
//                                 ability?.description ?? '-',
//                                 style: TypographyStyle.robotoS,
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//       },
//     );
//   }
// }
