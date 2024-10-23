import 'package:flutter/material.dart';
import 'package:petcareapp/auth/presentaion/manger/auth_provider.dart';
import 'package:petcareapp/auth/presentaion/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static const String routename = "sign";
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isNameValid = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Top background
                Container(
                  height: 250,
                  width: double.infinity,
                  color: const Color(0xff4552CB),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 40, top: 70),
                    child: Text(
                      'Registration',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Form fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Full name field
                            TextFormField(
                              controller: provider.namecont,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                if (value.length < 6) {
                                  return 'Please enter your full name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),

                            // Email field
                            TextFormField(
                              controller: provider.emailcont,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                suffixIcon: isEmailValid
                                    ? const Icon(Icons.check_circle, color: Colors.green)
                                    : const Icon(Icons.error, color: Colors.red),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  isEmailValid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),

                            // Password field
                            TextFormField(
                              controller: provider.passwordcont,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: isPasswordValid
                                    ? const Icon(Icons.check_circle, color: Colors.green)
                                    : const Icon(Icons.error, color: Colors.red),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  isPasswordValid = value.length >= 6;
                                });
                              },
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),

                            // Terms and conditions
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (value) {}),
                                const Text('I agree with the '),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'rules',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                const Expanded(
                                    child: Text('I do not want to receive newsletter')),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Sign Up button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Handle sign up
                                }
                              },
                              child: const Text('Sign Up'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Social icons and login option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.facebook, color: Colors.blue, size: 40),
                    SizedBox(width: 20),
                    Icon(Icons.g_mobiledata, color: Colors.red, size: 40),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.routename);
                      },
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
