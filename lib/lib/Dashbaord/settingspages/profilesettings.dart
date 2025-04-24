import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _showMore = false;
  bool _showNameField = false;
  bool _showGenderDropdown = false;
  String? _selectedGender;
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Scrollbar(
        thickness: 8.0,
        radius: const Radius.circular(10.0),
        thumbVisibility: true,
        interactive: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _buildProfileItem(
                context,
                title: "Name",
                onTap: () {
                  setState(() {
                    _showNameField = !_showNameField;
                  });
                },
              ),
              if (_showNameField) ...[
                DropdownButton<String>(
                  value: _nameController.text.isEmpty ? null : _nameController.text,
                  hint: const Text("Select a Name"),
                  items: ["John", "Jane", "Emily", "Michael"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _nameController.text = newValue ?? "";
                    });
                  },
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter a New Name",
                    border: OutlineInputBorder(
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              _buildProfileItem(
                context,
                title: "Your Gender",
                onTap: () {
                  setState(() {
                    _showGenderDropdown = !_showGenderDropdown;
                  });
                },
              ),
              if (_showGenderDropdown)
                DropdownButton<String>(
                  value: _selectedGender,
                  hint: const Text("Select Gender"),
                  items: ["Male", "Female", "Non-binary", "Other"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                ),
              _buildProfileItem(
                context,
                title: "Age",
                onTap: () {
                  Navigator.pushNamed(context, '/age');
                  // Navigate to Age editing screen
                },
              ),
              _buildProfileItem(
                context,
                title: "Height",
                onTap: () {
                  Navigator.pushNamed(context, '/height');
                  // Navigate to Height selection screen
                },
              ),
              _buildProfileItem(
                context,
                title: "Interested In",
                onTap: () {
                  // Navigate to Interests selection screen
                },
              ),
              _buildProfileItem(
                context,
                title: "Social Connections",
                onTap: () {
                  // Navigate to Social Connections screen
                },
              ),
              _buildProfileItem(
                context,
                title: "Your PairUp City",
                onTap: () {
                  // Navigate to City selection screen
                },
              ),
              _buildProfileItem(
                context,
                title: "Get to Know Me Clip",
                onTap: () {
                  // Navigate to video or clip editing screen
                },
              ),
              _buildProfileItem(
                context,
                title: "Photos",
                onTap: () {
                  // Navigate to Photos editing screen
                },
              ),
              const SizedBox(height: 16),
              // "More About Me" button
              if (!_showMore)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showMore = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "More About Me...",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              if (_showMore) ...[
                _buildProfileItem(
                  context,
                  title: "About Me",
                  onTap: () {
                    // Navigate to About Me editing screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Bonding Moments",
                  onTap: () {
                    // Navigate to Bonding Moments screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Relationship Goals",
                  onTap: () {
                    // Navigate to Relationship Goals screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Pets",
                  onTap: () {
                    // Navigate to Pets screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Let's Get to Know Your Habits",
                  onTap: () {
                    // Navigate to Habits screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Love Languages",
                  onTap: () {
                    // Navigate to Love Languages screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Attachment Style",
                  onTap: () {
                    // Navigate to Attachment Style screen
                  },
                ),
                _buildProfileItem(
                  context,
                  title: "Relocate for Love",
                  onTap: () {
                    // Navigate to Relocation preferences screen
                  },
                ),
                const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 8.0, vertical: 0.0), // Reduced vertical padding
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
              Icons.arrow_forward_ios, size: 15, color: Colors.black54),
          onTap: onTap,
        ),
        const Divider(
          thickness: 0.8,
          color: Colors.black12,
        ),
      ],
    );
  }
}
