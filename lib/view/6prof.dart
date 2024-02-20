import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile {
  String name = "";
  String about = "";
  File? profileImage;

  UserProfile({required this.name, required this.about, required this.profileImage});
}

class TempUserProfile {
  String name = "";
  String about = "";
  File? profileImage;

  TempUserProfile({required this.name, required this.about, required this.profileImage});
}

class ProfileProvider with ChangeNotifier {
  UserProfile _userProfile = UserProfile(name: "", about: "", profileImage: null);
  TempUserProfile _tempUserProfile = TempUserProfile(name: "", about: "", profileImage: null);

  UserProfile get userProfile => _userProfile;
  TempUserProfile get tempUserProfile => _tempUserProfile;

  void setName(String name) {
    _tempUserProfile.name = name;
    notifyListeners();
  }

  void setAbout(String about) {
    _tempUserProfile.about = about;
    notifyListeners();
  }

  void setProfileImage(File? image) {
    _tempUserProfile.profileImage = image;
    notifyListeners();
  }

  void applyChanges() {
    _userProfile = UserProfile(
      name: _tempUserProfile.name,
      about: _tempUserProfile.about,
      profileImage: _tempUserProfile.profileImage,
    );
    _saveProfileToLocal();
    notifyListeners();
  }

  Future<void> loadProfileFromLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userProfile = UserProfile(
      name: prefs.getString('name') ?? '',
      about: prefs.getString('about') ?? '',
      profileImage: File(prefs.getString('profileImagePath') ?? ''),
    );

    // Initialize TempUserProfile with UserProfile
    _tempUserProfile = TempUserProfile(
      name: _userProfile.name,
      about: _userProfile.about,
      profileImage: _userProfile.profileImage,
    );

    notifyListeners();
  }

  Future<void> _saveProfileToLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _userProfile.name);
    prefs.setString('about', _userProfile.about);
    prefs.setString('profileImagePath', _userProfile.profileImage?.path ?? '');
  }
}

class ProfileScreen extends StatefulWidget {
  late final File? profileImage;
  ProfileScreen({this.profileImage});
  @override
  __ProfileScreenState createState() => __ProfileScreenState();
}

class __ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                _saveChanges(context, profileProvider);
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.check, size: 35),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
        Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: profileProvider.tempUserProfile.profileImage != null
                        ? ClipOval(
                      child: Image.file(
                        profileProvider.tempUserProfile.profileImage!,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(), // Empty container if no image selected
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 85, top: 100),
                    child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:Colors.white,
                                width: 3
                            )
                        ),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.deepOrange[400],
                        child: IconButton(
                          onPressed: () async {
                            await _pickProfileImage(profileProvider);
                          },
                          icon: Icon(Icons.add_a_photo_rounded, size: 28,color: Colors.black,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: TextEditingController(text: profileProvider.tempUserProfile.name),
                onChanged: (value) {
                  profileProvider.setName(value);
                },
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                  hintText: 'Name',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: TextEditingController(text: profileProvider.tempUserProfile.about),
                onChanged: (value) {
                  profileProvider.setAbout(value);
                },
                maxLines: null,
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.edit),
                  prefixIcon: Icon(
                    Icons.info_outline,
                    color: Colors.black,
                    size: 30,
                  ),
                  hintText: 'About',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveChanges(BuildContext context, ProfileProvider profileProvider) async {
    profileProvider.applyChanges();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Changes saved successfully!'),
    ));
  }

  Future<void> _pickProfileImage(ProfileProvider profileProvider) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileProvider.setProfileImage(File(pickedFile.path));
    }
  }
}
