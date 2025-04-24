import 'package:flutter/material.dart';

class AttachmentsScreen extends StatefulWidget {
  const AttachmentsScreen({Key? key}) : super(key: key);

  @override
  _AttachmentsScreenState createState() => _AttachmentsScreenState();
}

class _AttachmentsScreenState extends State<AttachmentsScreen> {
  final List<String> attachments = [
    'Secure',
    'Anxious',
    'avoidant',
    'Disorganized',
  ];

  List<String> selectedAttachments = [];

  void _onAttachmentSelected(String attachment) {
    setState(() {
      if (selectedAttachments.contains(attachment)) {
        selectedAttachments.remove(attachment);
      } else {
        if (selectedAttachments.length < 1) {
          selectedAttachments.add(attachment);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Attachments',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Select one type of attachment you prefer to share. This helps in managing shared content better.",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 24),
            Column(
              children: attachments.map((attachment) {
                bool isSelected = selectedAttachments.contains(attachment);
                return GestureDetector(
                  onTap: () => _onAttachmentSelected(attachment),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.black : Colors.grey,
                              width: 2,
                            ),
                            color: isSelected ? Colors.black : Colors.grey[200],
                          ),
                          child: isSelected
                              ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                              : null,
                        ),
                        Text(
                          attachment,
                          style: TextStyle(
                            color: isSelected ? Colors.black87 : Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: selectedAttachments.isNotEmpty
                    ? () {
                  // Handle next button press
                  Navigator.pushNamed(context, '/relocate');
                  print("Selected attachments: $selectedAttachments");
                }
                    : null,
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
