import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/model/CustomSearch.dart';
import 'package:project_a/view/7Help.dart';
import 'package:project_a/view/8Privacy.dart';
import 'package:project_a/view/6prof.dart';
import 'package:project_a/view/videoCard.dart';
import 'package:project_a/view/Vediodetails.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  final File? profileImage;
  const Search({Key? key, this.profileImage}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool showDetails = false;

  late final List<File> videoFiles;

  late TextEditingController _nameController = TextEditingController();
  late TextEditingController _descriptionController = TextEditingController();

  String _enteredVideoName = '';
  String _enteredVideoDescription = '';


  File? _selectedVideoFile;
  File? get profileImage => widget.profileImage;
  int index = 0;
  int _currentIndex = 0;   /// Track the selected tab index

   /// Add a GlobalKey for the Scaffold's state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context) {
      var profileProvider = Provider.of<ProfileProvider>(context);
      final items = <Widget>[
        Icon(Icons.home_outlined, size: 35,),
        GestureDetector(
            onTap:
            _showBottomSheet,
            child: Icon(Icons.add_circle_outline, size: 35,)),
        GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = 2;
            });
            /// Open the end drawer using the GlobalKey
            _scaffoldKey.currentState?.openEndDrawer();
          },
          child: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ),
      ];
      return DefaultTabController(
          length: 2, /// Number of tabs
          child: SafeArea(
            child: Scaffold(
              key: _scaffoldKey,
              /// Assign the GlobalKey to the Scaffold
              backgroundColor: Colors.grey[850],
              appBar: AppBar(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                backgroundColor: Colors.deepOrange,
                automaticallyImplyLeading: false,
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'FIT',
                        style: GoogleFonts.eagleLake(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      TextSpan(
                        text: 'IN',
                        style: GoogleFonts.eagleLake(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () async {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    icon: Icon(Icons.search, color: Colors.black, size: 30),
                  ),
                ],
              ),
              body: Stack(
                children: [
                   _buildTabContent('Page 1'),
              ]),
              bottomNavigationBar: GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                child: CurvedNavigationBar(
                  //animationCurve: Curves.easeInOut,
                  color: Colors.deepOrange,
                  backgroundColor: Colors.transparent,
                  height: 60,
                  index: index,
                  items: items,
                  onTap: (index) => setState(() => this.index = index),
                ),
              ),
              endDrawer: Drawer(
                /// Your drawer content goes here
                child: Container(
                  color: Colors.grey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 250, top: 10),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back_outlined, size: 30,),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: profileProvider.tempUserProfile.profileImage != null
                                  ? FileImage(profileProvider.tempUserProfile.profileImage!)
                                  : null,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(
                                    profileImage: profileProvider.tempUserProfile.profileImage,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            profileProvider.userProfile.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Text(
                          profileProvider.userProfile.about,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height:50 ,),
                        Divider(thickness: 2,color: Colors.black,indent: 20,endIndent:20,),
                        SizedBox(height: 40,),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                GestureDetector(onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => Privacy_()));
                                },
                                  child: Container(
                                    height: 50,
                                    width: 290,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    child: ListTile(
                                      leading: Icon(Icons.privacy_tip_outlined),
                                      title: Text('Privacy'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    height: 50,
                                    width: 290,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    child: GestureDetector(onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => Help()));
                                    },
                                      child: ListTile(
                                        leading: Icon(Icons.help),
                                        title: Text('Help'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    height: 50,
                                    width: 290,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    child: ListTile(
                                      leading: Icon(Icons.settings),
                                      title: Text('Settings'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    height: 50,
                                    width: 290,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(45)
                                    ),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.logout, color: Colors.red,),
                                      title: Text('Log out',
                                        style: TextStyle(color: Colors.red),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          )
      );
    }
     Widget _buildTabContent(String content) {
       if (content == 'Page 1') {
         return _selectedVideoFile != null
             ?Column(
           children: [
             VideoDisplayWidget(videoFile: _selectedVideoFile!, videoName: _enteredVideoName,
               videoDescription: _enteredVideoDescription,),
             SizedBox(height: 16),
             Text(
               _enteredVideoName.isNotEmpty ? _enteredVideoName : 'No Name',
               style: TextStyle(color: Colors.white),
             ),
             SizedBox(height: 8),
             Text(
               _enteredVideoDescription.isNotEmpty
                   ? _enteredVideoDescription
                   : 'No Description',
               style: TextStyle(color: Colors.white),
             ),
           ],
         )
             : Center(
           // Placeholder content when video file is null
           child: Text(
             'No video selected',
             style: TextStyle(color: Colors.white),
           ),
         );
       } else {
         // Placeholder content for other pages
         return Center(
           child: Text(
             content,
             style: TextStyle(color: Colors.white),
           ),
         );
       }
}
    void _showBottomSheet() {
      _scaffoldKey.currentState?.showBottomSheet(
            (BuildContext context) {
          return _buildBottomSheetContent();
        },
      );
    }

  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result != null) {
      File videoFile = File(result.files.single.path!);
      String name = _nameController.text;
      String description = _descriptionController.text;
      setState(() {
        _enteredVideoName = name;
        _enteredVideoDescription = description;
        _selectedVideoFile = videoFile;
            });
      // VideoDetailsProvider().setVideoDetails(
      //     VideoDetails(name: name, videoFile: videoFile, videoName: '', videoDescription: ''),);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DisplayVideoPage(videoFile: videoFile,
            videoName: name,
            videoDescription: description,
          ),
        ),
      );
    }
  }
  Widget _buildBottomSheetContent() {
      return ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        child: Container(
          height: 250,
          color: Colors.grey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 350),
                child: IconButton(
                  icon: Icon(Icons.close, size: 35,), onPressed: () {
                  Navigator.of(context).pop();
                },),
              ),
              Text('Create', style: TextStyle(fontSize: 30),),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child:
                  ElevatedButton(
                    onPressed:
                    _pickVideo,
                    child: Container(
                      height: 70,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.upload, size: 38, color: Colors.black,),
                            SizedBox(width: 20,),
                            Text('Upload Video', style: TextStyle(fontSize: 25, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ]),
        ),
        );
    }
  void _showVideoDetails() {
    setState(() {
      showDetails = true;
    });
  }
  }

