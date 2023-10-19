import 'package:flutter/material.dart';
import 'package:mini_project/screen/bundle_screen/bundle_view_model.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class BundleWidgetPage extends StatelessWidget {
  const BundleWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bundelViewModel = context.read<BundleViewModel>();
    bundelViewModel.getBundle();
    return Consumer<BundleViewModel>(
      builder: (context, bundleViewModel, child) {
        if (bundleViewModel.isloadingBundle) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var dataBundle = bundleViewModel.listBundel[17];
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 100,
            ),
            children: [
              // Text(
              //   'NEW BUNDLE REALEASE',
              //   style: TypographyStyle.valoMRL,
              // ),
              Card(
                color: const Color(0xFFfd4556),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'NEW BUNDLE REALEASE',
                        style: TypographyStyle.antonM,
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          dataBundle.displayIcon ?? '-',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        dataBundle.description ?? '-',
                        style: TypographyStyle.antonM,
                      ),
                      Text(
                        dataBundle.extraDescription ?? '-',
                        style: TypographyStyle.robotoS,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'LIMITED BUNDLE !!!',
                        style: TypographyStyle.antonM,
                      ),
                      Text(
                        dataBundle.promoDescription ?? '-',
                        style: TypographyStyle.robotoS,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}