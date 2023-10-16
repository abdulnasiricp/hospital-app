import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:TezHealthCare/utils/colors.dart';

class CheckForUpdate extends StatefulWidget {
  const CheckForUpdate({Key? key}) : super(key: key);

  @override
  State<CheckForUpdate> createState() => _CheckForUpdateState();
}

class _CheckForUpdateState extends State<CheckForUpdate> {
  AppUpdateInfo? _updateInfo;
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey();

  bool _flexibleUpdateAvailable = true;
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
        showSnack(toString());
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: darkYellow,),
      body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text('Update info: 10.16.2023'),
              ),
              ElevatedButton(
                child: Text('Check for Update'),
                onPressed: () => checkForUpdate(),
              ),
              ElevatedButton(
                child: Text('Perform immediate update'),
                onPressed: _updateInfo?.updateAvailability ==
                        UpdateAvailability.updateAvailable
                    ? () {
                        InAppUpdate.performImmediateUpdate()
                            .catchError((e) {
                              showSnack(e.toString());
                             return AppUpdateResult.inAppUpdateFailed;
                            });
                      }
                    : null,
              ),
              ElevatedButton(
                child: Text('Start flexible update'),
                onPressed: _updateInfo?.updateAvailability ==
                        UpdateAvailability.updateAvailable
                    ? () {
                        InAppUpdate.startFlexibleUpdate().then((_) {
                          setState(() {
                            _flexibleUpdateAvailable = true;
                          });
                        }).catchError((e) {
                          showSnack(e.toString());
                        });
                      }
                    : null,
              ),
              ElevatedButton(
                child: Text('Complete flexible update'),
                onPressed: !_flexibleUpdateAvailable
                    ? null
                    : () {
                        InAppUpdate.completeFlexibleUpdate().then((_) {
                          showSnack("Success!");
                        }).catchError((e) {
                          showSnack(e.toString());
                        });
                      },
              )
            ],
          ),
        ),
      
     
    );
  }
}