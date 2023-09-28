// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:TezHealthCare/Payment_gateway/Khalti.dart';
import 'package:TezHealthCare/Payment_gateway/connectips.dart';
import 'package:TezHealthCare/Payment_gateway/esewa.dart';
import 'package:TezHealthCare/Payment_gateway/imepay.dart';
import 'package:TezHealthCare/stringfile/All_string.dart';
import 'package:TezHealthCare/utils/My_button.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  _SelectPaymentMethodState createState() => _SelectPaymentMethodState();
}
class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  int selectedMethodIndex = 0;
  List<PaymentMethod> paymentMethods = [
    PaymentMethod('assets/khalti.png'),
    PaymentMethod('assets/esewa.png'),
    PaymentMethod('assets/ips.png'),
    PaymentMethod('assets/ime.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(EnString.Select_payment_gateway),
        centerTitle: true,
        backgroundColor: darkYellow,
      ),
      body: Container(
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                    ),
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMethodIndex = index;
                          });
                        },
                        child: PaymentMethodTile(
                          paymentMethod: paymentMethods[index],
                          isSelected: selectedMethodIndex == index,
                        ),
                      );
                    },
                  ),
                ),
                const Text(EnString.patientInformation,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  width: width,
                  height: height / 5,
                  child: const Card(
                    color: Colors.white70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                EnString.patientName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                EnString.patientMobile,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                EnString.patientGender,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                EnString.patientDOB,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                EnString.patientAddress,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: 40, top: 10, left: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ramjinish Kushwaha'),
                              Text('+977-9855014612'),
                              Text('Male'),
                              Text('07/04/2000'),
                              Text('Birgunj'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: MyButton(
                    title:

                        const Text('PROCEED'),
                    onPressed: () {
                      navigateToSelectedPage();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToSelectedPage() {
    final selectedMethod = paymentMethods[selectedMethodIndex].logoPath;
    if (selectedMethod.isNotEmpty) {
      if (selectedMethod == 'assets/khalti.png') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  KhaltiPage(),
        ));
      } else if (selectedMethod == 'assets/esewa.png') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EsewaPage(),
        ));
      } else if (selectedMethod == 'assets/ips.png') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const IpsPage(),
        ));
      } else if (selectedMethod == 'assets/ime.png') {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ImePage(),
        ));
      }
    } else {
      // Show an error or prompt to select a payment method
    }
  }
}

class PaymentMethod {
  final String logoPath;

  PaymentMethod(this.logoPath);
}

class PaymentMethodTile extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final bool isSelected;
  const PaymentMethodTile({Key? key, required this.paymentMethod, required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Set the height to 80
      child: Card(
        margin: const EdgeInsets.all(8.0),
        color: isSelected ? Colors.grey.withOpacity(0.7) : Colors.white,
        elevation: 5,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    paymentMethod.logoPath,
                    height: 80.0,
                    width: width/3,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: darkYellow,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }


}







