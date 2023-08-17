import 'package:news_api/models/categories_news_model.dart';
import 'package:news_api/models/news_channel_headline_model.dart';
import 'package:news_api/repository/news_repository.dart';

class NewsViewModel{
  final _rep = NewsRepository();

  Future<NewsChannelsHeadlinesModel> fetchNewsHeadlinesApi(  ) async{
    final response = await _rep.fetchNewsHeadlinesApi();
    return response;

  }

  Future<NewsChannelsHeadlinesModel> fetchChannelHeadlinesApi(String channelName ) async{
    final response = await _rep.fetchNewChanelHeadlinesApi(channelName);
    return response;

  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;

  }
}
