import 'package:dating_app/Dashbaord/Dashboard.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> profiles = [
    {
      'name': 'John Doe',
      'age': 28,
      'distance': '3.5',
      'location': 'New York, USA',
      'position': 'Software Engineer',
      'description': 'I enjoy hiking, coding, and exploring new coffee shops.',
      'image': 'assets/images/john.jpg',
      'about': 'Tech enthusiast with a passion for building things that matter.',
      'bondingMoments': 'Sunset walks, cooking together, and road trips.',
      'relationshipGoals': 'Looking for something meaningful and long-lasting.',
      'pets': 'Dog lover, I have a golden retriever named Max.',
      'smokingHabits': 'Non-smoker',
      'drinkingHabits': 'Social drinker',
      'dietaryPreferences': 'Vegetarian',
      'loveLanguages': 'Quality Time, Acts of Service',
      'attachmentStyle': 'Secure',
      'relocateForLove': 'Open to relocating',
    },
    {
      'name': 'Emily Smith',
      'age': 25,
      'distance': '2.0',
      'location': 'Los Angeles, USA',
      'position': 'Graphic Designer',
      'description': 'Creative soul who loves art and adventure.',
      'image': 'assets/images/profileimage.png',
      'about': 'Always looking for beauty in the world around me.',
      'bondingMoments': 'Gallery hopping, beach bonfires, and DIY projects.',
      'relationshipGoals': 'Seeking a partner to grow and explore life with.',
      'pets': 'Cat lover, I have a tabby named Luna.',
      'smokingHabits': 'Non-smoker',
      'drinkingHabits': 'Occasional drinker',
      'dietaryPreferences': 'Non-vegetarian',
      'loveLanguages': 'Words of Affirmation, Physical Touch',
      'attachmentStyle': 'Anxious',
      'relocateForLove': 'Yes',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'The PairUp',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return GestureDetector(
            onTap: () {
              (context.findAncestorStateOfType<DashboardScreenState>())?.updateSearchScreen(
                DetailProfileScreen(profile: profile),
              );
            },
            child: ProfileCard(profile: profile),
          );
        },
      ),
      
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    double _startAge = 18;
    double _endAge = 70;
    double _startHeight = 4.0; // Representing 4 feet
    double _endHeight = 6.10; // Representing 6 feet 10 inches
    double _startDistance = 10;
    double _endDistance = 500;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.pink[50],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Scrollbar(
            thickness: 8.0,
            radius: const Radius.circular(8.0),
            thumbVisibility: true,
            interactive: true,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildDropdownField("Searching For", ["Dating", "Friendship", "Networking"]),
                      const SizedBox(height: 16),
                      _buildDropdownField("Location", ["San Diego", "New York", "Los Angeles"]),
                      const SizedBox(height: 16),

                      // Age Range Slider
                      const Text(
                        "Age Range",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      RangeSlider(
                        values: RangeValues(_startAge, _endAge),
                        min: 18,
                        max: 70,
                        divisions: 52,
                        labels: RangeLabels('${_startAge.round()}', '${_endAge.round()}'),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _startAge = values.start;
                            _endAge = values.end;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('$_startAge', style: const TextStyle(fontSize: 14)),
                          Text('$_endAge', style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Height Slider
                      const Text(
                        "Height",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      RangeSlider(
                        values: RangeValues(_startHeight, _endHeight),
                        min: 4.0,
                        max: 6.10,
                        divisions: 25,
                        labels: RangeLabels(
                          "${_startHeight.toStringAsFixed(1)}'",
                          "${_endHeight.toStringAsFixed(1)}'",
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _startHeight = values.start;
                            _endHeight = values.end;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${_startHeight.toStringAsFixed(1)}'", style: const TextStyle(fontSize: 14)),
                          Text("${_endHeight.toStringAsFixed(1)}'", style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Distance Slider
                      const Text(
                        "Distance",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      RangeSlider(
                        values: RangeValues(_startDistance, _endDistance),
                        min: 10,
                        max: 500,
                        divisions: 49,
                        labels: RangeLabels('${_startDistance.round()} Miles', '${_endDistance.round()} Miles'),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _startDistance = values.start;
                            _endDistance = values.end;
                          });
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_startDistance.round()} Miles', style: const TextStyle(fontSize: 14)),
                          Text('${_endDistance.round()} Miles', style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Apply Filter Button
                      ElevatedButton(
                        onPressed: () {
                          // Apply filter logic
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          "Apply Filter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdownField(String label, List<String> options) {
    String? selectedValue;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          value: selectedValue,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (value) {
            selectedValue = value;
          },
        ),
      ],
    );
  }}


class ProfileCard extends StatefulWidget {
  final Map<String, dynamic> profile;

  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _showAll = false;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Container(
                  width: double.infinity,
                  height: 180,
                  color: Colors.grey[300], // Placeholder for image
                ),
              ),
              Positioned(
                top: 130,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[400], // Placeholder for profile image
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.white : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),

          // Name
          Text(
            widget.profile['name'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          // Age & Height Alignment Fix
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.profile['age']}",
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(width: 4),
              Container(
                width: 1,
                height: 14,
                color: Colors.black54, // Thin vertical divider
              ),
              const SizedBox(width: 4),
              Text(
                widget.profile['height'] ?? 'N/A',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Details Grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: _buildDetailsGrid(),
            ),
          ),

          const SizedBox(height: 10),

          // "Show All" Button
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showAll = !_showAll;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(90, 30), // Smaller button
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              _showAll ? "Show Less" : "Show All",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12, // Smaller text size
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  List<Widget> _buildDetailsGrid() {
    final details = _showAll ? _buildAllTags() : _buildLimitedTags();
    return [
      Column(
        children: [
          for (int i = 0; i < details.length; i += 2)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: details[i],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40, // Center line height
                    color: Colors.grey[700],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: i + 1 < details.length ? details[i + 1] : Container(),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    ];
  }

  List<Widget> _buildLimitedTags() {
    return [
      _buildTag("About Me", widget.profile['about']),
      _buildTag("Bonding Moments", widget.profile['bondingMoments']),
      _buildTag("Pets", widget.profile['pets']),
      _buildTag("Smoking Habits", widget.profile['smokingHabits']),
    ];
  }

  List<Widget> _buildAllTags() {
    return [
      _buildTag("About Me", widget.profile['about']),
      _buildTag("Bonding Moments", widget.profile['bondingMoments']),
      _buildTag("Pets", widget.profile['pets']),
      _buildTag("Smoking Habits", widget.profile['smokingHabits']),
      _buildTag("Drinking Habits", widget.profile['drinkingHabits']),
      _buildTag("Dietary Preferences", widget.profile['dietaryPreferences']),
      _buildTag("Love Languages", widget.profile['loveLanguages']),
      _buildTag("Attachment Style", widget.profile['attachmentStyle']),
      _buildTag("Relocate for Love", widget.profile['relocateForLove']),
    ];
  }

  Widget _buildTag(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          value ?? 'N/A',
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}


class DetailProfileScreen extends StatefulWidget {
  final Map<String, dynamic> profile;

  const DetailProfileScreen({Key? key, required this.profile}) : super(key: key);

  @override
  State<DetailProfileScreen> createState() => _DetailProfileScreenState();
}

class _DetailProfileScreenState extends State<DetailProfileScreen> {
  final ScrollController _scrollController = ScrollController();
  final PageController _pageController = PageController(); // For image scrolling
  int _currentPage = 0; // Current image index

  final List<String> imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
  ]; // Replace with your image paths

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Dating Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        thickness: 8.0,
        radius: const Radius.circular(8.0),
        thumbVisibility: true,
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable images with dots
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(imagePaths.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 10,
                      width: _currentPage == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 16),

              // Name and details
              Text(
                widget.profile['name']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.profile['age']} years old • ${widget.profile['distance']} mi',
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              const SizedBox(height: 16),

              // Profile details with grey dividers
              buildProfileDetail('About Me', widget.profile['about']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Bonding Moments', widget.profile['bondingMoments']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Relationship Goals', widget.profile['relationshipGoals']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Pets', widget.profile['pets']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Smoking Habits', widget.profile['smokingHabits']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Drinking Habits', widget.profile['drinkingHabits']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Dietary Preferences', widget.profile['dietaryPreferences']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Love Languages', widget.profile['loveLanguages']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Attachment Style', widget.profile['attachmentStyle']),
              const Divider(color: Colors.grey, thickness: 0.5),
              buildProfileDetail('Relocate for Love', widget.profile['relocateForLove']),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for profile sections with title and content
  Widget buildProfileDetail(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Properly dispose of the scroll controller
    super.dispose();
  }
}

  Widget buildProfileDetail(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
