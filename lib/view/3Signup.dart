import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:project_a/view/4login.dart';
import 'package:project_a/view/2logsign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
String? pass;
bool hidpass = true;
bool passhid = true;
final formkey = GlobalKey<FormState>();
  @override
  Future<void> saveRegistrationData(String username, String password) async {
    final registrationBox = await Hive.openBox(HiveBoxes.registrationBox);
    registrationBox.put('username', username);
    registrationBox.put('password', password);
    await registrationBox.close();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 843.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('Asset/images/img.png'),fit: BoxFit.cover)
              ),
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Text("Let's Get Started !",style: GoogleFonts.gabriela(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black)),
                    const SizedBox(height: 30,),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.6),
                        borderRadius: const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LogSign()));
                                }, icon: const Icon(Icons.keyboard_double_arrow_left_rounded,size: 50,color: Colors.black,)),
                              ],
                            ),

                            ///Username
                            const SizedBox(height: 30,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(fontSize: 22),
                              decoration: InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: const TextStyle(color: Colors.black,fontSize: 22),
                                  prefixIcon: const Icon(Icons.person,color: Colors.black,size:30,),
                                  hintText: 'Username',
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              validator: (usrnm){
                                if(usrnm!.isEmpty||!usrnm.contains('@gmail.com')){
                                  return 'Invalid Username!';
                                }else{
                                  return null;
                                }
                              },
                            ),

                            ///Password
                            const SizedBox(height: 15,),
                            TextFormField(
                              obscureText: passhid,
                              obscuringCharacter: '.',
                              cursorColor: Colors.black,
                              style: const TextStyle(fontSize: 22),
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(onPressed: (){
                                   setState(() {
                                     if(passhid==true){
                                       passhid=false;
                                     }else{
                                       passhid=true;
                                     }
                                   });
                                  },icon:Icon(passhid==true
                                  ?Icons.visibility_off_outlined:Icons.visibility_outlined
                                  ) ,),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(color: Colors.black,fontSize: 22),
                                  hintText: 'Password',
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                                  ,border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              validator: (paswd){
                                pass=paswd;
                                if(paswd!.isEmpty||paswd.length<6){
                                  return 'Password must contain atleast 6 characters';
                                }else{
                                  return null;
                                }
                              },
                            ),

                            /// Confirm Password
                            const SizedBox(height: 30,),
                            TextFormField(
                              obscureText: hidpass,
                              obscuringCharacter: '.',
                              cursorColor: Colors.black,
                              style: const TextStyle(fontSize: 22),
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      if(hidpass==true){
                                        hidpass=false;
                                      }else{
                                        hidpass=true;
                                      }
                                    });
                                  },icon:Icon(hidpass==true
                                  ?Icons.visibility_off_outlined:Icons.visibility_outlined) ,),
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(color: Colors.black,fontSize: 22),
                                  hintText: 'Password',
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                                  ,border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              validator: (String?pswd){
                                if(pswd!.isEmpty||pswd!=pass){
                                  return 'Incorrect Password';
                                }else{
                                  return null;
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:200),
                              child: TextButton(onPressed: (){}, child:const Text('Forgot Password?',
                                style: TextStyle(color: Colors.black,fontSize: 18),)),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                              height: 55,width:250 ,
                              child: ElevatedButton(
                                  style:ElevatedButton.styleFrom(backgroundColor: Colors.black54,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ),
                                  onPressed: (){
                                   if(formkey.currentState!.validate()){
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                                   }
                                  }, child:const Row(
                                    children: [
                                      SizedBox(width: 20,),
                                      Text('CONTINUE',style: TextStyle(color: Colors.deepOrange,fontSize: 22),),
                                      SizedBox(width: 30,),
                                      Icon(Icons.arrow_forward_outlined,color: Colors.deepOrange,size: 30,)
                                    ],
                                  )),
                            ),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                            },
                                child:const Text("Already have an Account? Login",style: TextStyle(color: Colors.black,fontSize: 18),))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}

class HiveBoxes {
  static const String registrationBox = 'registrationBox';
}

