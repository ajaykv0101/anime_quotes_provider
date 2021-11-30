import 'dart:convert'; //this lib is needed for converting to and from json
import 'dart:developer';

import 'package:anime_provider/models/anime_quote_model.dart';
import 'package:http/http.dart' as http;

///services
class ApiServices {
  // final String baseUrl = "http://139.59.68.115/api/v1";

  Future<List<AnimeQuoteModel>> getSomeData() async {
    var url = Uri.parse('https://animechan.vercel.app/api/quotes');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    //we know the json starts with [ so its a list
    var decodedList = jsonDecode(response.body) as List;
    //here we got that as dart variable aka a dart object so decoding is done.

    //step 2, converting this into 'AnimeQuoteModel'

    List<AnimeQuoteModel> apiModelList = decodedList
        .map(
          (e) => AnimeQuoteModel.fromJson(e),
        )
        .toList();

    print(apiModelList.length);
    //
    // print(decodedList[0]);

    return apiModelList;

    //part 1 decoding json
  }
}
