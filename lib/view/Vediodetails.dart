import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoDetails {
  final File videoFile;
  final String videoName;
  final String videoDescription;
  final String name;

  VideoDetails({required this.videoFile,
    required this.videoName,
    required this.videoDescription, required this.name,});
}

class VideoDetailsProvider with ChangeNotifier {
  VideoDetails? _videoDetails;

  VideoDetails? get videoDetails => _videoDetails;

  void setVideoDetails(VideoDetails details) {
    _videoDetails = details;
    notifyListeners();
  }
}

class VideoDisplayWidget extends StatelessWidget {
  final File videoFile;
  final String? videoName;
  final String? videoDescription;
  VideoDisplayWidget({required this.videoFile, required this.videoDescription, required this.videoName});

  @override
  Widget build(BuildContext context) {
   VideoDetails? videoDetails = Provider.of<VideoDetailsProvider>(context).videoDetails;
  // VideoDetails? videoDetails = VideoDetailsProvider().videoDetails; /// EA
    return Column(
      children: [
        VideoPlayerWidget(videoFile: videoFile),
        SizedBox(height: 20),
        if (videoDetails != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${videoDetails.videoName}', style: TextStyle(color: Colors.white)),
              Text('Description: ${videoDetails.videoDescription}', style: TextStyle(color: Colors.white)),

            ],
         ),
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final File videoFile;

  VideoPlayerWidget({required this.videoFile});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}
class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    // Initialize video player controller
    _videoPlayerController = VideoPlayerController.file(widget.videoFile);

    // Initialize Chewie controller
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: null,
      showControls: true,
    );

    // Listen for video controller initialization
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.isInitialized) {
        setState(() {}); // Trigger a rebuild when video controller is initialized
      }
    });

    // Initialize the video player controller
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
    return Container(
      color: Colors.grey,
      height: 200, // Adjust the height as needed
      width: double.infinity,
      child: Center(
        child: _videoPlayerController.value.isInitialized
            ? Chewie(
          controller: _chewieController,
        )
            : Text(
          'Video Player Placeholder',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

