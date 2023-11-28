import 'package:TezHealthCare/utils/colors.dart';
import 'package:TezHealthCare/utils/mediaqury.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          margin: const EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.blue[100],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))),
          child: const Column(
            children: [
              Text(
                'Welcome to Tez Health Care App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'If you are trying to access an element in a list or array at a specific index.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'If you are trying to access an element in a list or array at a specific index.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'If you are trying to access an element in a list or array at a specific index.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'If you are trying to access an element in a list or array at a specific index.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text(
                    'If you are trying to access an element in a list or array at a specific index.',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        InkWell(
          onTap: (){
            // Navigator.of(context).pop();
          },
          child: Container(
            width: width,
            height: 40,
            color: whitecolor,
            child: const Center(child: Text('Skip',style: TextStyle(fontWeight: FontWeight.bold),)),
          ),
        )
      ],
    );
  }
}
