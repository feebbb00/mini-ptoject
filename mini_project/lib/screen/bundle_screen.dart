// import 'package:flutter/material.dart';
// import 'package:mini_project/screen/bundle_view_model.dart';
// import 'package:provider/provider.dart';

// class BundleScreen extends StatelessWidget {
//   const BundleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bundleViewModel = context.read<BundleViewModel>();
//     bundleViewModel.getBundle();

//     return Scaffold(
//         backgroundColor: const Color(0XFF182545),
//         appBar: AppBar(
//           title: const Text(
//             'VALORANT UPDATE BUNDLE',
//             style: TextStyle(
//               color: Color(0xFFbd3944),
//               fontFamily: 'valo',
//             ),
//           ),
//           backgroundColor: const Color(0XFF182545),
//           centerTitle: true,
//         ),
//         body: ListView(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 50,
//           ),
//           children: [
//             Consumer<BundleViewModel>(
//               builder: (context, bundleViewModel, child) {
//                 return bundleViewModel.isloadingBundle == true
//                     ? const Center(child: CircularProgressIndicator())
//                     : Card(
//                         color: const Color(0xFFfd4556),
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               const Text(
//                                 'NEW BUNDLE REALEASE',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'anton',
//                                 ),
//                               ),
//                               const SizedBox(height: 6),
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(
//                                     10), // Sesuaikan sesuai keinginan Anda
//                                 child: Image.network(
//                                   bundleViewModel.listBundel[17].displayIcon ??
//                                       '-',
//                                   fit: BoxFit.cover, // Atur fitting gambar
//                                   width:
//                                       double.infinity, // Sesuaikan lebar gambar
//                                   height: 200, // Sesuaikan tinggi gambar
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 bundleViewModel.listBundel[17].description ??
//                                     '-',
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontFamily: 'anton',
//                                 ),
//                               ),
//                               Text(
//                                 bundleViewModel
//                                         .listBundel[17].extraDescription ??
//                                     '-',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                   fontFamily: 'roboto',
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               const Text(
//                                 'LIMITED BUNDLE',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                   fontFamily: 'anton',
//                                 ),
//                               ),
//                               Text(
//                                 bundleViewModel
//                                         .listBundel[17].promoDescription ??
//                                     '-',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                   fontFamily: 'roboto',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//               },
//             ),
//           ],
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:mini_project/screen/bundle_view_model.dart';
import 'package:provider/provider.dart';

class BundleScreen extends StatelessWidget {
  const BundleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bundelViewModel = context.read<BundleViewModel>();
    bundelViewModel.getBundle();

    // var selectedbundle = bundelViewModel.listBundel[7];
    //ketika kode di atas dijalankan maka eror pada saat aplikasi pertamakali dijalankan

    return Scaffold(
      backgroundColor: const Color(0XFF182545),
      appBar: AppBar(
        title: const Text(
          'VALORANT UPDATE BUNDLE',
          style: TextStyle(
            color: Color(0xFFbd3944),
            fontFamily: 'valo',
          ),
        ),
        backgroundColor: const Color(0XFF182545),
        centerTitle: true,
      ),
      body: Consumer<BundleViewModel>(
        builder: (context, bundleViewModel, child) {
          return bundelViewModel.isloadingBundle == true
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 120),
                  //alasan emnggunakan list view builder : karena tidak tau cara membuat variabel data bundle jika tidak menggunakan listviewbuilder
                  //ketika di letakkan di atas scaffold data pada saat aplikasi pertama kali di jalankan terjadi error
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    var dataBundle = bundleViewModel.listBundel[3];
                    return Column(
                      children: [
                        const Text(
                          'NEW BUNDLE REALEASE',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'anton',
                          ),
                        ),
                        Card(
                          color: const Color(0xFFfd4556),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'NEW BUNDLE REALEASE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'anton',
                                  ),
                                ),
                                const SizedBox(height: 6),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
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
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'anton',
                                  ),
                                ),
                                Text(
                                  dataBundle.extraDescription ?? '-',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'roboto',
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'LIMITED BUNDLE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'anton',
                                  ),
                                ),
                                Text(
                                  dataBundle.promoDescription ?? '-',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'roboto',
                                  ),
                                ),
                                // Text(
                                //   selectedbundle.promoDescription ?? '-',
                                //   style: const TextStyle(
                                //     fontWeight: FontWeight.w500,
                                //     color: Colors.white,
                                //     fontFamily: 'roboto',
                                //   ),
                                // ),
                                //COBA panggil selectedBundle
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
        },
      ),
    );
  }
}
