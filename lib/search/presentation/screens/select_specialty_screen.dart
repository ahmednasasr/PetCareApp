import 'package:flutter/material.dart';
import 'package:petcareapp/search/presentation/screens/select_date_screen.dart';

class SelectSpecialtyScreen extends StatelessWidget {
  static const String routename = "selectspecilt";

  // قائمة التخصصات
  final List<String> specialties = [
    'Cat Specialist',
    'Dog Specialist',
    'Ornithologist',
    'Dentist',
    'Surgeon',
    'Veterinarian',
    'Therapist',
    'Anesthetist',
    'Gastroenterologist',
    'Infectious disease',
    'Cardiologist',
    'Neurologist',
    'Oncologist',
    'Ophthalmologist',
    'Radiologist',
    'Traumatologist',
    'Endocrinologist',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a specialty',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'POPULAR SPECIALTIES',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: specialties.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(specialties[index]),
                        onTap: () {
                          Navigator.pushNamed(context, SelectDateScreen.routename);
                        },
                      ),
                      if (index == 4) ...[
                        Divider(),
                        Text(
                          'ALL SPECIALTIES',
                          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
