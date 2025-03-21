import 'package:dating_app/Auth/Reset/Resetyourpassword.dart';
import 'package:dating_app/Auth/Reset/Setnewpassword.dart';
import 'package:dating_app/Auth/loginwithemail.dart';
import 'package:dating_app/Auth/loginwithphone.dart';
import 'package:dating_app/Auth/signupfromphone/Aboutme.dart';
import 'package:dating_app/Auth/signupfromphone/EnterPassword.dart';
import 'package:dating_app/Auth/signupfromphone/Personaldetails.dart';
import 'package:dating_app/Auth/signupfromphone/Relationshipgoal.dart';
import 'package:dating_app/Auth/signupfromphone/SignupWithphone.dart';
import 'package:dating_app/Auth/signupfromphone/age.dart';
import 'package:dating_app/Auth/signupfromphone/attachment.dart';
import 'package:dating_app/Auth/signupfromphone/bondingmoments.dart';
import 'package:dating_app/Auth/signupfromphone/enteryourcode.dart';
import 'package:dating_app/Auth/signupfromphone/gettoknow.dart';
import 'package:dating_app/Auth/signupfromphone/height.dart';
import 'package:dating_app/Auth/signupfromphone/interestedIn.dart';
import 'package:dating_app/Auth/signupfromphone/location.dart';
import 'package:dating_app/Auth/signupfromphone/lovelanguage.dart';
import 'package:dating_app/Auth/signupfromphone/pets.dart';
import 'package:dating_app/Auth/signupfromphone/recordvideo.dart';
import 'package:dating_app/Auth/signupfromphone/relocate.dart';
import 'package:dating_app/Auth/signupfromphone/socialcirclephoto.dart';
import 'package:dating_app/Auth/signupfromphone/uploadphotos.dart';
import 'package:dating_app/Auth/signupfromphone/yourhabbits.dart';
import 'package:dating_app/Auth/welcomescreen/welcomescreen.dart';
import 'package:dating_app/Dashbaord/Dashboard.dart';
import 'package:dating_app/Dashbaord/pairup/pairup.dart';
import 'package:dating_app/Dashbaord/pairup/pairupdetailscreen.dart';
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      initialRoute: '/',
      routes: {
        '/': (context) =>  const WelcomeScreen( ),
        '/loginPhone': (context) => const VerificationCodeScreen(),
        '/loginEmail': (context) => const LoginWithEmailScreen(),
        '/signupPhone': (context) => const SignUpWithPhoneScreen(),
        '/reset-password': (context) => const Resetyourpassword(),
        '/setnewpassword': (context) => const SetNewPassword(),
        '/EnterPassword': (context) => const EnterPassword(),
        '/ProfileDetails': (context) => const ProfileDetails(),
        '/height': (context) => const HeightSelection(),
        '/interestedin':(context) =>  InterestedInScreen(),
        '/uploadphoto': (context) => UploadYourPhotosScreen(),
        'socialcircle' : (context) => SocialCirclePhotoScreen(),
        '/bonding': (context) => const BondingMomentsScreen(),
        '/aboutme': (context) => const AboutMeScreen(),
        '/Relationshipgoal' : (context) => const Relationshipgoal(),
        '/pets': (context) => const PetsSelectionScreen(),
        '/habbits': (context) =>  GetToKnowYourHabitsScreen(),
        '/lovelanguage' : (context) => const LoveLanguagesScreen(),
        '/attachment': (context) => const AttachmentsScreen(),
        '/relocate': (context) => const RelocateLoveScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/location' : (context) => PairUpLocationScreen(),
        '/gettoknow': (context) => GetToKnowMeClipScreen(),
        '/enternumber':( context) => LoginWithPhoneScreen(),
        '/recordvideo': (context) => RecordVideoScreen(),
        '/age': (context) => AgeSelection(),
        '/pairup': (context)=> PairUp(),
        '/EventDetailsScreen': (context) => EventDetailsScreen(),
      },
    );
  }
}
