import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/view/2logsign.dart';
import 'package:project_a/view/6prof.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _loadProfileData();
    Timer(Duration(seconds:4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LogSign()));
    });
  }
  Future<void> _loadProfileData() async {
    // Load profile data from SharedPreferences
    var profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    await profileProvider.loadProfileFromLocal();
  }
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwj7wtX4ElIbbC-bQDHWIcSCylGv3vLSA2xxGpfUdPm9Z1ZYZjSr74IsLPsiGgZMOXk6Y&usqp=CAU'),
           fit: BoxFit.cover,
         ),
       ),
       child: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             RichText(
               text: TextSpan(
                 children: [
                   TextSpan(text: 'F', style: GoogleFonts.eagleLake(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 100)),
                   TextSpan(text: 'IT', style: GoogleFonts.eagleLake(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 70)),
                   TextSpan(text: 'IN', style: GoogleFonts.eagleLake(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 70)),
                 ],
               ),
             ),
           ],
         ),
       ),
     ),
    );
  }
}
