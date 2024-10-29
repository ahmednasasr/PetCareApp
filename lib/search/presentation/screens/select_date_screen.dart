import 'package:flutter/material.dart';
import 'package:petcareapp/search/presentation/screens/search_results_screen.dart';

class SelectDateScreen extends StatelessWidget {
  static const String routename="selectdate";
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
              'Select a date',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(title: Text('Mon 7 Sep')),
                  ListTile(title: Text('Tue 8 Sep')),
                  ListTile(title: Text('Wed 9 Sep')),
                  ListTile(title: Text('Thu 10 Sep')),
                  // Add additional dates as needed
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchResultsScreen.routename);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Show 124 results'),
            ),
          ],
        ),
      ),
    );
  }
}
