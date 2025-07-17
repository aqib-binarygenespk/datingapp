import 'package:dating_app/Dashbaord/pairupscreens/addevent/addevent.dart';
import 'package:dating_app/Dashbaord/pairupscreens/pairup/invitation.dart';
import 'package:dating_app/Dashbaord/pairupscreens/pairup/pairupdetailscreen/pairupdetailscreen.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import '../../dashboard/Dashboard.dart';

class PairUp extends StatefulWidget {
  const PairUp({super.key});

  @override
  State<PairUp> createState() => _PairUpState();
}

class _PairUpState extends State<PairUp> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> events = [
    {
      'image': 'assets/event1.png',
      'title': "Dinner at Javier's",
      'time': "5PM, OCT 1st, 2024",
      'location': "San Diego, CA",
      'description': "An evening of fine dining and social connection.",
    },
    {
      'image': 'assets/event2.png',
      'title': "Sunset Beach Picnic",
      'time': "6PM, OCT 10th, 2024",
      'location': "Santa Monica, CA",
      'description': "Join us for a cozy beachside gathering.",
    },
    {
      'image': 'assets/event3.png',
      'title': "Trivia Night",
      'time': "8PM, OCT 15th, 2024",
      'location': "The Brainy Bar, LA",
      'description': "Team up and win exciting prizes!",
    },
  ];

  final List<Map<String, String>> invitations = [
    {
      'image': 'assets/event3.png',
      'title': "New Year's Eve Party",
      'time': "11PM, DEC 31st, 2024",
      'invited': "invited from aqib",
      'description': "Celebrate the new year with style!",
    },
    {
      'image': 'assets/event1.png',
      'title': "Fireworks Night",
      'time': "9PM, JUL 4th, 2024",
      'invited': "invited from ali",
      'description': "Experience the best fireworks in town.",
    },
    {
      'image': 'assets/event2.png',
      'title': "Fireworks Night",
      'time': "9PM, JUL 4th, 2024",
      'invited': "invited from hassan",
      'description': "Experience the best fireworks in town.",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/the_pairup_logo_black.png', // ✅ update this path per your assets folder structure
          height: 80, // adjust height as needed for your design
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          indicatorColor: Colors.black,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'My Events'),
            Tab(text: 'Invitations'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _buildEventsList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _buildInvitationsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return _buildEventCard(events[index]);
            },
          ),
        ),
        _buildCreateEventBar()
      ],
    );
  }

  Widget _buildInvitationsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 30),
        itemCount: invitations.length,
        itemBuilder: (context, index) {
          return _buildInvitationCard(invitations[index]);
        },
      ),
    );
  }

  Widget _buildEventCard(Map<String, String> event) {
    return GestureDetector(
      onTap: () {
        // Navigate to EventDetailsScreen similar to invitation example
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(
              selectedIndex: 2, // Adjust based on your tabs index logic
              detailScreen: EventDetailsScreen(event: event),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black12, width: 0.5),
                bottom: BorderSide(color: Colors.black12, width: 0.5),
              ),
              color: Color(0xFFFFEFEF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      event['image'] ?? '',
                      height: 75,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    height: 60,
                    width: 1,
                    color: Colors.black12,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['title'] ?? '',
                          style: AppTheme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(event['time'] ?? '', style: AppTheme.textTheme.titleSmall,
                        ),
                        Text(event['location'] ?? '', style: AppTheme.textTheme.titleMedium,),
                        Text(event['description'] ?? '', style: AppTheme.textTheme.titleMedium,),
                      ],
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.more_vert, color: Colors.black),
                    onPressed: () {
                      // your three dots action here
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildInvitationCard(Map<String, String> invitation) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        // Navigate to the InvitationDetailsScreen within the DashboardScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(
              selectedIndex: 2, // Set the selected index to 2 (Profile or another tab)
              detailScreen: InvitationDetailsScreen(
                event: invitation, // Pass the invitation details to the next screen
              ),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black12, width: 0.5),
                bottom: BorderSide(
                    color: Colors.black12, width: 0.5),
              ),
              color: Color(0xFFFFEFEF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          invitation['image'] ?? '',
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        height: 95,
                        width: 1,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          invitation['title'] ?? '',
                          style: AppTheme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          invitation['time'] ?? '',
                          style: AppTheme.textTheme.titleSmall,
                        ),
                        Text(
                          invitation['invited'] ?? '',
                          style:AppTheme.textTheme.titleMedium,
                        ),

                        const SizedBox(height: 4),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Accept action here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                minimumSize: const Size(70, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "Accept",
                                style: textTheme.labelSmall?.copyWith(
                                  color: AppTheme.backgroundColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                // Reject action here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0x29111827),
                                foregroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                minimumSize: const Size(70, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                "Reject",
                                style: textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateEventBar() {
    final textTheme = Theme.of(context).textTheme;

    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        height: 47.5, // Adjusted height for a balanced appearance
        padding: const EdgeInsets.symmetric(horizontal: 11), // Increased horizontal padding
        decoration: BoxDecoration(
          color: const Color(0xFFFFEFEF),
          borderRadius: BorderRadius.circular(30), // More rounded corners for a modern look
          border: Border.all(color: Colors.black26),
        ),
        child: Row(
          children: [
            const Icon(Icons.search_sharp, color: Colors.black),
            const SizedBox(width: 10), // Increased space between icon and text field
            Expanded(
              child: TextField(
                style: textTheme.bodyMedium?.copyWith(fontSize: 14), // Adjusted font size for better readability
                decoration: InputDecoration(
                  hintText: "Create Your Own PairUp Event",
                  hintStyle: textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                    fontSize: 12, // Slightly increased font size for hint text
                  ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: const Color(0xFFFFEFEF),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8), // Balanced vertical padding
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(
                      selectedIndex: 2,
                      detailScreen: AddEventScreen(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}