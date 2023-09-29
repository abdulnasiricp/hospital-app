import 'package:TezHealthCare/utils/colors.dart';
import 'package:esewa_flutter/esewa_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EsewaPage extends StatefulWidget {
  const EsewaPage({Key? key}) : super(key: key);

  @override
  State<EsewaPage> createState() => _EsewaPageState();
}

class _EsewaPageState extends State<EsewaPage> {
  String refId = '';
  String hasError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkYellow,
        centerTitle: true,
        title: const Text('Esawa payment'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // / Example Use case - 1
            TextButton(
              onPressed: () async {
                final result = await Esewa.i.init(
                    context: context,
                    eSewaConfig: ESewaConfig.dev(
                      // .live for live
                      su: 'https://www.marvel.com/hello',
                      amt: 1000,
                      fu: 'https://www.marvel.com/hello',
                      pid: '1212',
                      // scd: dotenv.env['ESEWA_SCD']!
                    ));
                // final result = await fakeEsewa();
                if (result.hasData) {
                  final response = result.data!;
                  if (kDebugMode) {
                    print(response.toJson());
                  }
                } else {
                  if (kDebugMode) {
                    print(result.error);
                  }
                }
              },
              child: const Text('Pay with Esewa'),
            ),
            if (refId.isNotEmpty)
              Text('Console: Payment Success, Ref Id: $refId'),
            if (hasError.isNotEmpty)
              Text('Console: Payment Failed, Message: $hasError'),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
