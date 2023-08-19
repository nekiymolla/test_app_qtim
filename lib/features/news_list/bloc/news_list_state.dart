part of 'news_list_bloc.dart';

class NewsListState {}

class NewsListInitial extends NewsListState {}

class NewsListLoading extends NewsListState {}

class NewsListLoaded extends NewsListState {
  NewsListLoaded({
    required this.newsList,
  });
  final List<NewsForm> newsList;
}

class NewsListLoadingFailure extends NewsListState {
  NewsListLoadingFailure({
    required this.exception,
  });
  final Object? exception;
}
