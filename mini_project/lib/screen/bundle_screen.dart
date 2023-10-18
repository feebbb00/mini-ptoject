import 'package:flutter/material.dart';
import 'package:mini_project/screen/bundle_view_model.dart';
import 'package:provider/provider.dart';

class BundleScreen extends StatelessWidget {
  const BundleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bundleViewModel = context.read<BundleViewModel>();
    bundleViewModel.getBundle();
    return Scaffold(
      backgroundColor: const Color(0xFFfffcc4),
      appBar: AppBar(
        title: const Text(
          'Valoran Info',
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: const Color.fromARGB(255, 49, 8, 102),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<BundleViewModel>(
          builder: (context, bundleViewModel, child) {
            return bundleViewModel.isloadingBundle == true
                ? const Center(child: CircularProgressIndicator())
                : Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('NEW BUNDLE REALEASE',
                            style: TextStyle(color: Colors.red)),
                        Image.network(
                          bundleViewModel.listBundel.first.displayIcon ?? '-',
                        ),
                        Center(
                          child: Text(
                              bundleViewModel.listBundel.first.description ??
                                  '-'),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
