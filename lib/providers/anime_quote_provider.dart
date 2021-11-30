import 'package:anime_provider/api/api_services.dart';
import 'package:anime_provider/models/anime_quote_model.dart';
import 'package:anime_provider/models/anime_quote_model.dart';
import 'package:flutter/material.dart';

///logic
class AnimeQuoteProvider with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  List<AnimeQuoteModel> _apiModelList = [];
  List<AnimeQuoteModel> get apiModelList => _apiModelList;

  //this below code is new
  //this will be used for showing a progress indicator in view
  bool _isLoading = true; //setting this to true initially
  bool get isLoading => _isLoading;

  //a method inside provider ( logic #1)
  void callApi() async {
    _apiModelList = await _apiServices.getSomeData();
    print(_apiModelList[0].character);
    _isLoading = false;
    notifyListeners();
  }
}
