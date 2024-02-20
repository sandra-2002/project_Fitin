import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/view/3Signup.dart';
import 'package:project_a/view/4login.dart';

class LogSign extends StatefulWidget {
  const LogSign({super.key});

  @override
  State<LogSign> createState() => _LogSignState();
}

class _LogSignState extends State<LogSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Column(
            children: [
              Container(
              height: 400,
              width: 500,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: NetworkImage(
                      'http://getwallpapers.com/wallpaper/full/9/7/9/200446.jpg'),
                      fit: BoxFit.cover)
              ),
          child:Stack(
            children:[ Padding(
                padding: const EdgeInsets.only(top: 150,left: 75),
                child: RichText(
                text: TextSpan(
                  children: [
                TextSpan(text: 'F', style: GoogleFonts.eagleLake(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 100)),
                TextSpan(text: 'IT', style: GoogleFonts.eagleLake(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 70)),
                TextSpan(text: 'IN', style: GoogleFonts.eagleLake(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 70)),
                  ],
                ),
        ),
            ),
        ]  ),
          ),
              ClipRRect(
              borderRadius: const BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
              child: Container(
                height: 443,width: 700,
                decoration:  BoxDecoration(
                  //color: Color.fromRGBO(255, 100, 0, 0.7),
                    shape: BoxShape.rectangle,color: Colors.deepOrange.withOpacity(0.5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30,left:10 ),
                      child: Text('Start Your Journey Today !',style: GoogleFonts.gabriela(fontWeight: FontWeight.bold,fontSize: 50),),
                    ),
                    const SizedBox(height: 60,),
                    Container(
                        height:60,width: 400,
                        child: ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up()));
                        },
                          style:ElevatedButton.styleFrom(backgroundColor: Colors.black54) ,
                          child:const Text('Create Your Account',
                            style: TextStyle(color: Colors.white,fontSize: 20),),)),
                    const SizedBox(height: 35,),
                    Container(
                        height: 60,width: 400,
                        child: ElevatedButton(onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        },
                            style:ElevatedButton.styleFrom(backgroundColor: Colors.black54),
                            child:const Text('Login',
                          style: TextStyle(color: Colors.white,fontSize: 20),)))
                  ],
                ),
              ),
                )],
      ),
    );
  }
}