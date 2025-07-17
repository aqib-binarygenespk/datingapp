import 'package:get/get.dart';

class BondingMomentsController extends GetxController {
  final List<List<String>> bondingOptions = [
    ['Friday night in with a homemade meal', 'Exploring restaurants and bars'],
    ['Running a marathon on a Sunday', 'Grabbing brunch with your boo'],
    ['Cozy movie marathon', 'Outdoor movie night under the stars'],
    ['Camper adventure', 'Glamping experience'],
    ['Living in a downtown apartment', 'Living in a big house in the suburbs'],
    ['On a sunny day, lounging poolside', 'On a sunny day, taking a dip in the ocean'],
    ['Cooking at home together', 'Dining out for culinary adventure'],
    ['Wine tasting tour', 'Visiting local breweries for beer tasting'],
    ['Road trip exploration', 'Relaxing in an airport lounge'],
    ['Fall asleep cuddling with a TV on', 'Fall asleep cuddling in perfect silence'],
    ['Cooking over a campfire', 'Enjoying the luxury of room service'],
    ['Live music in the open air', 'Enjoying music at home'],
    ['Canoeing over crooks', 'Crossing over canals'],
    ['Taking your dog on a play date', 'Organizing a kid play date'],
  ];

  var selectedOptions = <int, String?>{}.obs;

  void toggleSelection(int index, String option) {
    if (selectedOptions[index] == option) {
      selectedOptions[index] = null;
    } else {
      selectedOptions[index] = option;
    }
  }
}
