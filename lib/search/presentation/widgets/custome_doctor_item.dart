import 'package:flutter/material.dart';
import 'package:petcareapp/search/presentation/screens/doctor_Detail_Screen.dart';

class DoctorListItem extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;
  final int experience;
  final int reviews;
  final double distance;
  final double price;

  DoctorListItem({
    required this.image,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.reviews,
    required this.distance,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DoctorDetailScreen.routename);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          title: Text(name),
          subtitle: Text('$specialty - $experience years experience'),
          trailing: Column(
            children: [
              Text('\$$price'),
              Text('$distance km'),
            ],
          ),
        ),
      ),
    );
  }
}
