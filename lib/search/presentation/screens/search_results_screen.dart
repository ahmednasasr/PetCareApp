import 'package:flutter/material.dart';
import 'package:petcareapp/search/presentation/screens/search_results_screen.dart';
import 'package:petcareapp/search/presentation/widgets/custome_doctor_item.dart';

class SearchResultsScreen extends StatelessWidget {
  static const String routename="searchresult";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Search Results — Near Me',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Map', style: TextStyle(color: Colors.blue)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                FilterChip(
                  label: Text('Specialists'),
                  onSelected: (_) {},
                  backgroundColor: Colors.blue,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('Clinics'),
                  onSelected: (_) {},
                  backgroundColor: Colors.grey.shade200,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  DoctorListItem(
                    image:"assets/images/Rectangle 2.1.png",
                    name: 'Vasilenko Oksana',
                    specialty: 'Veterinary Dentist',
                    experience: 10,
                    reviews: 125,
                    distance: 1.5,
                    price: 20,
                  ),
                  DoctorListItem(
                    name: 'Avramenko Vladimir',
                    specialty: 'Veterinary Dentist',
                    experience: 7,
                    reviews: 23,
                    distance: 4,
                    price: 20,
                    image:"assets/images/Photo.png",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

