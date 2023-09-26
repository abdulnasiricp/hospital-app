import 'package:flutter/material.dart';

void main() {
  runApp(DoctorVitalsPage());
}

class DoctorVitalsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doctor\'s Vitals Page'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            width: 300.0, // Adjust container width as needed
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patient Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text('Patient Name: John Doe'),
                Text('Age: 35'),
                Text('Gender: Male'),
                Text('Date of Admission: 2023-09-26'),
                SizedBox(height: 32),
                Text(
                  'Vitals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                buildVitalItem('Heart Rate', '75 bpm'),
                buildVitalItem('Blood Pressure', '120/80 mmHg'),
                buildVitalItem('Temperature', '98.6°F'),
                buildVitalItem('Respiration Rate', '18 breaths/min'),
                SizedBox(height: 32),
                Text(
                  'Medical History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text('Diagnosis: Hypertension'),
                Text('Allergies: None'),
                Text('Medications: Amlodipine, Aspirin'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildVitalItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
