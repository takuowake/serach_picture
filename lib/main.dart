import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {

  List imageList = [];

  Future<void> fetchImages() async{
    Response response = await Dio().get(
      'https://pixabay.com/api/?key=24021630-1dbd0d65ae735ec8dfe6567fe&q=yellow+flowers&image_type=photo&pretty=true',
    );
    imageList = response.data['hits'];
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
            Map<String, dynamic> image = imageList[index];
            return Image.network(image['previewURL']);
        },
      )
    );
  }
}

