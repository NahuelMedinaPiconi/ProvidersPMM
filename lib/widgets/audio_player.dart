import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongPreviewPlayer extends StatefulWidget {
  final String url;

  const SongPreviewPlayer({super.key, required this.url});

  @override
  State<SongPreviewPlayer> createState() => _SongPreviewPlayerState();
}

class _SongPreviewPlayerState extends State<SongPreviewPlayer> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _isPlaying = false);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play(UrlSource(widget.url));
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 64,
        color: Colors.white,
        icon: Icon(_isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled),
        onPressed: _toggle,
      ),
    );
  }
}