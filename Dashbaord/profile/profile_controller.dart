import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = "Mark C".obs;
  var ageHeight = "32, 6'1\"".obs;
  var profileImage ='assets/profilevideoimage.png'.obs; // ✅ Local image used.obs;

  var profileDetails = <Map<String, String>>[
    {'title': 'About Me', 'content': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum.'},
    {'title': 'Bonding Moments', 'content': 'Friday night in with a homemade meal, living in a downtown apartment.'},
    {'title': 'Relationship Goals', 'content': 'Looking for a long-term meaningful relationship with someone who shares similar values.'},
    {'title': 'Pets', 'content': 'I love dogs and have a Golden Retriever named Max.'},
    {'title': 'Smoking Habits', 'content': 'Non-smoker'},
    {'title': 'Drinking Habits', 'content': 'Occasional drinker'},
    {'title': 'Dietary Preferences', 'content': 'Vegetarian'},
    {'title': 'Love Languages', 'content': 'Quality Time, Acts of Service'},
    {'title': 'Attachment Style', 'content': 'Secure'},
    {'title': 'Relocate for Love', 'content': 'Yes, I am open to relocating.'},
  ].obs;

  /// Favorite toggle state
  var isFavorite = false.obs;

  /// Toggle function
  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }
}
