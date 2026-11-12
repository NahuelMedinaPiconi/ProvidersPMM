import 'package:flutter/material.dart';
import 'package:movies_app/providers/songs_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _searching = false;
  String _searched = "Linkin Park";
  final TextEditingController _textController = new TextEditingController();

  void _submit(String value) {
    setState(() {
      _searched = value.trim();
      _searching = false;
    });

    if (_searched.isNotEmpty) {
      context.read<SongsProvider>().getSearchedArtist(_searched);
    }
  }

  @override
  Widget build(BuildContext context) {
    final songsProvider = Provider.of<SongsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: _searching
          ? TextField(
              controller: _textController,
              autofocus: true,
              textInputAction: TextInputAction.search,
              decoration: const InputDecoration(
                hintText: 'Search for an artist...',
                  border: InputBorder.none,
              ),
              onSubmitted: _submit,
            )
          : Text(_searched),
        actions: [
          IconButton(
            icon: Icon(_searching ? Icons.close : Icons.search_outlined),
            onPressed: () {
              if (_searching) {
                _textController.clear();
                setState(() => _searching = false);
              } else {
                setState(() => _searching = true);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(songs: songsProvider.searchedArtist),

              // Slider de pel·licules
              MovieSlider(songs: songsProvider.otherSongs),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              // MovieSlider(),
              // MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
