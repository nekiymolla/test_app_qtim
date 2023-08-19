part of 'news_list_bloc.dart';

class NewsListEvent {}

class LoadNewsList extends NewsListEvent {
  LoadNewsList({
    this.completer,
  });
  final Completer? completer;
}
