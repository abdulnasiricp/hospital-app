//  _deathsectiontextfield(context,'Death Date',deathDateController),

 
//   Container _deathsectiontextfield(BuildContext context,title,TextEditingController controller) {
//     return Container(
//                   width: width / 2.2,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text:  TextSpan(
//                           children: [
//                             TextSpan(
//                               text: title,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black,
//                               ),
//                             ),
//                             const TextSpan(
//                               text: '*',
//                               style: TextStyle(
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'This field is required';
//                           }
//                           return null;
//                         },
                      
//                         decoration: const InputDecoration(
                          
//                           border: OutlineInputBorder(),
                        
//                           fillColor: Colors.white,
//                           filled: true,
//                         ),
//                        controller:controller ,
//                       )
//                     ],
//                   ),
//                 );
//   }