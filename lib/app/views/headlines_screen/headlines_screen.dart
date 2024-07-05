// lib/screens/headlines_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/app/views/headlines_screen/headline_controller.dart';


class HeadlinesScreen extends StatelessWidget {
  final HeadlinesController controller = Get.put(HeadlinesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Headlines')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.headlines.length,
          itemBuilder: (context, index) {
            final article = controller.headlines[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  article.urlToImage != null
                      ? Image.network(article!.urlToImage??'')
                      : Image.asset('assets/placeholder.jpg'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article!.title??'',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article.description ?? ''),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
