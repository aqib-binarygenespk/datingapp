import 'package:dating_app/Dashbaord/pairupscreens/addevent/addevent.dart';
import 'package:dating_app/Dashbaord/pairupscreens/pairup/pairupdetailscreen/pairupdetailscreen.dart';
import 'package:dating_app/Dashbaord/dashboard/dashboard.dart'; // Import DashboardScreen
import 'package:get/get.dart';

class PairUpController extends GetxController {
  var searchQuery = ''.obs;

  // Static list of sample events
  var events = [
    {
      'title': "Dinner at Javier's",
      'time': "5PM, OCT 1st, 2024",
      'location': "San Diego, CA",
      'description': "Description of the event will go here"
    },
  ].obs;

  // Update search input
  void updateSearch(String query) {
    searchQuery.value = query;
  }

  // Navigate to Event Details screen inside Dashboard
  void onEventTap() {
    Get.to(() => DashboardScreen(
      selectedIndex: 2, // PairUp tab
      detailScreen: const EventDetailsScreen(event: {},),
    ));
  }

  // Navigate to Add Event screen inside Dashboard
  void onAddEventTap() {
    Get.to(() => DashboardScreen(
      selectedIndex: 2, // PairUp tab
      detailScreen: const AddEventScreen(),
    ));
  }
}
