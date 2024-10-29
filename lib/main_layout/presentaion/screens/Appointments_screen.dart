import 'package:flutter/material.dart';
import 'package:petcareapp/main_layout/data/models/appointment_model.dart';
import 'package:petcareapp/main_layout/presentaion/widgets/appointment_storage.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  List<Appointment> appointments = [];

  @override
  void initState() {
    super.initState();
    loadAppointments();
  }

  void loadAppointments() async {
    final loadedAppointments = await AppointmentStorage.getAppointments();
    setState(() {
      appointments = loadedAppointments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: appointments.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_busy, size: 100, color: Colors.grey),
            SizedBox(height: 16),
            Text("No appointments yet",
                style: TextStyle(fontSize: 20, color: Colors.grey)),
          ],
        ),
      )
          : ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Photo.png'),
                radius: 30,
              ),
              title: Text(appointment.doctorName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('التاريخ: ${appointment.date} - الوقت: ${appointment.time}'),
                  Text('الموقع: ${appointment.location}'),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  // تعديل الموعد
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
