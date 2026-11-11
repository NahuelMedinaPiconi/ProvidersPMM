import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class CardSwiper extends StatelessWidget {

  final List<Song> songs;

  const CardSwiper({
    super.key,
    required this.songs
  }); 

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
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
        child: Swiper(
          itemCount: songs.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final song = songs[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: song),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Expanded(
                        child: FadeInImage(
                            placeholder: AssetImage('assets/no-image.jpg'),
                            image: NetworkImage(song.fullArtworkUrl),
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          song.trackCensoredName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
