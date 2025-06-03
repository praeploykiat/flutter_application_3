import 'package:flutter/material.dart';
import 'package:flutter_application_3/services/news_service.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> newsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadNews();
  }

  void loadNews() async {
    final news = await NewsService.fetchNews();
    setState(() {
      newsList = news;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsList.length /*.clamp(0, 5)*/,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: news['urlToImage'] != null
                        ? Image.network(
                            news['urlToImage'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.broken_image, size: 60),
                          )
                        // CachedNetworkImage(
                        //   imageUrl: news['urlToImage'],
                        //   width: 100,
                        //   height: 100,
                        //   fit: BoxFit.cover,
                        //   placeholder: (context, url) =>
                        //       CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) =>
                        //       Icon(Icons.broken_image, size: 60),
                        // )
                        : Icon(Icons.image, size: 60),
                    title: Text(news['title'] ?? ''),
                    subtitle: Text(news['description'] ?? ''),
                  ),
                );
              },
            ),
    );
  }
}
