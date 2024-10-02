import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Last Updated: 10-10-24',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our services, including our mobile application, website, and any related services (collectively, the "Services"). By using our Services, you consent to the data practices described in this policy.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '1. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may collect the following types of information:\n\n'
                  '- Personal Information: Information that identifies you personally, such as your name, email address, and phone number.\n'
                  '- Usage Data: Information about how you use our Services, including your IP address, browser type, pages visited, and the time and date of your visits.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '2. How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may use the information we collect for various purposes, including:\n\n'
                  '- To provide, maintain, and improve our Services.\n'
                  '- To communicate with you about your account or transactions.\n'
                  '- To send you promotional messages and updates.\n'
                  '- To monitor the usage of our Services.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '3. Disclosure of Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may share your information in the following situations:\n\n'
                  '- With service providers who perform services on our behalf.\n'
                  '- With your consent or at your direction.\n'
                  '- To comply with legal obligations, respond to subpoenas, or protect the rights, property, or safety of [Your App Name], our users, or others.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '4. Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We take reasonable measures to help protect personal information from loss, theft, misuse, and unauthorized access, disclosure, alteration, and destruction. However, no method of transmission over the Internet or method of electronic storage is 100% secure.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '5. Your Rights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You may have the following rights regarding your personal information:\n\n'
                  '- The right to access, update, or delete the information we have on you.\n'
                  '- The right to request a copy of your personal information in a structured, machine-readable format.\n'
                  '- The right to withdraw consent at any time where we rely on your consent to process your personal information.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '6. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '7. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'If you have any questions about this Privacy Policy, please contact us at:\n\n'
                  'Email: [Your Email Address]\n'
                  'Address: [Your Company Address]',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

/*"Inspire Change."
"Innovate Continuously."
"Empower Thought."
"Transform Ideas."
"Explore Possibilities."
"Ignite Curiosity."
"Embrace Learning."
"Craft Connections."
"Challenge Norms."
"Elevate Minds."
"Foster Understanding."
"Expand Horizons."
"Create Futures."*/