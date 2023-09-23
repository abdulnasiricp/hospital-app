// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, sized_box_for_whitespace

import 'package:TezHealthCare/bottombar/bottombar.dart';
import 'package:TezHealthCare/bottomscreen/home/Patient%20Screens/Select_date.dart';
import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:TezHealthCare/widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AllDoctorsList extends StatefulWidget {
  const AllDoctorsList({Key? key}) : super(key: key);

  @override
  State<AllDoctorsList> createState() => _AllDoctorsListState();
}

class _AllDoctorsListState extends State<AllDoctorsList> {
  Map<String, dynamic>? DataMap;
  List<dynamic>? data = [];
  List<dynamic>? filteredData = [];
  TextEditingController searchController = TextEditingController();
  bool isLoading = true; // Control the loading indicator

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    try {
      final response = await http.post(
        Uri.parse('https://uat.tez.hospital/xzy/webservice/getAllDoctor'),
        headers: {
          'Soft-service': 'TezHealthCare',
          'Auth-key': 'zbuks_ram859553467',
        },
      );
      if (response.statusCode == 200) {
        DataMap = json.decode(response.body);
        setState(() {
          data = DataMap!['doctors'];
          filteredData = data;
          isLoading = false; // Set isLoading to false when data is loaded
        });
      } else {
        throw Exception('Failed to load data from the API');
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        isLoading = false; // Set isLoading to false on error
      });
    }
  }

  void filterData(String query) {
    setState(() {
      filteredData = data
          ?.where((element) =>
          element['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> _refreshData() async {
    setState(() {
      isLoading = true; // Set isLoading to true to show shimmer
    });

    // Fetch data when the user pulls down to refresh
    await fetchDataFromAPI();

    setState(() {
      isLoading = false; // Set isLoading to false after data is fetched
    });
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate to the Home Screen when the back button is pressed
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Bottomhome()),
        );
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('Select a Doctor'),
          centerTitle: true,
          backgroundColor: darkYellow,
          leading: IconButton(
            onPressed: () {
              Get.to(() => const Bottomhome());
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: Center(
            child: isLoading
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center, // Adjust alignment as needed
                              crossAxisAlignment: CrossAxisAlignment.center, // Adjust alignment as needed
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 130,
                                  height: 15,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  height: 10,
                                  color: Colors.white,
                                ),   const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 100,
                                  height: 5,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 150,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.5), // Half of the height to make it circular
                                    // Add other properties like boxShadow if needed
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: TextFormField(
                            onTapOutside: (event) => FocusNode().unfocus(),
                            controller: searchController,
                            onChanged: (query) => filterData(query),
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Search your doctor',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 0,
                            ),
                            itemCount: filteredData!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: width / 2,
                                      child: Card(
                                        color: Colors.white.withOpacity(0.9),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    '${filteredData![index]['image']}', // Replace with your image URL
                                                    width:
                                                        200.0, // Set the width (optional)
                                                    height:
                                                        200.0, // Set the height (optional)
                                                    fit: BoxFit
                                                        .cover, // Set the BoxFit (optional)
                                                    loadingBuilder: (context,
                                                        child, loadingProgress) {
                                                      if (loadingProgress ==
                                                          null) {
                                                        return child;
                                                      } else {
                                                        return CircularProgressIndicator(
                                                          color: darkYellow,
                                                          backgroundColor: yellow,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${filteredData![index]['name']} ${filteredData![index]['surname']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${filteredData![index]['specialization']}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${filteredData![index]['qualification']} ',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                height: 30,
                                                width: width,
                                                decoration: BoxDecoration(
                                                  border: Border.all(),
                                                  color: yellow,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(() =>
                                                        const SelectDateScreen());
                                                  },
                                                  child: const Center(
                                                    child: Text(
                                                      'Book Appointment',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
