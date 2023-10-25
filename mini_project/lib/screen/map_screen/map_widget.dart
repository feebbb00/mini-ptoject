import 'package:flutter/material.dart';
import 'package:mini_project/screen/map_screen/map_view_model.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mapViewModel = context.read<MapViewModel>();
    mapViewModel.getMap();

    return Consumer<MapViewModel>(
      builder: (context, mapViewModel, child) {
        return mapViewModel.isLoadingMap == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: 5,
                itemBuilder: (context, index) {
                  var dataMap = mapViewModel.listMap[index];
                  return Card(
                    color: const Color(0xFFfd4556),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  dataMap.listViewIcon ?? '-',
                                  fit: BoxFit.cover,
                                  width: 350,
                                  height: 120,
                                ),
                              ),
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(10),
                              //   child: Image.network(
                              //     dataMap.displayIcon ?? '-',
                              //     fit: BoxFit.cover,
                              //     width: 160,
                              //     height: 220,
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            dataMap.displayName ?? '-',
                            style: TypographyStyle.antonL,
                          ),
                          Text(
                            dataMap.narrativeDescription ?? '-',
                            style: TypographyStyle.robotoS,
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
