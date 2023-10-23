
// ignore_for_file: unused_field, sized_box_for_whitespace

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

// class CheckForUpdate extends StatefulWidget {
//   const CheckForUpdate({Key? key}) : super(key: key);

//   @override
//   State<CheckForUpdate> createState() => _CheckForUpdateState();
// }

// class _CheckForUpdateState extends State<CheckForUpdate> {
//   AppUpdateInfo? _updateInfo;
//   final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey();

//   bool _flexibleUpdateAvailable = true;
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> checkForUpdate() async {
//     InAppUpdate.checkForUpdate().then((info) {
//       setState(() {
//         _updateInfo = info;
//         showSnack(toString());
//       });
//     }).catchError((e) {
//       showSnack(e.toString());
//     });
//   }

//   void showSnack(String text) {
//     if (_scaffoldKey.currentContext != null) {
//       ScaffoldMessenger.of(_scaffoldKey.currentContext!)
//           .showSnackBar(SnackBar(content: Text(text)));
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: darkYellow,),
//       body:Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               const Center(
//                 child: Text('Update info: 10.16.2023'),
//               ),
//               ElevatedButton(
//                 child: const Text('Check for Update'),
//                 onPressed: () => checkForUpdate(),
//               ),
//               ElevatedButton(
//                 child: const Text('Perform immediate update'),
//                 onPressed: _updateInfo?.updateAvailability ==
//                         UpdateAvailability.updateAvailable
//                     ? () {
//                         InAppUpdate.performImmediateUpdate()
//                             .catchError((e) {
//                               showSnack(e.toString());
//                              return AppUpdateResult.inAppUpdateFailed;
//                             });
//                       }
//                     : null,
//               ),
//               ElevatedButton(
//                 child: const Text('Start flexible update'),
//                 onPressed: _updateInfo?.updateAvailability ==
//                         UpdateAvailability.updateAvailable
//                     ? () {
//                         InAppUpdate.startFlexibleUpdate().then((_) {
//                           setState(() {
//                             _flexibleUpdateAvailable = true;
//                           });
//                         }).catchError((e) {
//                           showSnack(e.toString());
//                         });
//                       }
//                     : null,
//               ),
//               ElevatedButton(
//                 child: const Text('Complete flexible update'),
//                 onPressed: !_flexibleUpdateAvailable
//                     ? null
//                     : () {
//                         InAppUpdate.completeFlexibleUpdate().then((_) {
//                           showSnack("Success!");
//                         }).catchError((e) {
//                           showSnack(e.toString());
//                         });
//                       },
//               )
//             ],
//           ),
//         ),

//     );
//   }
// }

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class AppUpdateCheckScreen extends StatefulWidget {
  const AppUpdateCheckScreen({Key? key}) : super(key: key);

  @override
  _AppUpdateCheckScreenState createState() => _AppUpdateCheckScreenState();
}

class _AppUpdateCheckScreenState extends State<AppUpdateCheckScreen> {
  bool _isUpdateAvailable = false;
  final bool _isUpdateNotAvailable = false;
  Future<bool>? _checkForUpdateFuture;

  void _checkForUpdate() {
    setState(() {
      _checkForUpdateFuture = Future<bool>.microtask(() async {
        // For example, you could use the following code to check for app updates on the Google Play Store:

        const String packageName = 'tez.hospital.siraha';
        const String url =
            'https://play.google.com/store/apps/details?id=$packageName';

        final Uri uri = Uri.parse(url);
        final response = await http.get(uri);

        if (response.statusCode == 200) {
          // The app is up to date.
          return false;
        } else {
          // An update is available.
          return true;
        }
      });
    });
  }

  void _navigateToPlayStore() async {
    const String packageName = 'tez.hospital.siraha';
    const String url =
        'https://play.google.com/store/apps/details?id=$packageName';

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {}
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Update Check'),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(darkYellow),
                  ),
                  onPressed: _checkForUpdate,
                  child: const Text('Check for Update'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_checkForUpdateFuture != null)
            FutureBuilder<bool>(
  future: _checkForUpdateFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator(); // Show a loading indicator while checking for updates.
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else if (snapshot.hasData) {
      _isUpdateAvailable = snapshot.data!;
      if (_isUpdateAvailable) {
        return ElevatedButton(
           style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(darkYellow),
                  ),
          onPressed: _navigateToPlayStore,
          child: const Text('Update Now'),
        );
      } else {
        return const Text('Your app is up to date.');
      }
    } else {
      return const Text('Press the "Check for Update" button.');
    }
  },
)

          ],
        ),
      ),
    );
  }
}
