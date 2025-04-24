import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Required for formatting date & time

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _invitedPeople = [];
  DateTime? _selectedDateTime; // Stores selected date and time

  void _addName(String name) {
    if (name.isNotEmpty && _invitedPeople.length < 5) {
      setState(() {
        _invitedPeople.add(name);
      });
      _nameController.clear(); // Clear input field after adding name
    }
  }

  void _removeName(String name) {
    setState(() {
      _invitedPeople.remove(name);
    });
  }

  // **Function to show date-time picker**
  Future<void> _selectDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      // Light pink background
      appBar: AppBar(

        elevation: 0,
        title: const Text(
          "Dinner At Javiers",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Location**
            const Text(
              "Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(15), // Adjusted padding
              decoration: _inputBoxDecoration(),
              child: const Text(
                "4301 La Jolla Village Dr Suite 1000, San Diego, CA 92122",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 15),

            // **Description**
            const Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: _inputBoxDecoration(),
              child: const Text(
                "Dinner at Javier's!",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 15),

            // **Time and Date - Clickable Box**
            const Text(
              "Time And Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: _selectDateTime, // Open calendar picker on tap
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: _inputBoxDecoration(),
                child: Text(
                  _selectedDateTime != null
                      ? DateFormat('MMM d, yyyy - hh:mm a').format(_selectedDateTime!)
                      : "Tap to Select a date and time",
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // **Event Image Placeholder (Just Space)**
            const Text(
              "The PairUp Photo",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              height: 160, // Space for image
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder color
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 15),

            // **Invite People**
            const Text(
              "Invite People",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: _inputBoxDecoration(),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: "Tap to add more people",
                        border: InputBorder.none,
                      ),
                      onSubmitted: _addName,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.black),
                    onPressed: () {
                      _addName(_nameController.text);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // **List of Invited People**
            Wrap(
              spacing: 10,
              children: _invitedPeople.map((name) {
                return Chip(
                  label: Text(name),
                  deleteIcon: const Icon(Icons.close, size: 16),
                  onDeleted: () => _removeName(name),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.black26),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // **Box Decoration for Input Fields**
  BoxDecoration _inputBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black26),
    );
  }
}
