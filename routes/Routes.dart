import 'package:dating_app/Auth/welcomescreen/splashscreen.dart';
import 'package:dating_app/Dashbaord/pairupscreens/pairup/pairupdetailscreen/pairupdetailscreen.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:dating_app/Auth/Reset/Resetyourpassword.dart';
import 'package:dating_app/Auth/Reset/Setnewpassword.dart';
import 'package:dating_app/Auth/Loginwithemail/loginwithemail.dart';
import 'package:dating_app/Auth/Loginwithphone/loginwithphone.dart';
import 'package:dating_app/Auth/signupfromphone/aboutme/Aboutme.dart';
import 'package:dating_app/Auth/signupfromphone/enterpassword/EnterPassword.dart';
import 'package:dating_app/Auth/signupfromphone/personaldetails/Personaldetails.dart';
import 'package:dating_app/Auth/signupfromphone/relationshipgoal/Relationshipgoal.dart';
import 'package:dating_app/Auth/signupfromphone/signupwithphone/SignupWithphone.dart';
import 'package:dating_app/Auth/signupfromphone/Age/age.dart';
import 'package:dating_app/Auth/signupfromphone/attachment/attachment.dart';
import 'package:dating_app/Auth/signupfromphone/bondingmoments/bondingmoments.dart';
import 'package:dating_app/Auth/signupfromphone/enteryourcode/enteryourcode.dart';
import 'package:dating_app/Auth/signupfromphone/gettoknow/gettoknow.dart';
import 'package:dating_app/Auth/signupfromphone/height/height.dart';
import 'package:dating_app/Auth/signupfromphone/interestedIn/interestedIn.dart';
import 'package:dating_app/Auth/signupfromphone/location/location.dart';
import 'package:dating_app/Auth/signupfromphone/lovelanguage/lovelanguage.dart';
import 'package:dating_app/Auth/signupfromphone/pets/pets.dart';
import 'package:dating_app/Auth/signupfromphone/recordvideo/recordvideo.dart';
import 'package:dating_app/Auth/signupfromphone/relocate/relocate.dart';
import 'package:dating_app/Auth/signupfromphone/socialcirclephoto/socialcirclephoto.dart';
import 'package:dating_app/Auth/signupfromphone/uploadphotos/uploadphotos.dart';
import 'package:dating_app/Auth/signupfromphone/yourhabbits/yourhabbits.dart';
import 'package:dating_app/Auth/welcomescreen/welcomescreen.dart';
import 'package:dating_app/Dashbaord/dashboard/Dashboard.dart';
import 'package:dating_app/Dashbaord/pairupscreens/pairup/pairup.dart';

import '../Dashbaord/settingspages/socialcircle.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String loginPhone = '/loginPhone';
  static const String loginEmail = '/loginEmail';
  static const String signupPhone = '/signupPhone';
  static const String resetPassword = '/reset-password';
  static const String setNewPassword = '/setnewpassword';
  static const String enterPassword = '/EnterPassword';
  static const String profileDetails = '/ProfileDetails';
  static const String height = '/height';
  static const String interestedIn = '/interestedin';
  static const String uploadPhoto = '/uploadphoto';
  static const String socialCircle = '/socialcircle';
  static const String bonding = '/bonding';
  static const String aboutMe = '/aboutme';
  static const String relationshipGoal = '/Relationshipgoal';
  static const String pets = '/pets';
  static const String habits = '/habbits';
  static const String loveLanguage = '/lovelanguage';
  static const String attachment = '/attachment';
  static const String relocate = '/relocate';
  static const String dashboard = '/dashboard';
  static const String location = '/location';
  static const String getToKnow = '/gettoknow';
  static const String enterNumber = '/enternumber';
  static const String recordVideo = '/recordvideo';
  static const String age = '/age';
  static const String pairUp = '/pairupscreens';
  static const String eventDetails = '/EventDetailsScreen';
  static const String splashscreen = '/SplashScreen';
  static const String socialConnections = '/social-connections';


  static final List<GetPage> routes = [
    GetPage(name: splashscreen, page: ()=> SplashScreen()),
    GetPage(name: welcome, page: () => const WelcomeScreen()),
    GetPage(name: loginPhone, page: () => const VerificationCodeScreen()),
    GetPage(name: loginEmail, page: () =>  LoginWithEmailScreen()),
    GetPage(name: signupPhone, page: () => const SignUpWithPhoneScreen()),
    GetPage(name: resetPassword, page: () => const Resetyourpassword()),
    GetPage(name: setNewPassword, page: () => const SetNewPassword()),
    GetPage(name: enterPassword, page: () => const EnterPassword()),
    GetPage(name: profileDetails, page: () => const ProfileDetails()),
    GetPage(name: height, page: () => const HeightSelection()),
    GetPage(name: interestedIn, page: () => InterestedInScreen()),
    GetPage(name: uploadPhoto, page: () =>  UploadYourPhotosScreen()),
    GetPage(name: socialCircle, page: () => SocialCirclePhotoScreen()),
    GetPage(name: bonding, page: () => const BondingMomentsScreen()),
    GetPage(name: aboutMe, page: () => const AboutMeScreen()),
    GetPage(name: relationshipGoal, page: () => const Relationshipgoal()),
    GetPage(name: pets, page: () => const PetsSelectionScreen()),
    GetPage(name: habits, page: () => GetToKnowYourHabitsScreen()),
    GetPage(name: loveLanguage, page: () => const LoveLanguagesScreen()),
    GetPage(name: attachment, page: () => const AttachmentsScreen()),
    GetPage(name: relocate, page: () => const RelocateLoveScreen()),
    GetPage(name: dashboard, page: () => const DashboardScreen()),
    GetPage(name: location, page: () => PairUpLocationScreen()),
    GetPage(name: getToKnow, page: () => GetToKnowMeClipScreen()),
    GetPage(name: enterNumber, page: () => LoginWithPhoneScreen()),
    GetPage(name: recordVideo, page: () => RecordVideoScreen()),
    GetPage(name: age, page: () => AgeSelection()),
    GetPage(name: pairUp, page: () => PairUp()),
    GetPage(name: socialConnections, page: () => const SocialConnectionsScreen()),
    GetPage(name: eventDetails, page: () => EventDetailsScreen(event: {},)),
  ];
}