import 'dart:convert';

import 'package:petcareapp/main_layout/data/models/appointment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentStorage {
  static const String _appointmentsKey = 'appointments';

  static Future<void> saveAppointment(Appointment appointment) async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsData = prefs.getString(_appointmentsKey) ?? '[]';
    final List<dynamic> appointmentsList = jsonDecode(appointmentsData);

    appointmentsList.add(appointment.toJson());
    await prefs.setString(_appointmentsKey, jsonEncode(appointmentsList));
  }

  static Future<List<Appointment>> getAppointments() async {
    final prefs = await SharedPreferences.getInstance();
    final appointmentsData = prefs.getString(_appointmentsKey) ?? '[]';
    final List<dynamic> appointmentsList = jsonDecode(appointmentsData);

    return appointmentsList.map((json) => Appointment.fromJson(json)).toList();
  }
}

void testSaveAppointment() async {
  final appointment = Appointment(
    doctorName: 'Dr. Smith',
    specialty: 'Dentist',
    clinic: 'Smile Clinic',
    location: '123 Dental St',
    date: '2024-10-30',
    time: '10:30',
  );

  await AppointmentStorage.saveAppointment(appointment);
  print('Appointment saved successfully!');
}

void testGetAppointments() async {
  final appointments = await AppointmentStorage.getAppointments();
  for (var appointment in appointments) {
    print('Doctor: ${appointment.doctorName}, Date: ${appointment.date}, Time: ${appointment.time}');
  }
}