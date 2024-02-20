import 'package:flutter/material.dart';

class Privacy_ extends StatelessWidget {
  const Privacy_({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back,size: 30,),),
        title: const Row(
          children: [
            Icon(Icons.privacy_tip,size: 30,),
            SizedBox(width: 10,),
            Text('Privacy',style: TextStyle(fontSize: 28),),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text('# Privacy Policy For FITIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            ),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Personal Information:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('We may collect personal information such as names, email addresses, and profile pictures when users create accounts or interact with our app.',style: TextStyle(fontSize: 18),),
            ),SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Collected Information:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(' To provide and improve our services.\n'
                 ' To personalize user experience.\n'
              'To send periodic emails or push notifications.\n',style: TextStyle(fontSize: 18),
              ),
            ),SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Data Useage:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(' We collect information on how users interact with our app, including pages visited, features used, and other usage patterns.',style: TextStyle(fontSize: 18),),
            ),SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Data Sharing and Third Parties:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('We do not sell, trade, or otherwise transfer users personal information to third parties.\n'
              ' However, we may share aggregated and anonymized data for analytics and improvement purposes.',style: TextStyle(fontSize: 18),),
            ),SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Data Security:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('We implement security measures to protect the confidentiality and integrity of users personal information.\n'
                  'Despite our efforts, no security measures are foolproof, and we cannot guarantee the security of user data. ',style: TextStyle(fontSize: 18),),
            ),SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Changes to Privacy Policy:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),SizedBox(height: 8,),
            Text(' We reserve the right to update our privacy policy as our app evolves. Users will be notified of any significant changes.',style: TextStyle(fontSize: 18),),
           SizedBox(height: 8,),
            Row(
              children: [
                Icon(Icons.arrow_forward_sharp),
                SizedBox(width: 10,),
                Text('Contact Us:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ],
            ),SizedBox(height: 10,),
            Text('If you have questions or concerns regarding our privacy policy, please contact us at sandrasreya7025@gmail.com',style: TextStyle(fontSize: 18),),
            SizedBox(height: 15),
            Text(' This privacy policy was last updated on 24-01-2024.',style: TextStyle(fontSize: 18),),
            SizedBox(height: 12),
        Text(' Thank you for using FITIN.',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      ),
    );
  }
}
