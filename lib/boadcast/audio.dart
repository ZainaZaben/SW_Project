import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_1st/boadcast/model/podcast.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  final Podcast podcast;
  const AudioFile(
      {Key? key, required this.advancedPlayer, required this.podcast})
      : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  late String path;
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    path = widget.podcast.audio ?? '';

    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });

    this.widget.advancedPlayer.onPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    this.widget.advancedPlayer.setSourceUrl(path);
    this.widget.advancedPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? Icon(_icons[0], size: 50, color: Color(0xFF228559))
          : Icon(_icons[1], size: 50, color: Color(0xFF228559)),
      onPressed: () async {
        if (isPlaying == false) {
          await this.widget.advancedPlayer.play(UrlSource(path));
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(0.5);
      },
      icon: Icon(
        Icons.skip_previous,
        size: 30,
        color: Colors.black,
      ),
    );
  }

  Widget btnFast() {
    return IconButton(
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(1.5);
      },
      icon: Icon(
        Icons.skip_next,
        size: 30,
        color: Colors.black,
      ),
    );
  }

  Widget btnLoop() {
    return IconButton(
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(1);
      },
      icon: Icon(
        Icons.shuffle,
        size: 30,
        color: Colors.black,
      ),
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: Icon(
        Icons.loop,
        size: 30,
        color: color,
      ),
      onPressed: () {
        if (isRepeat == false) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
            color = Color(0xFF228559);
          });
        } else if (isRepeat == true) {
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.release);
          color = Colors.black;
          isRepeat = false;
        }
      },
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnRepeat(),
          btnSlow(),
          btnStart(),
          btnFast(),
          btnLoop(),
        ],
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: Color(0xFF228559),
      inactiveColor: Colors.grey,
      value: _position.inSeconds.toDouble(),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {

        setState(() {
          changeToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _position.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
