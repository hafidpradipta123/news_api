import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_api/models/news_channel_headline_model.dart';

import '../models/categories_news_model.dart';
String kAPI_Key = "104df3adc962428a8612989c62d9d952";


class NewsRepository{

  Future<NewsChannelsHeadlinesModel> fetchNewsHeadlinesApi( ) async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$kAPI_Key';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode){
      print(response.body);
    }

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);


    }
    throw Exception("Error");
  }


  Future<NewsChannelsHeadlinesModel> fetchNewChanelHeadlinesApi(String channelName) async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=$kAPI_Key';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode){
      print(response.body);
    }

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return NewsChannelsHeadlinesModel.fromJson(body);


    }
    throw Exception("Error");
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    String url = 'https://newsapi.org/v2/everything?q=$category&apiKey=$kAPI_Key';
    final response = await http.get(Uri.parse(url));
    if (kDebugMode){
      print(response.body);
    }

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);


    }
    throw Exception("Error");
  }
}