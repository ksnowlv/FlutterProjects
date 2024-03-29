import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayersPage extends StatefulWidget {
  const AudioPlayersPage({super.key});

  @override
  State<AudioPlayersPage> createState() => _AudioPlayersPageState();
}

class _AudioPlayersPageState extends State<AudioPlayersPage> {
  PlayerState? _playerState;
  static const String _audioPath = 'audio/dujiaoxi.mp3';
  late AudioPlayer _audioPlayer;


  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;


  @override
  void initState() async {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    _audioPlayer.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _audioPlayer.setSource(AssetSource(_audioPath));
      await _audioPlayer.resume();
    });

    _audioPlayer.onDurationChanged.listen((state) {
      setState(() {
        _playerState = state as PlayerState?;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                key: const Key('play_button'),
                onPressed: () {
                  if(!_isPlaying) {
                    _play();
                  }
                },
                iconSize: 48.0,
                icon: const Icon(Icons.play_arrow),
              ),
              IconButton(
                key: const Key('pause_button'),
                onPressed: () {
                  if(_isPlaying) {
                    _pause();
                  }
                },
                iconSize: 48.0,
                icon: const Icon(Icons.pause),
              ),
              IconButton(
                key: const Key('stop_button'),
                onPressed: () {
                  if(_isPlaying | _isPaused) {
                    _stop();
                  }
                },
                iconSize: 48.0,
                icon: const Icon(Icons.stop),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _play() async {
    await _audioPlayer.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await _audioPlayer.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await _audioPlayer.stop();
    setState(() {
      _playerState = PlayerState.stopped;
    });
  }
}
