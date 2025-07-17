import 'package:get/get.dart';

class CustomSearchController extends GetxController {
  var profiles = <Map<String, dynamic>>[].obs;
  var selectedProfile = {}.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfiles();
  }

  void loadProfiles() {
    profiles.value = [
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
  }

  void selectProfile(Map<String, dynamic> profile) {
    selectedProfile.value = profile;
  }
}
