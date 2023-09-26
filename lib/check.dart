import 'package:flutter/material.dart';

void main() {
  runApp(const DoctorVitalsPage());
}

class DoctorVitalsPage extends StatelessWidget {
  const DoctorVitalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Doctor\'s Vitals Page'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
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
                const Text(
                  'Patient Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Patient Name: John Doe'),
                const Text('Age: 35'),
                const Text('Gender: Male'),
                const Text('Date of Admission: 2023-09-26'),
                const SizedBox(height: 32),
                const Text(
                  'Vitals',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                buildVitalItem('Heart Rate', '75 bpm'),
                buildVitalItem('Blood Pressure', '120/80 mmHg'),
                buildVitalItem('Temperature', '98.6°F'),
                buildVitalItem('Respiration Rate', '18 breaths/min'),
                const SizedBox(height: 32),
                const Text(
                  'Medical History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Diagnosis: Hypertension'),
                const Text('Allergies: None'),
                const Text('Medications: Amlodipine, Aspirin'),
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
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
