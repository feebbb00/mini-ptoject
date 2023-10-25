import 'package:flutter/material.dart';
import 'package:mini_project/screen/bundle_widget/bundle_view_model.dart';
import 'package:mini_project/theme/typography_style.dart';
import 'package:provider/provider.dart';

class BundleScreen extends StatelessWidget {
  const BundleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bundelViewModel = context.read<BundleViewModel>();
    bundelViewModel.getBundle();

    return Scaffold(
      backgroundColor: const Color(0XFF182545),
      appBar: AppBar(
        title: Text(
          'VALORANT UPDATE BUNDLE',
          style: TypographyStyle.valoMRL,
        ),
        backgroundColor: const Color(0XFF182545),
        centerTitle: true,
      ),
      body: Consumer<BundleViewModel>(
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
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:mini_project/screen/bundle_view_model.dart';
// import 'package:provider/provider.dart';

// class BundleScreen extends StatelessWidget {
//   const BundleScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final bundelViewModel = context.read<BundleViewModel>();
//     bundelViewModel.getBundle();

//     // var selectedbundle = bundelViewModel.listBundel[7];
//     //ketika kode di atas dijalankan maka eror pada saat aplikasi pertamakali dijalankan

//     return Scaffold(
//       backgroundColor: const Color(0XFF182545),
//       appBar: AppBar(
//         title: const Text(
//           'VALORANT UPDATE BUNDLE',
//           style: TextStyle(
//             color: Color(0xFFbd3944),
//             fontFamily: 'valo',
//           ),
//         ),
//         backgroundColor: const Color(0XFF182545),
//         centerTitle: true,
//       ),
//       body: Consumer<BundleViewModel>(
//         builder: (context, bundleViewModel, child) {
//           return bundelViewModel.isloadingBundle == true
//               ? const Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 120),
//                   //alasan emnggunakan list view builder : karena tidak tau cara membuat variabel data bundle jika tidak menggunakan listviewbuilder
//                   //ketika di letakkan di atas scaffold data pada saat aplikasi pertama kali di jalankan terjadi error
//                   itemCount: 1,
//                   itemBuilder: (context, index) {
//                     var dataBundle = bundleViewModel.listBundel[3];
//                     return Column(
//                       children: [
//                         const Text(
//                           'NEW BUNDLE REALEASE',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: 'anton',
//                           ),
//                         ),
//                         Card(
//                           color: const Color(0xFFfd4556),
//                           child: Padding(
//                             padding: const EdgeInsets.all(6),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 const Text(
//                                   'NEW BUNDLE REALEASE',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'anton',
//                                   ),
//                                 ),
//                                 const SizedBox(height: 6),
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(
//                                     10,
//                                   ),
//                                   child: Image.network(
//                                     dataBundle.displayIcon ?? '-',
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                     height: 200,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 Text(
//                                   dataBundle.description ?? '-',
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'anton',
//                                   ),
//                                 ),
//                                 Text(
//                                   dataBundle.extraDescription ?? '-',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                     fontFamily: 'roboto',
//                                   ),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 const Text(
//                                   'LIMITED BUNDLE',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                     fontFamily: 'anton',
//                                   ),
//                                 ),
//                                 Text(
//                                   dataBundle.promoDescription ?? '-',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                     fontFamily: 'roboto',
//                                   ),
//                                 ),
//                                 // Text(
//                                 //   selectedbundle.promoDescription ?? '-',
//                                 //   style: const TextStyle(
//                                 //     fontWeight: FontWeight.w500,
//                                 //     color: Colors.white,
//                                 //     fontFamily: 'roboto',
//                                 //   ),
//                                 // ),
//                                 //COBA panggil selectedBundle
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }

