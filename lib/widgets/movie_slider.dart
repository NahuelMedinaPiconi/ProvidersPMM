import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  // const MovieSlider({Key? key}) : super(key: key);

  final List<Song> songs;

  const MovieSlider({super.key, required this.songs});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if (this.songs.length == 0) {
      return Container(
        width: double.infinity,
        height: size.height*0.5,
        child: Center(
          child: CircularProgressIndicator()
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 280,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populars',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (_, int index) {
                return _MoviePoster(song: songs[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Song song;

  const _MoviePoster({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: song),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(song.fullArtworkUrl),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            song.trackName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
