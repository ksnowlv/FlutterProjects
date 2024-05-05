import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class AudioPlayersPage extends StatefulWidget {
  
  final String title;
  const AudioPlayersPage({super.key, required this.title});

  @override
  State<AudioPlayersPage> createState() => _AudioPlayersPageState();
}

class _AudioPlayersPageState extends State<AudioPlayersPage> {
  PlayerState? _playerState;
  static const String _audioPath = 'audio/test.mp3';
  late AudioPlayer _audioPlayer;
  Duration _position = Duration.zero;
  Duration? _duration;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    playAudio();
  }

  void playAudio() async {
    try {
      //请注意AssetSource构造函数中的路径是audio/test.mp3
      //而不是 assets/audio/test.mp3。这是因为AssetSource会自动将路径解析为assets/目录下的文件。
      //确保您的音频文件确实位于项目目录的assets/audio/文件夹中，并且文件名和扩展名都是正确的。
      //final source = AssetSource('assets/audio/test.mp3');
      //await _audioPlayer.setSourceAsset('audio/test.mp3');
      //为了与播放器播放时设置的AssetSource对象路径作对比。
      final ByteData data = await rootBundle.load('assets/audio/test.mp3');
      debugPrint('ByteData = ${data.lengthInBytes}');
      // 设置音频源并播放
      _audioPlayer.play(AssetSource(_audioPath));
      //监听播放器状态
      _audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() {
          _playerState = state;
          debugPrint('_playerState: $_playerState');

          if(_playerState == PlayerState.completed) {
            debugPrint('重新播放');
            playAudio();
          }
        });
      });

      _audioPlayer.onPositionChanged.listen((position) {
        setState(() {
          _position = position;
        });
      });

      _audioPlayer.onDurationChanged.listen((duration) { 
        _duration = duration;
      });

    } catch (e) {
      // 处理异常
      debugPrint('Error playing audio: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _duration != null
              ? SizedBox(
                  child: Slider(
                    value: (_duration != null &&
                            _position.inMilliseconds > 0 &&
                            _position.inMilliseconds <
                                _duration!.inMilliseconds)
                        ? _position.inMilliseconds / _duration!.inMilliseconds
                        : 0.0,
                    onChanged: _onSliderChanged,
                  ),
                )
              : Container(),
          Text('音频播放当前位置: ${_position.toString().split('.').first}'),
          Text('音频播放总时长: ${_duration?.toString().split('.').first ?? ''}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: IconButton(
                  key: const Key('play_button'),
                  onPressed: () {
                    if (!_isPlaying) {
                      _play();
                    }
                  },
                  iconSize: 48.0,
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              Expanded(
                child: IconButton(
                  key: const Key('pause_button'),
                  onPressed: () {
                    if (_isPlaying) {
                      _pause();
                    }
                  },
                  iconSize: 48.0,
                  icon: const Icon(Icons.pause),
                ),
              ),
              Expanded(
                child: IconButton(
                  key: const Key('stop_button'),
                  onPressed: () {
                    if (_isPlaying || _isPaused) {
                      _stop();
                    }
                  },
                  iconSize: 48.0,
                  icon: const Icon(Icons.stop),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onSliderChanged(double newValue) {
    if (_duration == null) {
      return;
    }
    final position = newValue * _duration!.inMilliseconds;
    _audioPlayer.seek(Duration(milliseconds: position.round()));
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

  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
  }
}
