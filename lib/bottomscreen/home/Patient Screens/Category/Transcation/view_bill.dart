import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class ViewBillDetiles extends StatefulWidget {
  const ViewBillDetiles({Key? key}) : super(key: key);

  @override
  State<ViewBillDetiles> createState() => _ViewBillDetilesState();
}

class _ViewBillDetilesState extends State<ViewBillDetiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: width / 5,
                height: height / 10,
                child: Image.asset('assets/hospital_logo.png'),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'मधेश प्रदेश सरकार',
                    style: TextStyle(fontSize: 10, color: Colors.red),
                  ),
                  Text('सामाजिक विकास मन्त्रालय\n      स्वास्थ्य निर्देशनालय',
                      style: TextStyle(fontSize: 10)),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('वेबसाइट : gaurhospital.p2.com.np',
                      style: TextStyle(fontSize: 10)),
                  Text('फोन नम्बर : 051520153', style: TextStyle(fontSize: 10)),
                  Text('इमेल : gaurhospital@gmail.com',
                      style: TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
          const Column(children: [
            Text('प्रादेशिक अस्पताल सिराह',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Text('सि रहा , नेपा ल',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Text('Service Bill(Copy of original)',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Divider(color: Colors.black,thickness: 2),
          ],),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Patient: Sita (10825)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('HIS No. :',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('Bill No: DB2852',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),



            ],),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Doctor :Ramjinish Prasad Kushwaha (982188)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('Date: 15/09/2023 03:04 PM/ 2080/5/29',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('Age : 25 Y 2M',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),



            ],)
          ],),
            // 
            const Divider(height: 3, color: Colors.black,thickness: 2),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(
              children: [
            Text('S.No. ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),

                Text('1 ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                Text('2 ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            ),
            
            Column(
              children: [
            Text('Services',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),


                Text('Ortho Tram',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                Text('UGI ENDOSCOPY(PRO03)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            ),
            Column(
              children: [
            Text('Date ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),


                Text('15/09/2023  ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                Text('15/09/2023  ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            ),
            Column(
              children: [
            Text('Qty ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),


                Text('1 ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                Text('1 ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            ),
            Column(
              children: [
            Text('Charge',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),


                Text('6000.00 ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                Text('1500.00 ',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            ),
            Column(
              children: [
            Text('Amount (RS.)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),


                Text('6000.00',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                Text('6000.00',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
              ],
            ),


            ],),
            const Divider(height: 3, color: Colors.black,thickness: 2),
             const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('Gross Amount',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('Net Amount',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('Paid',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('Total Due',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),



            ],),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text('RS.7500.00',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('RS.7500.00',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('RS.7500.00',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('RS.0.00',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),



            ],)
          ],),
            const Divider(height: 3, color: Colors.black,thickness: 2),
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text('In Words: SEVEN THOUSAND FIVE HUNDRED ONLY ',style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),),
            Text('Billed by :Ramjinish Prasad Kushwaha',style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),),

              
            ],),
            const Divider(height: 3, color: Colors.black,thickness: 2),
            const Column(
             
              children: [
                          Text('Best of luck!!',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),

            ],)





        ]),
      ),
    );
  }
}
