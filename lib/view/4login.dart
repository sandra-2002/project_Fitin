import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:project_a/view/3Signup.dart';
import 'package:project_a/view/2logsign.dart';
import 'package:project_a/view/5HomeScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //late SharedPreferences sharedPreferences;
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool hidpass = true;

  @override
  Future<Map<String, String>> getRegistrationData() async {
    final registrationBox = await Hive.openBox(HiveBoxes.registrationBox);
    final String username = registrationBox.get('username') ?? "";
    final String password = registrationBox.get('password') ?? "";
    await registrationBox.close();
    return {'username': username, 'password': password};
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: 843.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Asset/images/img.png'),
                      fit: BoxFit.cover)
              ),
              child: Container(
                child: Column(
                  children: [
                    SizedBox(height: 25,),
                    Text('WELCOME BACK !', style: GoogleFonts.gabriela(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                    Text("You've been missed",
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.withOpacity(0.6),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => LogSign()));
                                },
                                    icon: Icon(
                                      Icons.keyboard_double_arrow_left_rounded,
                                      size: 50, color: Colors.black,)),
                              ],
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: email,
                              cursorColor: Colors.black,
                              style: TextStyle(fontSize: 22),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 22),
                                prefixIcon: Icon(
                                  Icons.person, color: Colors.black, size: 30,),
                                hintText: 'Username',
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              validator: (emailid) {
                                if (emailid == null || emailid!.isEmpty ||
                                    !emailid.contains('@gmail.com')) {
                                  return 'Invalid Username';
                                } else {
                                  return null;
                                }
                              },
      
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              controller: pass,
                              obscuringCharacter: '.',
                              obscureText: hidpass,
                              cursorColor: Colors.black,
                              style: TextStyle(fontSize: 22),
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(onPressed: () {
                                    setState(() {
                                      if (hidpass == true) {
                                        hidpass = false;
                                      } else {
                                        hidpass = true;
                                      }
                                    });
                                  }, icon: Icon(hidpass == true
                                      ? Icons.visibility_off_outlined : Icons
                                      .visibility_outlined
                                  )),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 22),
                                  hintText: 'Password',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black),
                                      borderRadius: BorderRadius.circular(20))
                              ),
                              validator: (pswd) {
                                if (pswd == null || pswd.length < 6) {
                                  return 'Password must contain atleast 6 characters,';
                                }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 200),
                              child: TextButton(onPressed: () {},
                                  child: Text('Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),)),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              //decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                              height: 55, width: 250,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black54,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              30))),
                                  onPressed: () {
                                    if (formkey.currentState!.validate()) {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Search()));
                                    }
                                  },
                                  child: Text('LOGIN', style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 22),)),
                            ),
                            TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Sign_Up()));
                            },
                                child: Text("Dont have an Account? SignUp",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),))
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




