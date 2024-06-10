import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  static Future loadJson() async {
    final String response = await rootBundle.loadString("recommend.json");
    final data = await json.decode(response);
    return data['recommend'];
  }

  Future recommendList = loadJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommend"),
      ),
      body: Container(
        child: FutureBuilder(
          future: recommendList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "${snapshot.data[index]['id']}:${snapshot.data[index]['username']}",
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
