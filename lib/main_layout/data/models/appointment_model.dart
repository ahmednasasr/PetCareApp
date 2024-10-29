class Appointment {
  final String doctorName;
  final String specialty;
  final String clinic;
  final String location;
  final String date;
  final String time;

  Appointment({
    required this.doctorName,
    required this.specialty,
    required this.clinic,
    required this.location,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() => {
    'doctorName': doctorName,
    'specialty': specialty,
    'clinic': clinic,
    'location': location,
    'date': date,
    'time': time,
  };

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      doctorName: json['doctorName'],
      specialty: json['specialty'],
      clinic: json['clinic'],
      location: json['location'],
      date: json['date'],
      time: json['time'],
    );
  }
}