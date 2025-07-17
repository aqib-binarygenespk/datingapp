import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _showMore = false;
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
        title:  Text(
          'Edit Profile',
          style: AppTheme.textTheme.bodyLarge,
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // ✅ Name and Age rows with value bold and no arrow
                _buildProfileItemWithValue(context, top: "Name", value: "Mark C"),
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
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedGender,
                        isExpanded: true,
                        hint: Text(
                          "Select Gender",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                        style: Theme.of(context).textTheme.bodyLarge,
                        borderRadius: BorderRadius.circular(12),
                        items: ["Male", "Female", "Non-binary", "Other"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: Theme.of(context).textTheme.bodyLarge),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedGender = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                _buildProfileItemWithValue(context, top: "Age", value: "32"),


                _buildProfileItem(context, title: "Height", onTap: () => Navigator.pushNamed(context, '/height')),
                _buildProfileItem(context, title: "Interested In", onTap: () => Navigator.pushNamed(context, '/interestedin')),
                _buildProfileItem(context, title: "Social Connections", onTap: () => Navigator.pushNamed(context, '/social-connections')),
                _buildProfileItem(context, title: "Your PairUp City", onTap: () => Navigator.pushNamed(context, '/location')),
                _buildProfileItem(context, title: "Get to Know Me Clip", onTap: () => Navigator.pushNamed(context, '/gettoknow')),
                _buildProfileItem(context, title: "Photos", onTap: () => Navigator.pushNamed(context, '/uploadphoto')),

                if (!_showMore)
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showMore = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: Colors.black.withOpacity(0.2),
                        ),
                        child: Text(
                          "More About Me...",
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  ),

                if (_showMore) ...[
                  _buildProfileItem(context, title: "About Me", onTap: () => Navigator.pushNamed(context, '/aboutme')),
                  _buildProfileItem(context, title: "Bonding Moments", onTap: () => Navigator.pushNamed(context, '/bonding')),
                  _buildProfileItem(context, title: "Relationship Goals", onTap: () => Navigator.pushNamed(context, '/Relationshipgoal')),
                  _buildProfileItem(context, title: "Pets", onTap: () => Navigator.pushNamed(context, '/pets')),
                  _buildProfileItem(context, title: "Let's Get to Know Your Habits", onTap: () => Navigator.pushNamed(context, '/habbits')),
                  _buildProfileItem(context, title: "Love Languages", onTap: () => Navigator.pushNamed(context, '/lovelanguage')),
                  _buildProfileItem(context, title: "Attachment Style", onTap: () => Navigator.pushNamed(context, '/attachment')),
                  _buildProfileItem(context, title: "Relocate for Love", onTap: () => Navigator.pushNamed(context, '/relocate')),
                  const SizedBox(height: 10),
                ],
              ],
            ),
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          dense: true,
          visualDensity: const VisualDensity(vertical: -2),
          title: Text(
            title,
            style: AppTheme.textTheme.labelLarge?.copyWith(
              color: const Color(0xFF111827), // ✅ updated color for all except name/age
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black54),
          onTap: onTap,
        ),
        const Divider(
          thickness: 0.6,
          height: 0,
          color: Colors.black12,
        ),
      ],
    );
  }

  Widget _buildProfileItemWithValue(BuildContext context, {
    required String top,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                top,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.5,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.5,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.6,
          height: 0,
          color: Colors.black12,
        ),
      ],
    );
  }
}
