import 'package:anime_provider/models/anime_quote_model.dart';
import 'package:anime_provider/providers/anime_quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimeQuoteScreen extends StatefulWidget {
  const AnimeQuoteScreen({Key? key}) : super(key: key);

  @override
  _AnimeQuoteScreenState createState() => _AnimeQuoteScreenState();
}

class _AnimeQuoteScreenState extends State<AnimeQuoteScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AnimeQuoteProvider>(context, listen: false).callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random 10 Anime Quotes"),
        centerTitle: true,
      ),
      body: Consumer<AnimeQuoteProvider>(
        builder: (context, provider, _) {
          List<AnimeQuoteModel> _apiModelList = provider.apiModelList;
          print(provider.isLoading);
          if (provider.isLoading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView.builder(
            itemCount: _apiModelList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Text(
                    "${_apiModelList[index].character} \nFrom ${_apiModelList[index].anime}",
                    style: TextStyle(
                      color: Colors.red[700],
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  title: Text(
                    '${_apiModelList[index].quote}',
                    style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
