import 'package:dating_app/themesfolder/dropdown.dart';
import 'package:dating_app/themesfolder/textfields.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _selectedGender;

  final List<String> _genderOptions = [
    'Male',
    'Female',
    'Non-binary/Intersex',
    'Prefer not to respond'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "First Name",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    CustomTextField(
                      labelText: "First Name",
                      hintText: "Enter your first name",
                      keyboardType: TextInputType.text,
                      controller: _firstNameController,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Last Name",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    CustomTextField(
                      labelText: "Last Name",
                      hintText: "Enter your last name",
                      keyboardType: TextInputType.text,
                      controller: _lastNameController,
                    ),
                    const SizedBox(height: 16),

                    // Custom Dropdown for Gender
                    CustomDropdown(
                      label: "Gender",
                      options: _genderOptions,
                      selectedValue: _selectedGender,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                      hintText: "Select your gender",
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Age",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),

                    CustomTextField(
                      labelText: "Age",
                      hintText: "Enter your age",
                      keyboardType: TextInputType.number,
                      controller: _ageController,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // Sticky Button at Bottom
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.popAndPushNamed(context, '/height');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF111827),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text("Next", style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
