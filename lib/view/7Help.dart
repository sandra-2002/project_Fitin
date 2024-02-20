import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

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
            Icon(Icons.help,size: 30,),
            SizedBox(width: 10,),
            Text('Help',style: TextStyle(fontSize: 30),),
          ],
        ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('HOW TO ADD VIDEOS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                Text('Uploading Videos:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                  "1. Tap on the [Add Video] button in the app\'s main menu.\n"
                      '2. Select the video from your device\'s gallery.\n'
                      '3. Ensure your video meets the supported format and size requirements.',
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('VIDEO GUIDELINES:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    ],
                  ),
                ),
                Text('Content Guidelines:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                 " - Videos should focus on fitness-related content.\n"
                "- Avoid content violating our community guidelines, including nudity, violence, or copyrighted material.",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('PRIVACY SETTINGS:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
                Text('Setting Video Privacy:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                  " - Choose privacy settings for your videos (public, private, or restricted to specific users/groups)..\n"
                      "-  Manage video visibility in your profile settings.",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('PROFILE CUSTOMIZATION:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
                Text('Customizing Your Profile:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                  " - Add a profile picture, bio, and other relevant information. \n"
                      " - Make your fitness profile uniquely yours!",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('SAFETY AND PROPER FORM:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
                Text('Safety First:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                  " - Emphasize safety and proper form in your fitness videos. \n"
                      "- Include appropriate disclaimers and warnings in your video descriptions",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('COMMUNITY GUIDELINES:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
                Text('Community Standards:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                  "  - Review our community guidelines for respectful and positive interactions\n"
                      "- Understand the consequences of violating community standards.",
                  style: TextStyle(fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_forward_sharp),
                      SizedBox(width: 10,),
                      Text('FAQ\'s:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    ],
                  ),
                ),
                Text('Explore FAQs:',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(
                  "  - Find answers to common questions about video upload, community engagement, and app features.\n"
                      "- Still have questions? Contact our support team at [sandrasreya7025@gmail.com]",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 25,),
                Text(
                    "Thank you for being a part of the FITIN community! \n"
                        "If you need further assistance, feel free to reach out to our support team",
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
