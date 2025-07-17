import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../dashboard/Dashboard.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Map<String, dynamic> appliedFilters = {
    'location': null,
    'searchingFor': null,
    'ageRange': null,
    'heightRange': null,
    'distanceRange': null,
  };

  String selectedSearch = 'Dating';
  String selectedLocation = 'San Diego';

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
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 15, 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/the_pairup_logo_black.png',
              height: 70,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (appliedFilters['searchingFor'] != null)
                    _buildFilterChip(appliedFilters['searchingFor']),
                  if (appliedFilters['location'] != null)
                    _buildFilterChip(appliedFilters['location']),
                  if (appliedFilters['ageRange'] != null)
                    _buildFilterChip(appliedFilters['ageRange']),
                  if (appliedFilters['heightRange'] != null)
                    _buildFilterChip(appliedFilters['heightRange']),
                  if (appliedFilters['distanceRange'] != null)
                    _buildFilterChip(appliedFilters['distanceRange']),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return GestureDetector(
                  onTap: () {
                    (context.findAncestorStateOfType<DashboardScreenState>())
                        ?.updateSearchScreen(
                      DetailProfileScreen(profile: profile),
                    );
                  },
                  child: ProfileCard(profile: profile),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String value) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
        color: AppTheme.backgroundColor,
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    double _startAge = 18;
    double _endAge = 70;
    double _startHeight = 4.0;
    double _endHeight = 6.10;
    double _startDistance = 10;
    double _endDistance = 500;

    bool showAgeSlider = false;
    bool showHeightSlider = false;
    bool showDistanceSlider = false;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Filter", style: AppTheme.textTheme.bodyLarge),
                          const SizedBox(height: 20),

                          _buildDropdownField(
                            context,
                            "Searching For",
                            selectedSearch,
                            ["Dating", "Social Circle"],
                                (val) => setModalState(() => selectedSearch = val),
                          ),
                          const SizedBox(height: 16),

                          _buildLocationAutocomplete(
                            label: "Location",
                            selectedValue: selectedLocation,
                            onSelected: (val) => setModalState(() => selectedLocation = val),
                            context: context,
                          ),

                          const SizedBox(height: 16),

                          // Age Range
                          Text("Age Range", style: AppTheme.textTheme.labelLarge?.copyWith(
                            color: Colors.black, // ✅ set color to black
                          ),),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.backgroundColor,
                              borderRadius: BorderRadius.circular(8), // ✅ radius 8
                              border: Border.all(
                                color: const Color(0x66B8B8B8), // ✅ border color #B8B8B866
                              ), // ✅ updated border color
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () => setModalState(() => showAgeSlider = !showAgeSlider),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "$_startAge - $_endAge",
                                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                                      color: const Color(0x80111827), // ✅ updated text color
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                                ],
                              ),
                            ),
                          ),

                          if (showAgeSlider)
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 1.0,
                                activeTrackColor: Colors.black,
                                inactiveTrackColor: Colors.black26,
                                thumbColor: Colors.black,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                                overlayShape: SliderComponentShape.noOverlay,
                                tickMarkShape: SliderTickMarkShape.noTickMark,
                                trackShape: const RectangularSliderTrackShape(),
                              ),
                              child: RangeSlider(
                                values: RangeValues(_startAge, _endAge),
                                min: 18,
                                max: 70,
                                divisions: 52,
                                labels: RangeLabels('${_startAge.round()}', '${_endAge.round()}'),
                                onChanged: (values) => setModalState(() {
                                  _startAge = values.start;
                                  _endAge = values.end;
                                }),
                              ),
                            ),
                          const SizedBox(height: 16),

                          // Height
                          Text("Height", style: AppTheme.textTheme.labelLarge?.copyWith(
                            color: Colors.black, // ✅ set color to black
                          ),),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.backgroundColor,
                              borderRadius: BorderRadius.circular(8), // ✅ radius 8
                              border: Border.all(
                                color: const Color(0x66B8B8B8), // ✅ border color #B8B8B866
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () => setModalState(() => showHeightSlider = !showHeightSlider),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${_startHeight.toStringAsFixed(1)}' - ${_endHeight.toStringAsFixed(1)}'",
                                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                                      color: const Color(0x80111827),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                                ],
                              ),
                            ),
                          ),

                          if (showHeightSlider)
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 1.0,
                                activeTrackColor: Colors.black,
                                inactiveTrackColor: Colors.black26,
                                thumbColor: Colors.black,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                                overlayShape: SliderComponentShape.noOverlay,
                                tickMarkShape: SliderTickMarkShape.noTickMark,
                                trackShape: const RectangularSliderTrackShape(),
                              ),
                              child: RangeSlider(
                                values: RangeValues(_startHeight, _endHeight),
                                min: 4.0,
                                max: 6.10,
                                divisions: 25,
                                labels: RangeLabels(
                                  "${_startHeight.toStringAsFixed(1)}'",
                                  "${_endHeight.toStringAsFixed(1)}'",
                                ),
                                onChanged: (values) => setModalState(() {
                                  _startHeight = values.start;
                                  _endHeight = values.end;
                                }),
                              ),
                            ),
                          const SizedBox(height: 16),

                          // Distance
                          Text("Distance",style: AppTheme.textTheme.labelLarge?.copyWith(
                            color: Colors.black, // ✅ set color to black
                          ),),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.backgroundColor,
                              borderRadius: BorderRadius.circular(8), // ✅ radius 8
                              border: Border.all(
                                color: const Color(0x66B8B8B8), // ✅ border color #B8B8B866
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                alignment: Alignment.centerLeft,
                              ),
                              onPressed: () => setModalState(() => showDistanceSlider = !showDistanceSlider),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${_startDistance.round()} - ${_endDistance.round()} Miles",
                                    style: AppTheme.textTheme.bodyMedium?.copyWith(
                                      color: const Color(0x80111827),
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                                ],
                              ),
                            ),
                          ),

                          if (showDistanceSlider)
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 1.0,
                                activeTrackColor: Colors.black,
                                inactiveTrackColor: Colors.black26,
                                thumbColor: Colors.black,
                                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
                                overlayShape: SliderComponentShape.noOverlay,
                                tickMarkShape: SliderTickMarkShape.noTickMark,
                                trackShape: const RectangularSliderTrackShape(),
                              ),
                              child: RangeSlider(
                                values: RangeValues(_startDistance, _endDistance),
                                min: 10,
                                max: 500,
                                divisions: 49,
                                labels: RangeLabels(
                                  '${_startDistance.round()} Miles',
                                  '${_endDistance.round()} Miles',
                                ),
                                onChanged: (values) => setModalState(() {
                                  _startDistance = values.start;
                                  _endDistance = values.end;
                                }),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // Apply Button
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          appliedFilters['location'] = selectedLocation;
                          appliedFilters['searchingFor'] = selectedSearch;
                          appliedFilters['ageRange'] = '$_startAge - $_endAge';
                          appliedFilters['heightRange'] =
                          "${_startHeight.toStringAsFixed(1)}' - ${_endHeight.toStringAsFixed(1)}'";
                          appliedFilters['distanceRange'] =
                          '${_startDistance.round()} - ${_endDistance.round()} Miles';
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(
                        "Apply Filter",
                        style: AppTheme.textTheme.labelLarge?.copyWith(
                          color: AppTheme.backgroundColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  Widget _buildDropdownField(
      BuildContext context,
      String label,
      String selectedValue,
      List<String> options,
      void Function(String) onSelected,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ✅ Heading uses bodyLarge
        Text(
          label,
          style: AppTheme.textTheme.labelLarge?.copyWith(
            color: Colors.black, // ✅ set color to black
          ),
        ),

        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor, // ✅ uses app background
            borderRadius: BorderRadius.circular(8), // ✅ radius 8
            border: Border.all(
              color: const Color(0x66B8B8B8), // ✅ border color #B8B8B866
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
              iconSize: 24,
              isExpanded: true,
              borderRadius: BorderRadius.circular(8),
              dropdownColor: AppTheme.backgroundColor,
              onChanged: (String? newValue) {
                if (newValue != null) onSelected(newValue);
              },
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    color: value == selectedValue
                        ? AppTheme.backgroundColor
                        : Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      value,
                      style: AppTheme.textTheme.bodyMedium?.copyWith(
                        color: const Color(0x80111827), // ✅ font color #11182780
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLocationAutocomplete({
    required String label,
    required String selectedValue,
    required void Function(String) onSelected,
    required BuildContext context,
  }) {
    final List<String> locations = [
      "San Diego",
      "New York",
      "Los Angeles",
      "Chicago",
      "Houston",
      "Miami",
      "Seattle",
      "Boston"
    ];

    final TextEditingController _locationController = TextEditingController(text: selectedValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.textTheme.labelLarge?.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0x66B8B8B8)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') return const Iterable<String>.empty();
              return locations.where((String option) =>
                  option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
            },
            onSelected: (String selection) {
              _locationController.text = selection;
              onSelected(selection);
            },
            fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
              return TextFormField(
                controller: controller,
                focusNode: focusNode,
                onFieldSubmitted: (value) {
                  onFieldSubmitted();
                  onSelected(value);
                },
                style: AppTheme.textTheme.bodyMedium?.copyWith(
                  color: const Color(0x80111827),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppTheme.backgroundColor, // ✅ Match the app background
                  hintText: 'Enter or select a city',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                ),
              );
            },
            optionsViewBuilder: (context, onSelected, options) {
              return Material(
                color: AppTheme.backgroundColor,
                elevation: 4.0,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: options.map((String option) {
                    return ListTile(
                      title: Text(
                        option,
                        style: AppTheme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                      onTap: () => onSelected(option),
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }



}



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
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC9C9C9),
          width: 1,
        ),
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/profilevideoimage.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 130,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        backgroundColor: Colors.transparent,
                        insetPadding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  'assets/dpjohn.png',
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height * 0.6,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: const Icon(Icons.close, color: Colors.white, size: 28),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/dpjohn.png'),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.black : Colors.grey,
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
            style: AppTheme.textTheme.bodyLarge,
          ),

          // Age & Height
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.profile['age']}",
                style: AppTheme.textTheme.bodySmall,
              ),
              const SizedBox(width: 4),
              Container(
                width: 1,
                height: 14,
                color: Colors.black54,
              ),
              const SizedBox(width: 4),
              Text(
                widget.profile['height'] ?? 'N/A',
                style: AppTheme.textTheme.bodySmall,
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

          // Show All Button
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showAll = !_showAll;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.backgroundColor,
              minimumSize: const Size(90, 30),
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              _showAll ? "Show Less" : "Show All",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
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
                    height: 40,
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
          style: AppTheme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 4),
        Text(
          value ?? 'N/A',
          style: AppTheme.textTheme.bodySmall,
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
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isFavorite = false;

  final List<String> imagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
    'assets/image5.png',
    'assets/image6.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Column(
        children: [
          // ✅ PairUp logo at the top
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/the_pairup_logo_black.png',
                height: 80,
              ),
            ),
          ),

          // ✅ Social icons row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Dating Profile',
                    style: AppTheme.textTheme.bodyLarge,
                  ),
                ),
                Image.asset(
                  'assets/facebooklogo.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/instalogo.png',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.black : Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const Divider(thickness: 1, height: 1, color: Colors.black12),

          // ✅ Main profile content
          Expanded(
            child: Scrollbar(
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
                          return GestureDetector(
                            onTap: () => showFullScreenImage(imagePaths[index]),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                image: DecorationImage(
                                  image: AssetImage(imagePaths[index]),
                                  fit: BoxFit.cover,
                                ),
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
                      style: AppTheme.textTheme.bodyLarge,
                    ),
                    Text(
                      '${widget.profile['age']} years old • ${widget.profile['distance']} mi',
                      style: AppTheme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),

                    // Profile details with grey dividers
                    buildProfileDetail(context, 'About Me', widget.profile['about']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Bonding Moments', widget.profile['bondingMoments']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Relationship Goals', widget.profile['relationshipGoals']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Pets', widget.profile['pets']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Smoking Habits', widget.profile['smokingHabits']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Drinking Habits', widget.profile['drinkingHabits']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Dietary Preferences', widget.profile['dietaryPreferences']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Love Languages', widget.profile['loveLanguages']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Attachment Style', widget.profile['attachmentStyle']),
                    const Divider(color: Colors.grey, thickness: 0.5),
                    buildProfileDetail(context, 'Relocate for Love', widget.profile['relocateForLove']),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showFullScreenImage(String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: const EdgeInsets.symmetric(horizontal: 36, vertical: 80),
          child: Stack(
            children: [
              Center(
                child: InteractiveViewer(
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 30,
                right: 20,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.close, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Helper widget for profile sections with title and content
  Widget buildProfileDetail(BuildContext context, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.bodyMedium, // ✅ Title uses bodyMedium
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: AppTheme.textTheme.bodySmall, // ✅ Content uses bodySmall
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

