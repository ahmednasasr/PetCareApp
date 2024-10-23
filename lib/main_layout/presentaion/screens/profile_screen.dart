import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNameValid = false;
  bool isEmailValid = false;
  bool isMale = true;
  String selectedCountryCode = "+20";
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Color(0xff4552CB)),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Skip", style: TextStyle(color: Color(0xff4552CB))),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: _selectedImage != null
                  ? FileImage(File(_selectedImage!.path))
                  : const AssetImage("assets/images/Circle.png") as ImageProvider,
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full name',
                suffixIcon: isNameValid
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.error, color: Colors.red),
              ),
              onChanged: (value) {
                setState(() {
                  isNameValid = value.length >= 6;
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  selectedColor: Color(0xff4552CB),
                  label: const Text("Male"),
                  selected: isMale,
                  onSelected: (selected) {
                    setState(() {
                      isMale = true;
                    });
                  },
                ),
                const SizedBox(width: 10),
                ChoiceChip(
                  selectedColor: Color(0xff4552CB),
                  label: const Text("Female"),
                  selected: !isMale,
                  onSelected: (value) {
                    setState(() {
                      isMale = false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                suffixIcon: isEmailValid
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.error, color: Colors.red),
              ),
              onChanged: (value) {
                setState(() {
                  isEmailValid = value.contains('@') && value.contains('.');
                });
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedCountryCode,
                  items: ["+20", "+1", "+44", "+971", "+30"]
                      .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountryCode = value!;
                    });
                  },
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'About me',
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4552CB),
                padding:
                const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
