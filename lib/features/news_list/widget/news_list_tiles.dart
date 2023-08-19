import 'package:flutter/material.dart';
import 'package:test_app_qtim/global_widgets/texts.dart';
import 'package:test_app_qtim/repository/repository.dart';

class NewsHListTile extends StatelessWidget {
  const NewsHListTile({super.key, required this.news});

  final NewsForm news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: ListTile(
          tileColor: Color.fromARGB(255, 198, 230, 249).withOpacity(0.5),
          onTap: () {
            Navigator.of(context)
                .pushNamed('/news_screen', arguments: news.name);
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          title: headerText(news.name, Colors.black),
          subtitle:
              subtitleText(news.previewDescription ?? "...", Colors.black87),
        ),
      ),
    );
  }
}

class NewsVListTile extends StatefulWidget {
  const NewsVListTile({super.key, required this.news});

  final NewsForm news;

  @override
  State<NewsVListTile> createState() => _NewsVListTileState();
}

class _NewsVListTileState extends State<NewsVListTile> {
  @override
  Widget build(BuildContext context) {
    Color listtilecolor = Color.fromARGB(255, 198, 230, 249).withOpacity(0.5);
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 5,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: ListTile(
          tileColor: listtilecolor,
          onTap: () {
            setState(() {
              listtilecolor = Colors.yellow;
            });
            Navigator.of(context)
                .pushNamed('/news_screen', arguments: widget.news.name);
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          title: headerText(widget.news.name, Colors.black),
          subtitle: subtitleText(
              widget.news.previewDescription ?? "...", Colors.black87),
        ),
      ),
    );
  }
}
