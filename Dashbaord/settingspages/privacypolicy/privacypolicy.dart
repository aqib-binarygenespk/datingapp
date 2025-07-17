import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: AppTheme.backgroundColor,
        // Adjust color to match your theme
      ),
      body:const SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'At the PairUp, your privacy is important to us. This Privacy Policy outlines how we collect, use, and safeguard your personal information when you visit our website and use our services. By using our website, you consent to the data practices described in this policy.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '1. Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We collect various types of information to provide and enhance our services, including:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '- Personal Information: When you create an account or interact with our services, we may collect information such as your name, email address, phone number, and profile information.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Usage Information: We gather information about how you access and use our website, such as your IP address, browser type, pages viewed, and time spent on the site.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Cookies and Tracking Technologies: We use cookies and similar technologies to collect information about your browsing activities to improve your experience and analyze site usage.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '2. How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We utilize the information collected for various purposes, including:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              '- To Provide Services: To create, manage, and provide you with our services, including user account management and matchmaking features.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Improvement and Personalization: To analyze usage patterns and enhance our website and services based on user preferences.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Communication: To send you updates, newsletters, marketing materials, and respond to your inquiries.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Security: To prevent fraudulent activities and protect the integrity and security of our services.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '3. Sharing Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We do not sell or rent your personal data to third parties. However, we may share your information in the following situations:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Service Providers: We may employ third-party companies and individuals to facilitate our services, perform services on our behalf, or assist us in analyzing how our services are used. They will have access to your personal information only to perform these tasks and are obligated not to disclose or use it for any other purpose.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Legal Requirements: We may disclose your personal information if required to do so by law or in response to valid requests by public authorities.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '4. Data Security',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We are committed to protecting your personal information. We use various security measures, including encryption and access controls, to safeguard your data from unauthorized access. However, no method of transmission over the Internet or method of electronic storage is 100% secure.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '5. Your Choices and Rights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You have options regarding your personal data:',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Access and Update: You can access and update your account information through your profile settings.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Marketing Communications: You can opt-out of receiving promotional emails from us by following the instructions included in each email or contacting us directly.',
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              '- Cookies: You can manage your cookie preferences through your browser settings.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '6. Third-Party Links',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Our website may contain links to third-party websites. We are not responsible for the privacy practices of these sites. We encourage you to review the privacy policies of any third-party sites you visit.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '7. Children’s Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The PairUp website is not intended for individuals under the age of 18. We do not knowingly collect personal information from children. If we become aware that we have collected personal information from a child, we will take steps to delete that information.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '8. Changes to This Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We may update this Privacy Policy from time to time. Changes will be posted on this page with an updated effective date. We encourage you to review this Privacy Policy periodically for any changes.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              '9. Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'If you have any questions, concerns, or requests regarding this Privacy Policy or our data practices, please contact us at:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            const Text(
              'Thank you for trusting The PairUp with your personal information!',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
