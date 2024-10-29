import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DoctorDetailScreen extends StatelessWidget {
  static const String routename = "doctorDetail";

  Future<void> bookAppointment(BuildContext context) async {
    final appointment = {
      'doctorName': 'Alekseenko Vasily',
      'specialty': 'Veterinary Dentist',
      'clinic': 'Veterinary Clinic "Happy-Animal"',
      'location': '18th Line, Los Angeles, CA',
      'date': 'Today',
      'time': '09:00',
    };

    final prefs = await SharedPreferences.getInstance();
    final appointmentsData = prefs.getString('appointments') ?? '[]';
    final List<dynamic> appointments = jsonDecode(appointmentsData);

    // إضافة الموعد الجديد إلى قائمة المواعيد
    appointments.add(appointment);
    await prefs.setString('appointments', jsonEncode(appointments));

    // إظهار رسالة تأكيد
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Appointment booked successfully!')),
    );
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/Photo.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Alekseenko Vasily',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Veterinary Dentist',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.blue, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '4.9',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                      SizedBox(width: 4),
                      Text('(125 reviews)', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.blue),
                    SizedBox(height: 4),
                    Text('Today'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.schedule, color: Colors.blue),
                    SizedBox(height: 4),
                    Text('09:00'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.schedule, color: Colors.blue),
                    SizedBox(height: 4),
                    Text('10:00'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.blue),
                title: Text('Veterinary Clinic "Happy-Animal"'),
                subtitle: Text('18th Line, Los Angeles, CA'),
              ),
            ),
            SizedBox(height: 20),
            Text('Biography', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              'Alekseenko Vasily (Volodymyr), born in 1985...',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text('Education', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              'Graduated from the agricultural Academy...',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text('Professional Experience', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              'From 2003 to 2005, he was the chief physician...',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text('Personal Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(
              'Married, two children: daughter Alice and son Theodore.',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Text('Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListTile(
              leading: CircleAvatar(),
              title: Text('Ann & Leo'),
              subtitle: Text('He was friendly and diligent...'),
            ),
            SizedBox(height: 20),
            // زر الحجز
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await bookAppointment(context);
                  print("Appointment booked successfully");
                },
                child: Text('Book Appointment'),
              )

            ),
          ],
        ),
      ),
    );
  }
}
