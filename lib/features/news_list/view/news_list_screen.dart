import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_app_qtim/features/news_list/widget/news_list_tiles.dart';
import 'package:test_app_qtim/global_widgets/texts.dart';
import 'package:test_app_qtim/repository/news_repository.dart';

import '../bloc/news_list_bloc.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final _newsListBloc = NewsListBloc(GetIt.I<MockNewsRepository>());
  @override
  void initState() {
    _newsListBloc.add(LoadNewsList(completer: Completer()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _newsListBloc.add(LoadNewsList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<NewsListBloc, NewsListState>(
          bloc: _newsListBloc,
          builder: (context, state) {
            if (state is NewsListLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                        headerText('News list', Colors.white),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.mark_chat_read_outlined,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    pinned: true,
                    toolbarHeight: 60,
                    backgroundColor: Color.fromARGB(255, 27, 155, 240),
                    expandedHeight: 100,
                    flexibleSpace: const FlexibleSpaceBar(
                      background: SizedBox(
                        width: double.maxFinite,
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(20),
                      child: Container(
                        width: double.maxFinite,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            )),
                        child: Center(
                          child: headerText('example', Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: subtitleText('Feature news', Colors.black),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.newsList.length,
                        itemBuilder: (context, i) {
                          final news = state.newsList[i];
                          return SizedBox(
                            width: 240.0,
                            child: NewsHListTile(
                              news: news,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: subtitleText('Latest news', Colors.black),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: state.newsList.length,
                    (context, i) {
                      final news = state.newsList[i];
                      return NewsVListTile(
                        news: news,
                      );
                    },
                  )),
                ],
              );
            }
            if (state is NewsListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Что - то пошло не так',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          height: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          _newsListBloc.add(LoadNewsList());
                        },
                        child: const Text(
                          'Попробовать снова',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 214, 50),
                              height: 18),
                        )),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
