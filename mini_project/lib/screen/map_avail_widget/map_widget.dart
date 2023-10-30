import 'package:flutter/material.dart';
import 'package:mini_project/screen/map_avail_widget/map_view_model.dart';
import 'package:mini_project/theme/color_theme.dart';
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
                    color: ColorTheme().colorRed,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
