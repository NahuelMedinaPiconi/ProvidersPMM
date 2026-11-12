import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';
import 'package:movies_app/widgets/audio_player.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Song song = ModalRoute.of(context)!.settings.arguments as Song;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(song: song),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitile(song: song),
              _Overview(song: song),
              // CastingCards(peliId: song.trackId),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Song song;
  const _CustomAppBar({required this.song});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(song.trackCensoredName, style: const TextStyle(fontSize: 14)),
              )),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(song.fullArtworkUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {
  final Song song;
  const _PosterAndTitile({required this.song});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(song.fullArtworkUrl),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.trackName,
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    const Icon(Icons.music_note, size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Expanded(child: Text(song.artistName)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Song song;

  const _Overview({required this.song});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            song.overview,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: Text(
                      "Enjoy a preview!",
                      style: Theme.of(context).textTheme.titleMedium,
                    )),
                    SongPreviewPlayer(url: song.previewUrl),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
