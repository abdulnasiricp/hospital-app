// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddNewMemberScreen extends StatefulWidget {
  const AddNewMemberScreen({Key? key}) : super(key: key);

  @override
  _AddNewMemberScreenState createState() => _AddNewMemberScreenState();
}

class _AddNewMemberScreenState extends State<AddNewMemberScreen> {
  late DateTime selectedDate;
  TextEditingController dateController = TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController dobController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController relationshipController=TextEditingController();
  TextEditingController districtController=TextEditingController();
  TextEditingController vdcMunicipalityController=TextEditingController();
  TextEditingController wardController=TextEditingController();
  TextEditingController toleController=TextEditingController();
  
  String selectedGender = ''; // Stores the selected gender.

  // Function to handle gender selection.
  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); // Initialize in initState
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  // Function to send data to the API
  void postDataToApi() async {
    const url = 'YOUR_API_ENDPOINT_HERE'; // Replace with your API endpoint
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    // Create a JSON payload with the data from the form fields
    final payload = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'gender': selectedGender,
      'age': ageController.text,
      'date_of_birth': dateController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'relationship': relationshipController.text,
      'district': districtController.text,
      'vdc_municipality': vdcMunicipalityController.text,
      'ward': wardController.text,
      'tole': toleController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        // Data posted successfully
        print('Data posted successfully');
      } else {
        // Handle error here
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or other errors here
      print('Error: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
             backgroundColor: Colors.lightBlue[50],

        appBar: AppBar(
          title: const Text('Add New Member'),
          centerTitle: true,
          backgroundColor: darkYellow,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' First Name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter First Name',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Last Name',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Last Name',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  " Gender",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildGenderCard(
                      icon: Icons.male,
                      label: 'Male',
                      gender: 'male',
                    ),
                    buildGenderCard(
                      icon: Icons.female,
                      label: 'Female',
                      gender: 'female',
                    ),
                    buildGenderCard(
                      icon: Icons.circle_outlined,
                      label: 'Other',
                      gender: 'other',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Age',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Age',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width / 1.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Date of Birth',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            child: TextFormField(
                              onTapOutside: (event) =>
                                  FocusScope.of(context).unfocus(),
                              controller: dateController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: const Icon(Icons.calendar_month),
                                      onPressed: () {
                                        _selectDate(context);
                                      }),
                                  border: const OutlineInputBorder(),
                                  hintText: 'Enter Date of Births',
                                  fillColor: Colors.white,
                                  filled: true),
                              readOnly: true,
                              onTap: () => _selectDate(context),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(' Phone (optional)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        controller: dateController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter phone Number',
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(' Email Address (optional)',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        controller: dateController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Email Address',
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(' Relationship',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        controller: dateController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'other',
                            fillColor: Colors.white,
                            filled: true),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Select district',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Select district',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Select VDC/Municipality',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Select VDC/Municipality',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            ' Ward',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Ward No.',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width / 2.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(' Tole',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Tole Name',
                                fillColor: Colors.white,
                                filled: true),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Center(
                    child: Container(width: width/1.7,
                    height: height/15,
                      child: ElevatedButton(
                                      child: const Text('Save'),
                                      onPressed: () {},
                                      style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(darkYellow),
                                      ),
                                    ),
                    ))
              ],
            ),
          ),
        ));
  }

  Widget buildGenderCard(
      {required IconData icon, required String label, required String gender}) {
    return GestureDetector(
      onTap: () {
        selectGender(gender);
      },
      child: Container(
        width: width / 4,
        child: Card(
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 30,
                  color: selectedGender == gender ? Colors.blue : Colors.grey,
                ),
                const SizedBox(height: 5),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 15,
                    color: selectedGender == gender ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
                // DropdownButtonFormField<String>(
                //   decoration: InputDecoration(labelText: 'Gender'),
                //   value: _gender,
                //   items: [
                //     DropdownMenuItem(child: Text('Male'), value: 'Male'),
                //     DropdownMenuItem(child: Text('Female'), value: 'Female'),
                //     DropdownMenuItem(child: Text('Other'), value: 'Other'),
                //   ],
                //   onChanged: (value) => setState(() => _gender = value!),
                // ),
  