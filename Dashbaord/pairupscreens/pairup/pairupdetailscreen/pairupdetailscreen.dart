import 'package:flutter/material.dart';
import 'package:dating_app/themesfolder/theme.dart';

class EventDetailsScreen extends StatefulWidget {
  final Map<String, String> event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final TextEditingController _inviteController = TextEditingController();
  final List<String> _invitedPeople = [];

  void _addInvite(String name) {
    if (name.trim().isNotEmpty &&
        !_invitedPeople.contains(name.trim()) &&
        _invitedPeople.length < 5) {
      setState(() {
        _invitedPeople.add(name.trim());
        _inviteController.clear();
      });
    }
  }

  void _removeInvite(String name) {
    setState(() {
      _invitedPeople.remove(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 🔥 Sticky header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/the_pairup_logo_black.png',
                      height: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.event['title'] ?? 'Event',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 1, height: 1, color: Colors.black12),
              ],
            ),

            // 🔥 Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _infoBox(context, "Location", widget.event['location'] ?? ""),
                    const SizedBox(height: 15),
                    _infoBox(context, "Description", widget.event['description'] ?? ""),
                    const SizedBox(height: 15),
                    _infoBox(context, "Time And Date", widget.event['time'] ?? ""),
                    const SizedBox(height: 15),

                    _buildLabel(context, "The PairUp Photo"),
                    Container(
                      height: 160,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(widget.event['image'] ?? 'assets/event1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                    _buildLabel(context, "Invite People"),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundColor, // ✅ container background
                        borderRadius: BorderRadius.circular(8), // ✅ border radius 8
                        border: Border.all(color: Colors.black26),
                      ),
                      child: TextField(
                        controller: _inviteController,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          filled: true, // ✅ enable fill color
                          fillColor: AppTheme.backgroundColor, // ✅ match AppTheme background
                          hintText: "Tap to add more people",
                          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black45),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        ),
                        onSubmitted: _addInvite,
                        onChanged: (value) {
                          if (value.endsWith(" ")) {
                            _addInvite(value);
                          }
                        },
                      ),
                    ),


                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: _invitedPeople.map((name) {
                        return Chip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage('assets/dpjohn.png'),
                                radius: 10,
                              ),
                              const SizedBox(width: 8),
                              Text(name, style: textTheme.bodySmall),
                            ],
                          ),
                          deleteIcon: const Icon(Icons.close, size: 16),
                          onDeleted: () => _removeInvite(name),
                          backgroundColor: AppTheme.backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.black26),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 10),
                    _buildLabel(context, "Suggested People"),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 138,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildSuggestedCard(context, "Sara M", "29, 5'9\"", "San Diego, CA", 'assets/dp1.png'),
                          const SizedBox(width: 6),
                          _buildSuggestedCard(context, "Dennis T", "29, 5'9\"", "San Diego, CA", 'assets/dp2.png'),
                          const SizedBox(width: 6),
                          _buildSuggestedCard(context, "Mubarak K", "29, 5'9\"", "San Diego, CA", 'assets/dp3.png'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Save",
                          style: textTheme.labelLarge?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: AppTheme.textTheme.labelLarge?.copyWith(color: Colors.black),
    );
  }

  Widget _infoBox(BuildContext context, String label, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: const Border(

          bottom: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTheme.textTheme.labelLarge?.copyWith(color: Colors.black),),
          const SizedBox(height: 8),
          Text(text, style: AppTheme.textTheme.bodySmall?.copyWith(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildSuggestedCard(BuildContext context, String name, String ageHeight, String location, String imagePath) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[200],
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: AppTheme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(ageHeight, style: AppTheme.textTheme.bodySmall?.copyWith(fontSize: 7, color: Colors.black54)),
          Text(location, style: AppTheme.textTheme.bodySmall?.copyWith(fontSize: 7, color: Colors.black54)),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              minimumSize: const Size(double.infinity, 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              textStyle: const TextStyle(fontSize: 8),
            ),
            child: const Text("Invite"),
          ),
        ],
      ),
    );
  }
}
