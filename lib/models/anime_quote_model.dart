///model
class AnimeQuoteModel {
  String? anime;
  String? character;
  String? quote;

  AnimeQuoteModel({
    required this.anime,
    required this.character,
    required this.quote,
  });

  //this will convert json into our model, this named constructor will be called from
  // ApiServices page
  AnimeQuoteModel.fromJson(Map<String, dynamic> json) {
    anime = json['anime'];
    character = json['character'];
    quote = json['quote'];
  }
}
