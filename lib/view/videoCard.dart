// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:project_a/view/yuyo.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
//
// class DisplayVideoPage extends StatefulWidget {
//   final String videoName;  // Add this line
//   final String videoDescription;
//   final File videoFile;
//
//   DisplayVideoPage({required this.videoFile,  required this.videoName, required this.videoDescription});
//
//   @override
//   _DisplayVideoPageState createState() => _DisplayVideoPageState();
// }
//
// class _DisplayVideoPageState extends State<DisplayVideoPage> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     _videoPlayerController = VideoPlayerController.file(widget.videoFile);
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: true,
//       looping: false,
//       aspectRatio: null,
//       showControls: true,
//     );
//
//     // Listen for video controller initialization
//     _videoPlayerController.addListener(() {
//       if (_videoPlayerController.value.isInitialized) {
//         setState(() {}); // Trigger a rebuild when video controller is initialized
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isDataEntered = false;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//         actions: [
//           IconButton(onPressed:(){
//             _saveVideoDetails();
//             Navigator.of(context).pop();},
//               icon:Icon(Icons.check_outlined,size: 35,))
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           if (_videoPlayerController.value.isInitialized)
//             Expanded(
//               child: Chewie(
//                 controller: _chewieController,
//               ),
//             ),
//           SizedBox(height: 16),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _descriptionController,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   void _saveVideoDetails() {
//     // Get the entered text from the controllers
//     String name = _nameController.text;
//     String description = _descriptionController.text;
//     /// extra added
//     VideoDetailsProvider().setVideoDetails(
//       VideoDetails(videoName: name, videoDescription: description, videoFile: widget.videoFile,name: name,),);
//     // Save the details or perform any desired actions (e.g., upload to a server)
//     print('Name: $name, Description: $description, Video File: ${widget.videoFile.path}');
//   }
// }
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_a/view/Vediodetails.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoDetails {
  final String videoName;
  final String videoDescription;
  final File videoFile;
  final String name;

  VideoDetails({
    required this.videoName,
    required this.videoDescription,
    required this.videoFile,
    required this.name,
  });
}

class DisplayVideoPage extends StatefulWidget {
  final String videoName;
  final String videoDescription;
  final File videoFile;

  DisplayVideoPage({
    required this.videoFile,
    required this.videoName,
    required this.videoDescription,
  });

  @override
  _DisplayVideoPageState createState() => _DisplayVideoPageState();
}

class _DisplayVideoPageState extends State<DisplayVideoPage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.file(widget.videoFile);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: null,
      showControls: true,
    );

  //   _videoPlayerController.addListener(() {
  //     if (_videoPlayerController.value.isInitialized) {
  //       setState(() {});
  //     }
  //   });
  // }
    _videoPlayerController.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
        actions: [
          IconButton(
            onPressed: () {
              _saveVideoDetails();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.check_outlined, size: 35),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_videoPlayerController.value.isInitialized)
            Expanded(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _saveVideoDetails() async {
    String name = _nameController.text;
    String description = _descriptionController.text;
    // VideoDetailsProvider().setVideoDetails(
    //     VideoDetails(
    //       videoName: name,
    //       videoDescription: description,
    //       videoFile: widget.videoFile,
    //       name: name,
    //     ),
    // );
    print('Name: $name, Description: $description, Video File: ${widget.videoFile.path}');
  }
}
