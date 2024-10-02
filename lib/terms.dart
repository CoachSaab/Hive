import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Use',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Last Updated: 10-10-24',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Hive Chat These Terms of Use  govern  use of our services, '
                  'including the mobile application, website, and any related services (collectively, the "Services"). '
                  'By accessing or using our Services, you agree to these Terms. If you do not agree with these Terms, '
                  'please do not use our Services.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'By using our Services, you confirm that you are at least 18 years old or are using the Services '
                  'with the consent of a parent or guardian. If you are using the Services on behalf of an organization, '
                  'you represent that you have the authority to bind that organization to these Terms.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '2. Changes to Terms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'We may update these Terms from time to time. If we make significant changes, we will notify you by '
                  'email or through a notice on our Services. Your continued use of the Services after the changes '
                  'constitute your acceptance of the revised Terms.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '3. Account Registration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'To access certain features of our Services, you may need to create an account. You are responsible for '
                  'maintaining the confidentiality of your account information and are fully responsible for all activities '
                  'that occur under your account. You agree to notify us immediately of any unauthorized use of your account.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '4. User Content',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You are solely responsible for any content you submit, post, or display through our Services. By submitting '
                  'content, you grant us a non-exclusive, royalty-free, perpetual, and worldwide license to use, modify, '
                  'reproduce, publish, and distribute that content. You represent that you own or have the necessary rights '
                  'to the content you submit.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '5. Prohibited Conduct',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You agree not to engage in any of the following prohibited activities:\n\n'
                  '- Using the Services for any illegal purpose or in violation of any local, state, national, or international law.\n'
                  '- Harassing, threatening, or intimidating other users.\n'
                  '- Impersonating any person or entity, or misrepresenting your affiliation with any person or entity.\n'
                  '- Distributing unsolicited or unauthorized advertising or promotional materials.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '6. Intellectual Property',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'All content and materials available on the Services, including but not limited to text, graphics, logos, '
                  'and software, are the property of [Your App Name] or its licensors and are protected by copyright and other '
                  'intellectual property laws. You may not use, reproduce, or distribute any content from our Services without '
                  'our express written consent.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '7. Disclaimers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'The Services are provided on an "as is" and "as available" basis without any warranties of any kind, either '
                  'express or implied. We do not warrant that the Services will be uninterrupted, secure, or error-free.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '8. Limitation of Liability',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'To the maximum extent permitted by applicable law, [Your App Name] shall not be liable for any indirect, '
                  'incidental, special, consequential, or punitive damages arising out of or in connection with your use of the Services.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '9. Governing Law',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'These Terms shall be governed by and construed in accordance with the laws of [Your State/Country], without '
                  'regard to its conflict of law principles.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '10. Contact Us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'If you have any questions about these Terms, please contact us at:\n\n'
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
