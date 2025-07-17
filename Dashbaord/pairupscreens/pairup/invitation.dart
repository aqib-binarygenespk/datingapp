import 'package:flutter/material.dart';
import 'package:dating_app/themesfolder/theme.dart';

class InvitationDetailsScreen extends StatelessWidget {
  final Map<String, String> event;

  const InvitationDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // ✅ Sticky header
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
                    event['title'] ?? 'Event Title',
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, height: 1, color: Colors.black12),

          // ✅ Scrollable main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoBox("Invited By", event['invited'] ?? ""),
                  const SizedBox(height: 15),

                  _infoBox("Description", event['description'] ?? ""),
                  const SizedBox(height: 15),

                  _infoBox("Time And Date", event['time'] ?? ""),
                  const SizedBox(height: 15),

                  _buildLabel("The PairUp Photo"),
                  Container(
                    height: 160,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(event['image'] ?? 'assets/event1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  _buildLabel("Invited People"),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    children: const [
                      _InviteChip(name: "Mark C", image: 'assets/dp1.png'),
                      _InviteChip(name: "Sara M", image: 'assets/dp2.png'),
                      _InviteChip(name: "Dennis T", image: 'assets/dp3.png'),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ✅ Bottom Accept/Reject buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Accept",
                            style: textTheme.labelMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x29111827),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            minimumSize: const Size.fromHeight(40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Reject",
                            style: textTheme.labelMedium?.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTheme.textTheme.labelLarge?.copyWith(color: Colors.black),
    );
  }

  Widget _infoBox(String label, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: const BoxDecoration(
        color: Color(0xFFFFEFEF),
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTheme.textTheme.labelLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: AppTheme.textTheme.bodySmall?.copyWith(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _InviteChip extends StatelessWidget {
  final String name;
  final String image;

  const _InviteChip({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        name,
        style: AppTheme.textTheme.bodySmall?.copyWith(fontSize: 12),
      ),
      avatar: CircleAvatar(
        radius: 10,
        backgroundImage: AssetImage(image),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.black26),
      ),
      backgroundColor: const Color(0xFFFFEFEF),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
